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
  public testMethod(a: number, b: string): string {
    return "test" + a.toString() + ":" + b;
  }
}

class MyClass007 {
  public testMethod(): string {
    return "test";
  }
}

class OtherClass008 {
}

class InvokeObjectParam {
  public name: string = 'test';
}

class MyClass011 {
  public testMethod(): string {
    return "test";
  }
}

class MyClass012 {
  public testMethod(a: number): string {
    return "test100";
  }
}

class MyClass013 {
  public testMethod(a: number): string {
    return "test100";
  }
}

class MyClass015 {
  public returnNumber(): number {
    return 123;
  }
}

class MyClass016 {
  public returnBoolean(): boolean {
    return true;
  }
}

class MyClass017 {
  public returnObject(): InvokeObjectParam {
    return new InvokeObjectParam();
  }
}

class MyClass018 {
  public voidMethod(): void {
  }
}

class MyClass019 {
  public async asyncMethod(): Promise<string> {
    return "async result";
  }
}

class MyClass021 {
  public singleParam(a: number): number {
    return a * 2;
  }
}

class MyClass022 {
  public multiParams(a: number, b: string, c: boolean): string {
    return a.toString() + ":" + b + ":" + c.toString();
  }
}

class MyClass023 {
  public optionalParam(a: number, b?: string): string {
    if (b !== undefined) {
      return a.toString() + ":" + b;
    }
    return a.toString() + ":default";
  }
}

class MyClass024 {
  public returnNull(): null {
    return null;
  }
}

class MyClass025 {
  public returnUndefined(): undefined {
    return undefined;
  }
}

class MyClass028 {
  public publicMethod(): string {
    return "public";
  }
}

class ParentClass031 {
  public parentMethod(): string {
    return "parent";
  }
}

class ParentClass032 {
  public overrideMethod(): string {
    return "parent";
  }
}

class ChildClass032 extends ParentClass032 {
  public override overrideMethod(): string {
    return "child";
  }
}

class MyClass033 {
  public add(a: number, b: number): number {
    return a + b;
  }

  public multiply(a: number, b: number): number {
    return a * b;
  }
}

class MyClass034 {
  private _value: number = 0;

  public setValue(v: number): MyClass034 {
    this._value = v;
    return this;
  }

  public getValue(): number {
    return this._value;
  }

  public multiply(v: number): MyClass034 {
    this._value *= v;
    return this;
  }
}

class Calculator035 {
  public add(a: number, b: number): number {
    return a + b;
  }

  public subtract(a: number, b: number): number {
    return a - b;
  }
}

class MyClass037 {
  public testNumber(n: number): number {
    return n;
  }

  public testString(s: string): string {
    return s;
  }

  public testBoolean(b: boolean): boolean {
    return b;
  }
}

class MyClass038 {
  public processObject(obj: InvokeObjectParam): string {
    return obj.name;
  }
}

class MyClass039 {
  public processArray(arr: number[]): number {
    return arr.length;
  }
}

class MyClass040 {
  private _value: number = 42;

  public get value(): number {
    return this._value;
  }
}

class MyClass041 {
  private _value: number = 0;

  public set value(v: number) {
    this._value = v;
  }

  public get value(): number {
    return this._value;
  }
}

class MyClass044 {
  private value: number;

  constructor(value: number) {
    this.value = value;
  }

  public getValue(): number {
    return this.value;
  }
}

class MyClass045 {
  public final finalMethod(): string {
    return "final-result";
  }
}

class MyClass050 {
  public throwMethod(): void {
    throw new Error('invoke-error');
  }
}

class MyClass051 {
  public value: number = 0;

  public setValue(v: number): void {
    this.value = v;
  }

  public getValue(): number {
    return this.value;
  }
}

class MyClass052 {
  public returnBigInt(): bigint {
    return 100n;
  }
}

class MyClass053 {
  public returnMap(): Map<string, number> {
    let m = new Map<string, number>();
    m.set('key', 100);
    return m;
  }
}

class MyClass054 {
  public returnSet(): Set<number> {
    let s = new Set<number>();
    s.add(1);
    s.add(2);
    return s;
  }
}

