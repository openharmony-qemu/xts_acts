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
  public testMethod(a: number, b: string): void {
  }
}

class MyClass003 {
  public noParams(): void {
  }

  public oneParam(a: number): void {
  }

  public twoParams(a: number, b: string): void {
  }

  public threeParams(a: number, b: string, c: boolean): void {
  }

  public manyParams(a: number, b: string, c: boolean, d: number, e: string): void {
  }
}

class MyClass004 {
  public numberParam(a: number): void {
  }

  public stringParam(a: string): void {
  }

  public booleanParam(a: boolean): void {
  }
}

class MyClass005 {
  public intParam(a: number): void {
  }
}

class MyClass006 {
  public charParam(a: char): void {
  }
}

class ParamClass007 {
}

class MyClass007 {
  public objectParam(a: ParamClass007): void {
  }
}

interface MyInterface008 {}

class MyClass008 {
  public interfaceParam(a: MyInterface008): void {
  }
}

class MyClass009 {
  public arrayParam(a: number[]): void {
  }

  public stringArrayParam(a: string[]): void {
  }
}

class MyClass010 {
  public optionalParam(a: number, b?: string): void {
  }

  public multipleOptional(a: number, b?: string, c?: boolean): void {
  }
}

class MyClass011 {
  public optionalParam(a: number, b?: string): void {
  }
}

class MyClass012 {
  public restParam(...args: number[]): void {
  }

  public mixedRest(a: string, ...args: number[]): void {
  }
}

class MyClass013 {
  public genericMethod<T>(param: T): void {
  }

  public multipleGeneric<T, U>(a: T, b: U): void {
  }
}

class GenericClass014<T> {
  public method(param: T): void {
  }
}

class MyClass015 {
  public unionParam(a: string | number): void {
  }

  public multipleUnion(a: string | number | boolean): void {
  }
}

class MyClass018 {
  public testMethod(a: number, b: string): boolean {
    return true;
  }
}

class MyClass019 {
  public testMethod(a: number): void {
  }
}

class ParentClass025 {
  public parentMethod(a: number, b: string): void {
  }
}

class ParentClass026 {
  public overrideMethod(a: number): void {
  }
}

class ChildClass026 extends ParentClass026 {
  public override overrideMethod(a: number): void {
  }
}

class MyClass028 {
  public noParams(): void {
  }

  public oneParam(a: number): void {
  }

  public multipleParams(a: number, b: string, c: boolean): void {
  }
}

class MyClass031 {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }
}

class MyClass032 {
  private _value: number = 0;

  set value(v: number) {
    this._value = v;
  }
}

class MyClass033 {
  public testMethod(a: number, b: string): void {
  }
}

class MyClass036 {
  public method1(a: number, b: string): void {
  }

  public method2(a: number, b: string): void {
  }

  public method3(a: string, b: number): void {
  }
}

class MyClass038 {
  public destructureParam(): void {
  }
}

class MyClass039 {
  public callbackParam(callback: () => void): void {
  }

  public callbackWithParam(callback: (x: number) => string): void {
  }
}

class MyClass040 {
  public promiseParam(p: Promise<string>): void {
  }

  public multiplePromise(p1: Promise<number>, p2: Promise<string>): void {
  }
}

class MyClass043 {
  public orderedMethod(a: number, b: string, c: boolean): void {
  }
}

class MyClass044 {
  public sameTypes(a: number, b: number, c: number): void {
  }
}

class MyClass045 {
  public differentTypes(a: number, b: string, c: boolean): void {
  }
}

class MyClass050 {
  public mapParam(m: Map<string, number>): void {
  }

  public setParam(s: Set<number>): void {
  }
}

class MyClass051 {
  public dateParam(d: Date): void {
  }

  public regExpParam(r: RegExp): void {
  }
}

class MyClass052 {
  public errorParam(e: Error): void {
  }
}

class MyClass053 {
  public arrayBufferParam(ab: ArrayBuffer): void {
  }

  public int32ArrayParam(arr: Int32Array): void {
  }
}

class MyClass054 {
  public tupleParam(t: [string, number]): void {
  }
}

class MyClass055 {
  public objectParam(o: object): void {
  }
}

class MyClass056 {
  public bigintParam(b: bigint): void {
  }
}

class EmptyClass057 {
}

class MyClass058 {
  public async asyncMethod(a: number, b: string): Promise<void> {
  }
}

abstract class AbstractClass059 {
  public abstract abstractMethod(a: number, b: string): void;
}