class MyClass055 {
  public concatStrings(a: string, b: string, c: string): string {
    return a + b + c;
  }
}

class MyClass056 {
  public returnDate(): Date {
    return new Date(2026, 0, 1);
  }
}

class ParentClass057 {
  public sharedMethod(): string {
    return 'parent-shared';
  }
}

class ChildClass057 extends ParentClass057 {
}

class MyClass058 {
  public compute(a: number, b: number, c: number): number {
    return a * b + c;
  }
}

class MyClass059 {
  public methodA(): string {
    return 'A';
  }

  public methodB(): string {
    return 'B';
  }
}

class MyClass060 {
  public acceptBoolean(b: boolean): boolean {
    return !b;
  }
}

class MyClass061 {
  public static staticMethod(): string {
    return 'static';
  }

  public instanceMethod(): string {
    return 'instance';
  }
}

export default function InstanceMethodInvokeTest(): void {
  describe('InstanceMethodInvokeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0001
     * @tc.name testInstanceMethodInvoke0001
     * @tc.desc Verify passing thisObj invokes an instance method successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass001();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('testMethod');
      let result = method!.invoke(obj) as string;
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0002
     * @tc.name testInstanceMethodInvoke0002
     * @tc.desc Verify calling a method with the args parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass003();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('testMethod');
      let numArg: number = 100;
      let args: FixedArray<Object> = [numArg, "hello"];
      let result = method!.invoke(obj, args) as string;
      expect(result).assertEqual("test100:hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0003
     * @tc.name testInstanceMethodInvoke0003
     * @tc.desc Verify passing an incompatible object as thisObj throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let method = cls.getInstanceMethod('testMethod');
      let otherObj = new OtherClass008();
      try {
        method!.invoke(otherObj);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0004
     * @tc.name testInstanceMethodInvoke0004
     * @tc.desc Verify passing an empty array to call a no-arg method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass011();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('testMethod');
      let args: FixedArray<Object> = [];
      let result = method!.invoke(obj, args) as string;
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0005
     * @tc.name testInstanceMethodInvoke0005
     * @tc.desc Verify mismatched args count throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass012();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('testMethod');

      let args1: FixedArray<Object> = [];
      try {
        method!.invoke(obj, args1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }

      let args2: FixedArray<Object> = [100, 200, 300];
      try {
        method!.invoke(obj, args2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0006
     * @tc.name testInstanceMethodInvoke0006
     * @tc.desc Verify mismatched args type throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass013();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('testMethod');

      let args: FixedArray<Object> = ["test"];
      try {
        method!.invoke(obj, args);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0007
     * @tc.name testInstanceMethodInvoke0007
     * @tc.desc Verify a method returning number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass015();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('returnNumber');
      let result = method!.invoke(obj) as number;
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0008
     * @tc.name testInstanceMethodInvoke0008
     * @tc.desc Verify a method returning boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass016();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('returnBoolean');
      let result = method!.invoke(obj) as boolean;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0009
     * @tc.name testInstanceMethodInvoke0009
     * @tc.desc Verify a method returning object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass017();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('returnObject');
      let result = method!.invoke(obj) as InvokeObjectParam;
      expect(result.name).assertEqual('test');
      expect(Class.of(result).getName()).assertEqual(Class.from<InvokeObjectParam>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0010
     * @tc.name testInstanceMethodInvoke0010
     * @tc.desc Verify that a void method returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass018();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('voidMethod');
      let result = method!.invoke(obj) as undefined;
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0011
     * @tc.name testInstanceMethodInvoke0011
     * @tc.desc Verify invoking an async method resolves to the expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let obj = new MyClass019();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('asyncMethod');
      let resultPromise = method!.invoke(obj) as Promise<string>;
      let result = await resultPromise;
      expect(result).assertEqual("async result");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0012
     * @tc.name testInstanceMethodInvoke0012
     * @tc.desc Verify a method with a single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass021();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('singleParam');
      let numArg: number = 21;
      let args: FixedArray<Object> = [numArg];
      let result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0013
     * @tc.name testInstanceMethodInvoke0013
     * @tc.desc Verify a method with multiple parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass022();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('multiParams');
      let numArg: number = 100;
      let args: FixedArray<Object> = [numArg, "test", true];
      let result = method!.invoke(obj, args) as string;
      expect(result).assertEqual("100:test:true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0014
     * @tc.name testInstanceMethodInvoke0014
     * @tc.desc Verify invoke passes the provided optional parameter value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass023();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('optionalParam');

      let numArg: number = 100;
      let args2: FixedArray<Object> = [numArg, "custom"];
      let result2 = method!.invoke(obj, args2) as string;
      expect(result2).assertEqual("100:custom");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0015
     * @tc.name testInstanceMethodInvoke0015
     * @tc.desc Verify a method returning null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass024();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('returnNull');
      let result = method!.invoke(obj) as null;
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0016
     * @tc.name testInstanceMethodInvoke0016
     * @tc.desc Verify a method returning undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass025();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('returnUndefined');
      let result = method!.invoke(obj) as undefined;
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0017
     * @tc.name testInstanceMethodInvoke0017
     * @tc.desc Verify that calling a public method via invoke works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass028();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('publicMethod');
      let result = method!.invoke(obj) as string;
      expect(result).assertEqual("public");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0018
     * @tc.name testInstanceMethodInvoke0018
     * @tc.desc Verify calling a parent class method via its declaring object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ParentClass031();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('parentMethod');
      let result = method!.invoke(obj) as string;
      expect(result).assertEqual("parent");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0019
     * @tc.name testInstanceMethodInvoke0019
     * @tc.desc Verify calling an overridden method in a child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childObj = new ChildClass032();
      let childCls = Class.of(childObj);
      let method = childCls.getInstanceMethod('overrideMethod');
      let result = method!.invoke(childObj) as string;
      expect(result).assertEqual("child");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0020
     * @tc.name testInstanceMethodInvoke0020
     * @tc.desc Verify dynamic method invocation using invoke()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass033();
      let cls = Class.of(obj);

      let methodName = "add";
      let method = cls.getInstanceMethod(methodName);
      let a: number = 10;
      let b: number = 20;
      let args: FixedArray<Object> = [a, b];
      let result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0021
     * @tc.name testInstanceMethodInvoke0021
     * @tc.desc Verify method call chaining via invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass034();
      let cls = Class.of(obj);

      let setValueMethod = cls.getInstanceMethod('setValue');
      let multiplyMethod = cls.getInstanceMethod('multiply');
      let getValueMethod = cls.getInstanceMethod('getValue');

      let v1: number = 5;
      let args1: FixedArray<Object> = [v1];
      let chainedObj = setValueMethod!.invoke(obj, args1) as MyClass034;
      let valueAfterSet = getValueMethod!.invoke(chainedObj) as number;
      expect(valueAfterSet).assertEqual(5);

      let v2: number = 2;
      let args2: FixedArray<Object> = [v2];
      let multipliedObj = multiplyMethod!.invoke(chainedObj, args2) as MyClass034;
      let valueAfterMultiply = getValueMethod!.invoke(multipliedObj) as number;
      expect(valueAfterMultiply).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0022
     * @tc.name testInstanceMethodInvoke0022
     * @tc.desc Verify reflective method invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc = new Calculator035();
      let cls = Class.of(calc);

      let operations = ['add', 'subtract'];
      let a: number = 10;
      let b: number = 5;

      for (let i = 0; i < operations.length; i++) {
        let method = cls.getInstanceMethod(operations[i]);
        let args: FixedArray<Object> = [a, b];
        let result = method!.invoke(calc, args) as number;
        if (operations[i] === 'add') {
          expect(result).assertEqual(15);
        } else {
          expect(result).assertEqual(5);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0023
     * @tc.name testInstanceMethodInvoke0023
     * @tc.desc Verify passing various basic type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass037();
      let cls = Class.of(obj);

      let numMethod = cls.getInstanceMethod('testNumber');
      let numArg: number = 123;
      let args1: FixedArray<Object> = [numArg];
      let result1 = numMethod!.invoke(obj, args1) as number;
      expect(result1).assertEqual(123);

      let strMethod = cls.getInstanceMethod('testString');
      let args2: FixedArray<Object> = ["hello"];
      let result2 = strMethod!.invoke(obj, args2) as string;
      expect(result2).assertEqual("hello");

      let boolMethod = cls.getInstanceMethod('testBoolean');
      let args3: FixedArray<Object> = [true];
      let result3 = boolMethod!.invoke(obj, args3) as boolean;
      expect(result3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0024
     * @tc.name testInstanceMethodInvoke0024
     * @tc.desc Verify passing an object as a parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass038();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('processObject');
      let args: FixedArray<Object> = [new InvokeObjectParam()];
      let result = method!.invoke(obj, args) as string;
      expect(result).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0025
     * @tc.name testInstanceMethodInvoke0025
     * @tc.desc Verify passing an array as a parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass039();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('processArray');
      let args: FixedArray<Object> = [[1, 2, 3, 4, 5]];
      let result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0026
     * @tc.name testInstanceMethodInvoke0026
     * @tc.desc Verify calling a getter via invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass040();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('%%get-value');
      let result = method!.invoke(obj) as number;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0027
     * @tc.name testInstanceMethodInvoke0027
     * @tc.desc Verify calling a setter via invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass041();
      let cls = Class.of(obj);
      let setter = cls.getInstanceMethod('%%set-value');
      let getter = cls.getInstanceMethod('%%get-value');

      let v: number = 100;
      let args: FixedArray<Object> = [v];
      setter!.invoke(obj, args);

      let result = getter!.invoke(obj) as number;
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0028
     * @tc.name testInstanceMethodInvoke0028
     * @tc.desc Verify that different objects calling the same method return their respective results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyClass044(10);
      let obj2 = new MyClass044(20);
      let cls = Class.of(obj1);
      let method = cls.getInstanceMethod('getValue');

      let result1 = method!.invoke(obj1) as number;
      let result2 = method!.invoke(obj2) as number;
      expect(result1).assertEqual(10);
      expect(result2).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0029
     * @tc.name testInstanceMethodInvoke0029
     * @tc.desc Verify that invoke throws TypeError when the thisObj class cannot resolve the non-virtual instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass031>();
      let method = parentCls.getInstanceMethod('parentMethod');
      let unrelatedObj = new OtherClass008();
      try {
        method!.invoke(unrelatedObj);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0030
     * @tc.name testInstanceMethodInvoke0030
     * @tc.desc Verify invoke with null thisObj throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue invoke with null thisObj throws ClassCastError instead of TypeError as documented.
     */
    it('testInstanceMethodInvoke0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      try {
        method!.invoke(null as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0031
     * @tc.name testInstanceMethodInvoke0031
     * @tc.desc Verify invoking a final method via reflect works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass045();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('finalMethod');
      let result = method!.invoke(obj) as string;
      expect(result).assertEqual("final-result");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0032
     * @tc.name testInstanceMethodInvoke0032
     * @tc.desc Verify invoking a method with fewer args than required (including optional) throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass023();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('optionalParam');
      let args: FixedArray<Object> = [100];
      try {
        method!.invoke(obj, args);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0033
     * @tc.name testInstanceMethodInvoke0033
     * @tc.desc Verify invoke with undefined thisObj throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue invoke with undefined thisObj throws ClassCastError instead of TypeError as documented.
     */
    it('testInstanceMethodInvoke0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      try {
        method!.invoke(undefined as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0034
     * @tc.name testInstanceMethodInvoke0034
     * @tc.desc Verify invoking a method obtained via getInstanceMethod with parameter type signature overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue getInstanceMethod with parameter type signature overload returns undefined, causing NullPointerError.
     */
    it('testInstanceMethodInvoke0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass003();
      let cls = Class.from<MyClass003>();
      let paramTypes: FixedArray<Class> = [Class.from<number>(), Class.from<string>()];
      let method = cls.getInstanceMethod('testMethod', paramTypes);
      if (method !== undefined && method !== null) {
        let args: FixedArray<Object> = [100, "hello"];
        let result = method!.invoke(obj, args) as string;
        expect(result).assertEqual("test100:hello");
      } else {
        expect(method).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0035
     * @tc.name testInstanceMethodInvoke0035
     * @tc.desc Verify that invoke propagates exceptions thrown inside the method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass050();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('throwMethod');
      try {
        method!.invoke(obj);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('invoke-error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0036
     * @tc.name testInstanceMethodInvoke0036
     * @tc.desc Verify that this context is correct when invoking instance methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass051();
      let cls = Class.of(obj);
      let setMethod = cls.getInstanceMethod('setValue');
      let getMethod = cls.getInstanceMethod('getValue');
      let numVal: number = 42;
      let args: FixedArray<Object> = [numVal];
      setMethod!.invoke(obj, args);
      let result = getMethod!.invoke(obj) as number;
      expect(result).assertEqual(numVal);
      expect(obj.value).assertEqual(numVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0037
     * @tc.name testInstanceMethodInvoke0037
     * @tc.desc Verify invoking a method that returns bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass052();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('returnBigInt');
      let result = method!.invoke(obj) as bigint;
      expect(result).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0038
     * @tc.name testInstanceMethodInvoke0038
     * @tc.desc Verify invoking a method that returns Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass053();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('returnMap');
      let result = method!.invoke(obj) as Map<string, number>;
      expect(result.get('key')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0039
     * @tc.name testInstanceMethodInvoke0039
     * @tc.desc Verify invoking a method that returns Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass054();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('returnSet');
      let result = method!.invoke(obj) as Set<number>;
      expect(result.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0040
     * @tc.name testInstanceMethodInvoke0040
     * @tc.desc Verify invoking a method with three string parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass055();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('concatStrings');
      let args: FixedArray<Object> = ["Hello", " ", "World"];
      let result = method!.invoke(obj, args) as string;
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0041
     * @tc.name testInstanceMethodInvoke0041
     * @tc.desc Verify invoking a method that returns Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass056();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('returnDate');
      let result = method!.invoke(obj) as Date;
      expect(result.getFullYear()).assertEqual(2026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0042
     * @tc.name testInstanceMethodInvoke0042
     * @tc.desc Verify invoking an inherited method from child class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodInvoke0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ChildClass057();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('sharedMethod');
      if (method !== undefined) {
        let result = method!.invoke(obj) as string;
        expect(result).assertEqual('parent-shared');
      } else {
        expect(method).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0043
     * @tc.name testInstanceMethodInvoke0043
     * @tc.desc Verify invoking a method with three integer parameters and arithmetic logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass058();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('compute');
      let a: number = 3;
      let b: number = 4;
      let c: number = 5;
      let args: FixedArray<Object> = [a, b, c];
      let result = method!.invoke(obj, args) as number;
      expect(result).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0044
     * @tc.name testInstanceMethodInvoke0044
     * @tc.desc Verify invoking different methods on the same object yields different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass059();
      let cls = Class.of(obj);
      let methodA = cls.getInstanceMethod('methodA');
      let methodB = cls.getInstanceMethod('methodB');
      let resultA = methodA!.invoke(obj) as string;
      let resultB = methodB!.invoke(obj) as string;
      expect(resultA).assertEqual('A');
      expect(resultB).assertEqual('B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0045
     * @tc.name testInstanceMethodInvoke0045
     * @tc.desc Verify invoking a method with a boolean parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass060();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('acceptBoolean');
      let args: FixedArray<Object> = [false];
      let result = method!.invoke(obj, args) as boolean;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0046
     * @tc.name testInstanceMethodInvoke0046
     * @tc.desc Verify method handle remains valid after being passed through closures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass001();
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod('testMethod');
      let delayedMethod = method;
      let captureClosure = () => {
        return delayedMethod;
      };
      let capturedMethod = captureClosure();
      let result = capturedMethod!.invoke(obj) as string;
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_INVOKE_0047
     * @tc.name testInstanceMethodInvoke0047
     * @tc.desc Verify that static methods are not accessible via getInstanceMethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodInvoke0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass061>();
      let instanceMethod = cls.getInstanceMethod('instanceMethod');
      let obj = new MyClass061();
      let result = instanceMethod!.invoke(obj) as string;
      expect(result).assertEqual('instance');
      let staticMethod = cls.getInstanceMethod('staticMethod');
      expect(staticMethod).assertUndefined();
    });

  });
}