class ParentClass060 {
  public parentMethod(a: number, b: string): void {
  }
}

class ChildClass060 extends ParentClass060 {
}

class MyClass061 {
  public testMethod(a: number, b: string, c: boolean): void {
  }
}

class MyClass062 {
  public overloadedMethod(a: number): void {
  }
  public overloadedMethod(a: string): void {
  }
}


class ParamTypesClass060 {
  public basicTypes(a: number, b: string, c: boolean): void {
  }
}

class CustomType061 {
}

class ParamTypesClass061 {
  public customTypeParam(a: CustomType061): void {
  }
}

export default function InstanceMethodGetParameterTypesTest(): void {
  describe('InstanceMethodGetParameterTypesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0001
     * @tc.name testInstanceMethodGetParameterTypes0001
     * @tc.desc Verify that a normal call returns all parameter types in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual('f64');
      expect(paramTypes[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0002
     * @tc.name testInstanceMethodGetParameterTypes0002
     * @tc.desc Verify methods with different parameter counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();

      let noParamsMethod = cls.getInstanceMethod('noParams');
      expect(noParamsMethod!.getParameterTypes().length).assertEqual(0);

      let oneParamMethod = cls.getInstanceMethod('oneParam');
      expect(oneParamMethod!.getParameterTypes().length).assertEqual(1);

      let twoParamsMethod = cls.getInstanceMethod('twoParams');
      expect(twoParamsMethod!.getParameterTypes().length).assertEqual(2);

      let threeParamsMethod = cls.getInstanceMethod('threeParams');
      expect(threeParamsMethod!.getParameterTypes().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0003
     * @tc.name testInstanceMethodGetParameterTypes0003
     * @tc.desc Verify basic types as parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();

      let numMethod = cls.getInstanceMethod('numberParam');
      expect(numMethod!.getParameterTypes()[0].getName()).assertEqual('f64');

      let strMethod = cls.getInstanceMethod('stringParam');
      expect(strMethod!.getParameterTypes()[0].getName()).assertEqual('std.core.String');

      let boolMethod = cls.getInstanceMethod('booleanParam');
      expect(boolMethod!.getParameterTypes()[0].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0004
     * @tc.name testInstanceMethodGetParameterTypes0004
     * @tc.desc Verify number type as a parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let method = cls.getInstanceMethod('intParam');
      expect(method!.getParameterTypes()[0].getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0005
     * @tc.name testInstanceMethodGetParameterTypes0005
     * @tc.desc Verify char type as a parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      let method = cls.getInstanceMethod('charParam');
      let paramType = method!.getParameterTypes()[0];
      expect(paramType.getName()).assertEqual('u16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0006
     * @tc.name testInstanceMethodGetParameterTypes0006
     * @tc.desc Verify a custom class as a parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let method = cls.getInstanceMethod('objectParam');
      expect(method!.getParameterTypes()[0].getName()).assertEqual(Class.from<ParamClass007>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0007
     * @tc.name testInstanceMethodGetParameterTypes0007
     * @tc.desc Verify an interface type as a parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let method = cls.getInstanceMethod('interfaceParam');
      let paramType = method!.getParameterTypes()[0];
      expect(paramType.isInterface()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0008
     * @tc.name testInstanceMethodGetParameterTypes0008
     * @tc.desc Verify array types as parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();

      let arrMethod = cls.getInstanceMethod('arrayParam');
      expect(arrMethod!.getParameterTypes()[0].getName()).assertEqual('std.core.Array');

      let strArrMethod = cls.getInstanceMethod('stringArrayParam');
      expect(strArrMethod!.getParameterTypes()[0].getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0009
     * @tc.name testInstanceMethodGetParameterTypes0009
     * @tc.desc Verify methods containing optional parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();

      let optMethod = cls.getInstanceMethod('optionalParam');
      let paramTypes1 = optMethod!.getParameterTypes();
      expect(paramTypes1.length).assertEqual(2);

      let multiOptMethod = cls.getInstanceMethod('multipleOptional');
      let paramTypes2 = multiOptMethod!.getParameterTypes();
      expect(paramTypes2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0010
     * @tc.name testInstanceMethodGetParameterTypes0010
     * @tc.desc Verify the types of optional parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let method = cls.getInstanceMethod('optionalParam');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes[0].getName()).assertEqual('f64');
      expect(paramTypes[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0011
     * @tc.name testInstanceMethodGetParameterTypes0011
     * @tc.desc Verify methods containing rest parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();

      let restMethod = cls.getInstanceMethod('restParam');
      let paramTypes1 = restMethod!.getParameterTypes();
      expect(paramTypes1.length).assertEqual(1);
      expect(paramTypes1[0].getName()).assertEqual('std.core.Array');

      let mixedMethod = cls.getInstanceMethod('mixedRest');
      let paramTypes2 = mixedMethod!.getParameterTypes();
      expect(paramTypes2.length).assertEqual(2);
      expect(paramTypes2[0].getName()).assertEqual('std.core.String');
      expect(paramTypes2[1].getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0012
     * @tc.name testInstanceMethodGetParameterTypes0012
     * @tc.desc Verify parameter types of generic methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();

      let genMethod = cls.getInstanceMethod('genericMethod');
      let paramTypes1 = genMethod!.getParameterTypes();
      expect(paramTypes1.length).assertEqual(1);

      let multiGenMethod = cls.getInstanceMethod('multipleGeneric');
      let paramTypes2 = multiGenMethod!.getParameterTypes();
      expect(paramTypes2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0013
     * @tc.name testInstanceMethodGetParameterTypes0013
     * @tc.desc Verify parameter types of generic class methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass014<number>>();
      let method = cls.getInstanceMethod('method');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0014
     * @tc.name testInstanceMethodGetParameterTypes0014
     * @tc.desc Verify union types as parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();

      let unionMethod = cls.getInstanceMethod('unionParam');
      let paramTypes1 = unionMethod!.getParameterTypes();
      expect(paramTypes1.length).assertEqual(1);

      let multiUnionMethod = cls.getInstanceMethod('multipleUnion');
      let paramTypes2 = multiUnionMethod!.getParameterTypes();
      expect(paramTypes2.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0015
     * @tc.name testInstanceMethodGetParameterTypes0015
     * @tc.desc Verify a method with many parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let method = cls.getInstanceMethod('manyParams');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0016
     * @tc.name testInstanceMethodGetParameterTypes0016
     * @tc.desc Verify using getParameterTypes() together with getReturnType()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>();
      let method = cls.getInstanceMethod('testMethod');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(method!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0017
     * @tc.name testInstanceMethodGetParameterTypes0017
     * @tc.desc Verify using getParameterTypes() together with getOwner()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      let method = cls.getInstanceMethod('testMethod');
      let paramTypes = method!.getParameterTypes();
      expect(method!.getOwner().getName()).assertEqual(Class.from<MyClass019>().getName());
      expect(paramTypes.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0018
     * @tc.name testInstanceMethodGetParameterTypes0018
     * @tc.desc Verify parameter types of a method declared on a parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentClass025>();
      let method = cls.getInstanceMethod('parentMethod');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual('f64');
      expect(paramTypes[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0019
     * @tc.name testInstanceMethodGetParameterTypes0019
     * @tc.desc Verify parameter types of an overridden method in a child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass026>();
      let childMethod = childCls.getInstanceMethod('overrideMethod');
      let paramTypes = childMethod!.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
      expect(paramTypes[0].getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0020
     * @tc.name testInstanceMethodGetParameterTypes0020
     * @tc.desc Verify various parameter types of instance methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass028>();

      let noParams = cls.getInstanceMethod('noParams');
      expect(noParams!.getParameterTypes().length).assertEqual(0);

      let oneParam = cls.getInstanceMethod('oneParam');
      let oneParamTypes = oneParam!.getParameterTypes();
      expect(oneParamTypes.length).assertEqual(1);
      expect(oneParamTypes[0].getName()).assertEqual('f64');

      let multiParams = cls.getInstanceMethod('multipleParams');
      let multiParamTypes = multiParams!.getParameterTypes();
      expect(multiParamTypes.length).assertEqual(3);
      expect(multiParamTypes[0].getName()).assertEqual('f64');
      expect(multiParamTypes[1].getName()).assertEqual('std.core.String');
      expect(multiParamTypes[2].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0021
     * @tc.name testInstanceMethodGetParameterTypes0021
     * @tc.desc Verify parameter types of a getter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.getName()).assertEqual('%%get-value');
      expect(getter!.getParameterTypes().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0022
     * @tc.name testInstanceMethodGetParameterTypes0022
     * @tc.desc Verify parameter types of a setter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass032>();
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.getName()).assertEqual('%%set-value');
      let paramTypes = setter!.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
      expect(paramTypes[0].getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0023
     * @tc.name testInstanceMethodGetParameterTypes0023
     * @tc.desc Verify using getParameterTypes() for parameter type checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass033>();
      let method = cls.getInstanceMethod('testMethod');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes[0].getName()).assertEqual('f64');
      expect(paramTypes[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0024
     * @tc.name testInstanceMethodGetParameterTypes0024
     * @tc.desc Verify comparing method signatures using getParameterTypes()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass036>();
      let method1 = cls.getInstanceMethod('method1');
      let method2 = cls.getInstanceMethod('method2');
      let method3 = cls.getInstanceMethod('method3');

      let params1 = method1!.getParameterTypes();
      let params2 = method2!.getParameterTypes();
      let params3 = method3!.getParameterTypes();

      expect(params1[0].getName()).assertEqual('f64');
      expect(params1[1].getName()).assertEqual('std.core.String');
      expect(params2[0].getName()).assertEqual('f64');
      expect(params2[1].getName()).assertEqual('std.core.String');
      expect(params3[0].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0025
     * @tc.name testInstanceMethodGetParameterTypes0025
     * @tc.desc Verify a no-parameter method named destructureParam returns empty parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass038>();
      let method = cls.getInstanceMethod('destructureParam');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0026
     * @tc.name testInstanceMethodGetParameterTypes0026
     * @tc.desc Verify function type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass039>();

      let cbMethod = cls.getInstanceMethod('callbackParam');
      let paramTypes = cbMethod!.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);

      let cbWithParam = cls.getInstanceMethod('callbackWithParam');
      let paramTypes2 = cbWithParam!.getParameterTypes();
      expect(paramTypes2.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0027
     * @tc.name testInstanceMethodGetParameterTypes0027
     * @tc.desc Verify Promise type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass040>();

      let promiseMethod = cls.getInstanceMethod('promiseParam');
      let paramTypes = promiseMethod!.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
      expect(paramTypes[0].getName()).assertEqual('std.core.Promise');

      let multiPromise = cls.getInstanceMethod('multiplePromise');
      let paramTypes2 = multiPromise!.getParameterTypes();
      expect(paramTypes2.length).assertEqual(2);
      expect(paramTypes2[0].getName()).assertEqual('std.core.Promise');
      expect(paramTypes2[1].getName()).assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0028
     * @tc.name testInstanceMethodGetParameterTypes0028
     * @tc.desc Verify the order of parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass043>();
      let method = cls.getInstanceMethod('orderedMethod');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes[0].getName()).assertEqual('f64');
      expect(paramTypes[1].getName()).assertEqual('std.core.String');
      expect(paramTypes[2].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0029
     * @tc.name testInstanceMethodGetParameterTypes0029
     * @tc.desc Verify multiple parameters of the same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass044>();
      let method = cls.getInstanceMethod('sameTypes');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(3);
      expect(paramTypes[0].getName()).assertEqual('f64');
      expect(paramTypes[1].getName()).assertEqual('f64');
      expect(paramTypes[2].getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0030
     * @tc.name testInstanceMethodGetParameterTypes0030
     * @tc.desc Verify multiple parameters of different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass045>();
      let method = cls.getInstanceMethod('differentTypes');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(3);
      expect(paramTypes[0].getName()).assertEqual('f64');
      expect(paramTypes[1].getName()).assertEqual('std.core.String');
      expect(paramTypes[2].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0031
     * @tc.name testInstanceMethodGetParameterTypes0031
     * @tc.desc Verify Map and Set type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass050>();
      let mapMethod = cls.getInstanceMethod('mapParam');
      expect(mapMethod!.getParameterTypes()[0].getName()).assertEqual('std.core.Map');
      let setMethod = cls.getInstanceMethod('setParam');
      expect(setMethod!.getParameterTypes()[0].getName()).assertEqual('std.core.Set');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0032
     * @tc.name testInstanceMethodGetParameterTypes0032
     * @tc.desc Verify Date and RegExp type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass051>();
      let dateMethod = cls.getInstanceMethod('dateParam');
      expect(dateMethod!.getParameterTypes()[0].getName()).assertEqual('std.core.Date');
      let regExpMethod = cls.getInstanceMethod('regExpParam');
      expect(regExpMethod!.getParameterTypes()[0].getName()).assertEqual('std.core.RegExp');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0033
     * @tc.name testInstanceMethodGetParameterTypes0033
     * @tc.desc Verify Error type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass052>();
      let method = cls.getInstanceMethod('errorParam');
      expect(method!.getParameterTypes()[0].getName()).assertEqual('std.core.Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0034
     * @tc.name testInstanceMethodGetParameterTypes0034
     * @tc.desc Verify ArrayBuffer and Int32Array type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass053>();
      let abMethod = cls.getInstanceMethod('arrayBufferParam');
      expect(abMethod!.getParameterTypes()[0].getName()).assertEqual('std.core.ArrayBuffer');
      let arrMethod = cls.getInstanceMethod('int32ArrayParam');
      expect(arrMethod!.getParameterTypes()[0].getName()).assertEqual('std.core.Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0035
     * @tc.name testInstanceMethodGetParameterTypes0035
     * @tc.desc Verify tuple type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass054>();
      let method = cls.getInstanceMethod('tupleParam');
      expect(method!.getParameterTypes()[0].getName()).assertEqual('std.core.Tuple2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0036
     * @tc.name testInstanceMethodGetParameterTypes0036
     * @tc.desc Verify object type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass055>();
      let method = cls.getInstanceMethod('objectParam');
      expect(method!.getParameterTypes()[0].getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0037
     * @tc.name testInstanceMethodGetParameterTypes0037
     * @tc.desc Verify bigint type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass056>();
      let method = cls.getInstanceMethod('bigintParam');
      expect(method!.getParameterTypes()[0].getName()).assertEqual('std.core.BigInt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0038
     * @tc.name testInstanceMethodGetParameterTypes0038
     * @tc.desc Verify empty class has no methods to check parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass057>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0039
     * @tc.name testInstanceMethodGetParameterTypes0039
     * @tc.desc Verify parameter types of an async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass058>();
      let method = cls.getInstanceMethod('asyncMethod');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual('f64');
      expect(paramTypes[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0040
     * @tc.name testInstanceMethodGetParameterTypes0040
     * @tc.desc Verify parameter types of an abstract method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass059>();
      let method = cls.getInstanceMethod('abstractMethod');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual('f64');
      expect(paramTypes[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0041
     * @tc.name testInstanceMethodGetParameterTypes0041
     * @tc.desc Verify parameter types of an inherited method from child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodGetParameterTypes0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass060>();
      let method = childCls.getInstanceMethod('parentMethod');
      if (method !== undefined) {
        let paramTypes = method!.getParameterTypes();
        expect(paramTypes.length).assertEqual(2);
        expect(paramTypes[0].getName()).assertEqual('f64');
        expect(paramTypes[1].getName()).assertEqual('std.core.String');
      } else {
        expect(method).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0042
     * @tc.name testInstanceMethodGetParameterTypes0042
     * @tc.desc Verify consistency between getParameterTypes() and getParameterType(index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass061>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method!.getParameterTypes().length).assertEqual(3);
      Array.from(method!.getParameterTypes()).forEach((pt: Class, i: int): void => {
        expect(pt.getName()).assertEqual(method!.getParameterType(i)!.getName());
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0043
     * @tc.name testInstanceMethodGetParameterTypes0043
     * @tc.desc Verify getParameterTypes for overloaded methods returns distinct types per overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass062>();
      let matching = Array.from(cls.getInstanceMethods()).filter((method: reflect.InstanceMethod): boolean => {
        return method.getName() === 'overloadedMethod';
      });
      expect(matching.length >= 2).assertTrue();
      let types1 = matching[0].getParameterTypes();
      let types2 = matching[1].getParameterTypes();
      expect(types1.length).assertEqual(1);
      expect(types2.length).assertEqual(1);
      expect(types1[0].getName()).assertEqual('f64');
      expect(types2[0].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0044
     * @tc.name testInstanceMethodGetParameterTypes0044
     * @tc.desc Verify basic type params returned correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParamTypesClass060>();
      let method = cls.getInstanceMethod('basicTypes');
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(3);
      expect(types[0].getName()).assertEqual('f64');
      expect(types[1].getName()).assertEqual('std.core.String');
      expect(types[2].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPES_0045
     * @tc.name testInstanceMethodGetParameterTypes0045
     * @tc.desc Verify custom class type param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterTypes0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParamTypesClass061>();
      let method = cls.getInstanceMethod('customTypeParam');
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual(Class.from<CustomType061>().getName());
    });

  });
}
