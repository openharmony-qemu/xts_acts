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
  public testMethod(): void {
  }
}

class MyClass004 {
  private privateMethod(): void {
  }

  private anotherPrivate(): string {
    return 'test';
  }
}

class MyClass006 {
  protected protectedMethod(): void {
  }
}

class MyClass008 {
  private _value: number = 0;

  private get value(): number {
    return this._value;
  }

  private set value(v: number) {
    this._value = v;
  }
}

class ParentClass013 {
  private parentPrivateMethod(): void {
  }
}

class ChildClass013 extends ParentClass013 {
}

class ParentClass014 {
  public parentPublicMethod(): void {
  }

  protected parentProtectedMethod(): void {
  }
}

class ChildClass014 extends ParentClass014 {
}

class MyClass015 {
  public publicMethod(): void {
  }

  private privateMethod(): void {
  }

  protected protectedMethod(): void {
  }
}

class MyClass016 {
  public publicMethod(): void {
  }

  private privateMethod(): void {
  }
}

class MyClass020 {
  public publicMethod(): void {
  }

  protected protectedMethod(): void {
  }
}

class MyClass021 {
  private testMethod(): void {
  }
}

class MyClass030 {
  public returnNumber(): number {
    return 100;
  }

  public returnString(): string {
    return 'test';
  }

  public returnBoolean(): boolean {
    return true;
  }
}

class MyClass031 {
  public methodWithParams(a: number, b: string): void {
  }
}

class EmptyClass032 {
}

class MyClass033 {
  public method1(): void {
  }

  public method2(): string {
    return 'test';
  }

  public method3(a: number): boolean {
    return true;
  }
}

class ParentClass034 {
  public parentMethod(): void {
  }
}

class ChildClass034 extends ParentClass034 {
}

class MyClass035 {
  public async asyncMethod(): Promise<void> {
  }
}

class MyClass036 {
  public final finalMethod(): void {
  }
}

class MyClass037 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }
}

class MyClass038 {
  private privateMethodWithParams(a: number, b: string): void {
  }

  public publicMethod(): void {
  }
}

abstract class MyClass040 {
  public concreteMethod(): void {
  }

  public abstract abstractMethod(): void;
}

class ParentClass041 {
  public parentMethod041(): void {
  }
}

class ChildClass041 extends ParentClass041 {
  public childMethod041(): void {
  }
}

class MyClass042 {
  public genericMethod<T>(value: T): T {
    return value;
  }
}

class MyClass043 {
  public methodWithFiveParams(a: number, b: string, c: boolean, d: number, e: string): void {
  }
}

class MyClass044 {
  public publicMethod(): void {
  }
}

class MyClass045 {
  private privReturnNumber(): number {
    return 1;
  }

  private privReturnString(): string {
    return 'x';
  }

  private privReturnBoolean(): boolean {
    return true;
  }
}

class MyClass046 {
  protected protMethodOne(): void {
  }

  protected protMethodTwo(): void {
  }
}

class MyClass047 {
  private _value: number = 0;

  protected get value(): number {
    return this._value;
  }

  protected set value(v: number) {
    this._value = v;
  }
}

class MyClass048 {
  public voidNoParam(): void {
  }
}

class MyClass049 {
  private privOne(): void {
  }

  private privTwo(): void {
  }

  private privThree(): void {
  }
}

class MyClass050 {
  public methodWithObjectParam(data: MyClass050): void {
  }
}

class MyClass051 {
  public namedMethod(): void {
  }
}

class MyClass052 {
  public sharedNameMethod(): void {
  }
}

class MyClass053 {
  public sharedNameMethod(): void {
  }
}

class MyClass054 {
  public getNumber(): number {
    return 42;
  }
}

class MyClass055 {
  public methodOne(): void {
  }

  public methodTwo(): void {
  }

  public methodThree(): void {
  }

  public methodFour(): void {
  }

  public methodFive(): void {
  }
}

class MyClass056 {
  private privateWithFiveParams(a: number, b: string, c: boolean, d: number, e: string): void {
  }
}

class MyClass057 {
  public publicConsistent(): void {
  }

  private privateConsistent(): void {
  }
}

class MyClass058 {
  public getString(): string {
    return 'hello';
  }
}

export default function InstanceMethodIsPrivateTest(): void {
  describe('InstanceMethodIsPrivateTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0001
     * @tc.name testInstanceMethodIsPrivate0001
     * @tc.desc Verify isPrivate() returns false for a public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      let isPrivate = method!.isPrivate();
      expect(isPrivate).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0002
     * @tc.name testInstanceMethodIsPrivate0002
     * @tc.desc Verify private method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let privMethod = cls.getInstanceMethod('privateMethod');
      expect(privMethod).assertUndefined();
      let anotherPriv = cls.getInstanceMethod('anotherPrivate');
      expect(anotherPriv).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0003
     * @tc.name testInstanceMethodIsPrivate0003
     * @tc.desc Verify protected method lookup returns undefined before isPrivate()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      let method = cls.getInstanceMethod('protectedMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0004
     * @tc.name testInstanceMethodIsPrivate0004
     * @tc.desc Verify private getter and setter lookups return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter).assertUndefined();
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0005
     * @tc.name testInstanceMethodIsPrivate0005
     * @tc.desc Verify parent class private method is not visible in subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass013>();
      let method = childCls.getInstanceMethod('parentPrivateMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0006
     * @tc.name testInstanceMethodIsPrivate0006
     * @tc.desc Verify parent public and protected methods are not returned from subclass lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass014>();
      let parentPub = childCls.getInstanceMethod('parentPublicMethod');
      expect(parentPub).assertUndefined();
      let parentProt = childCls.getInstanceMethod('parentProtectedMethod');
      expect(parentProt).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0007
     * @tc.name testInstanceMethodIsPrivate0007
     * @tc.desc Verify getInstanceMethods() does not expose private methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();
      let hasPrivate = Array.from(cls.getInstanceMethods()).some((method: reflect.InstanceMethod): boolean => {
        return method.isPrivate();
      });
      expect(hasPrivate).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0008
     * @tc.name testInstanceMethodIsPrivate0008
     * @tc.desc Verify filtering private methods returns zero because private methods are not exposed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass016>();
      let privateMethodCount: number = 0;
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        if (method.isPrivate()) {
          privateMethodCount++;
        }
      });
      expect(privateMethodCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0009
     * @tc.name testInstanceMethodIsPrivate0009
     * @tc.desc Verify public method is not private and protected method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let pubMethod = cls.getInstanceMethod('publicMethod');
      expect(pubMethod!.isPrivate()).assertEqual(false);
      let protMethod = cls.getInstanceMethod('protectedMethod');
      expect(protMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0010
     * @tc.name testInstanceMethodIsPrivate0010
     * @tc.desc Verify private method lookup returns undefined for access modifier checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0011
     * @tc.name testInstanceMethodIsPrivate0011
     * @tc.desc Verify public methods with different return types are not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass030>();
      expect(cls.getInstanceMethod('returnNumber')!.isPrivate()).assertEqual(false);
      expect(cls.getInstanceMethod('returnString')!.isPrivate()).assertEqual(false);
      expect(cls.getInstanceMethod('returnBoolean')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0012
     * @tc.name testInstanceMethodIsPrivate0012
     * @tc.desc Verify public method with parameters is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
      let method = cls.getInstanceMethod('methodWithParams');
      expect(method!.isPrivate()).assertEqual(false);
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0013
     * @tc.name testInstanceMethodIsPrivate0013
     * @tc.desc Verify empty class has no methods to check isPrivate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass032>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0014
     * @tc.name testInstanceMethodIsPrivate0014
     * @tc.desc Verify all public methods in a class return false for isPrivate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass033>();
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        expect(method.isPrivate()).assertEqual(false);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0015
     * @tc.name testInstanceMethodIsPrivate0015
     * @tc.desc Verify inherited public method is not private in child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodIsPrivate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass034>();
      let childCls = Class.from<ChildClass034>();
      expect(parentCls.getInstanceMethod('parentMethod')!.isPrivate()).assertEqual(false);
      let childMethod = childCls.getInstanceMethod('parentMethod');
      if (childMethod !== undefined) {
        expect(childMethod!.isPrivate()).assertEqual(false);
      } else {
        expect(childMethod).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0016
     * @tc.name testInstanceMethodIsPrivate0016
     * @tc.desc Verify async public method is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass035>();
      let method = cls.getInstanceMethod('asyncMethod');
      expect(method!.isPrivate()).assertEqual(false);
      expect(method!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0017
     * @tc.name testInstanceMethodIsPrivate0017
     * @tc.desc Verify final public method is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass036>();
      let method = cls.getInstanceMethod('finalMethod');
      expect(method!.isPrivate()).assertEqual(false);
      expect(method!.isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0018
     * @tc.name testInstanceMethodIsPrivate0018
     * @tc.desc Verify public getter and setter are not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass037>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.isPrivate()).assertEqual(false);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0019
     * @tc.name testInstanceMethodIsPrivate0019
     * @tc.desc Verify private method with parameters is not exposed and public method is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass038>();
      let privateMethod = cls.getInstanceMethod('privateMethodWithParams');
      expect(privateMethod).assertUndefined();
      let publicMethod = cls.getInstanceMethod('publicMethod');
      expect(publicMethod!.isPrivate()).assertEqual(false);
      expect(publicMethod!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0020
     * @tc.name testInstanceMethodIsPrivate0020
     * @tc.desc Verify concrete public method in abstract class is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass040>();
      let concreteMethod = cls.getInstanceMethod('concreteMethod');
      expect(concreteMethod!.isPrivate()).assertEqual(false);
      let abstractMethod = cls.getInstanceMethod('abstractMethod');
      if (abstractMethod !== undefined) {
        expect(abstractMethod!.isPrivate()).assertEqual(false);
        expect(abstractMethod!.isAbstract()).assertEqual(true);
      } else {
        expect(abstractMethod).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0021
     * @tc.name testInstanceMethodIsPrivate0021
     * @tc.desc Verify parent public method and child own public method are not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass041>();
      expect(parentCls.getInstanceMethod('parentMethod041')!.isPrivate()).assertEqual(false);
      let childCls = Class.from<ChildClass041>();
      let childMethod = childCls.getInstanceMethod('childMethod041');
      expect(childMethod!.isPrivate()).assertEqual(false);
      expect(childMethod!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0022
     * @tc.name testInstanceMethodIsPrivate0022
     * @tc.desc Verify generic public method is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass042>();
      let method = cls.getInstanceMethod('genericMethod');
      expect(method!.isPrivate()).assertEqual(false);
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0023
     * @tc.name testInstanceMethodIsPrivate0023
     * @tc.desc Verify public method with five parameters is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass043>();
      let method = cls.getInstanceMethod('methodWithFiveParams');
      expect(method!.isPrivate()).assertEqual(false);
      expect(method!.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0024
     * @tc.name testInstanceMethodIsPrivate0024
     * @tc.desc Verify isPrivate and isPublic consistency on a public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass044>();
      let method = cls.getInstanceMethod('publicMethod');
      expect(method!.isPrivate()).assertEqual(false);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0025
     * @tc.name testInstanceMethodIsPrivate0025
     * @tc.desc Verify private methods returning number string boolean all return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass045>();
      expect(cls.getInstanceMethod('privReturnNumber')).assertUndefined();
      expect(cls.getInstanceMethod('privReturnString')).assertUndefined();
      expect(cls.getInstanceMethod('privReturnBoolean')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0026
     * @tc.name testInstanceMethodIsPrivate0026
     * @tc.desc Verify multiple protected methods all return undefined on lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass046>();
      expect(cls.getInstanceMethod('protMethodOne')).assertUndefined();
      expect(cls.getInstanceMethod('protMethodTwo')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0027
     * @tc.name testInstanceMethodIsPrivate0027
     * @tc.desc Verify protected getter and setter lookups return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass047>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter).assertUndefined();
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0028
     * @tc.name testInstanceMethodIsPrivate0028
     * @tc.desc Verify public void no-parameter method is not private and has zero params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass048>();
      let method = cls.getInstanceMethod('voidNoParam');
      expect(method!.isPrivate()).assertEqual(false);
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0029
     * @tc.name testInstanceMethodIsPrivate0029
     * @tc.desc Verify class with only private methods exposes no instance methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass049>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
      expect(cls.getInstanceMethod('privOne')).assertUndefined();
      expect(cls.getInstanceMethod('privTwo')).assertUndefined();
      expect(cls.getInstanceMethod('privThree')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0030
     * @tc.name testInstanceMethodIsPrivate0030
     * @tc.desc Verify public method with object parameter type is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass050>();
      let method = cls.getInstanceMethod('methodWithObjectParam');
      expect(method!.isPrivate()).assertEqual(false);
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0031
     * @tc.name testInstanceMethodIsPrivate0031
     * @tc.desc Verify getName and isPrivate are consistent for a public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass051>();
      let method = cls.getInstanceMethod('namedMethod');
      expect(method!.getName()).assertEqual('namedMethod');
      expect(method!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0032
     * @tc.name testInstanceMethodIsPrivate0032
     * @tc.desc Verify two classes with same public method name both return isPrivate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MyClass052>();
      let cls2 = Class.from<MyClass053>();
      let m1 = cls1.getInstanceMethod('sharedNameMethod');
      let m2 = cls2.getInstanceMethod('sharedNameMethod');
      expect(m1!.isPrivate()).assertEqual(false);
      expect(m2!.isPrivate()).assertEqual(false);
      expect(m1!.getName()).assertEqual('sharedNameMethod');
      expect(m2!.getName()).assertEqual('sharedNameMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0033
     * @tc.name testInstanceMethodIsPrivate0033
     * @tc.desc Verify public method returning number has return type f64 and is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass054>();
      let method = cls.getInstanceMethod('getNumber');
      expect(method!.isPrivate()).assertEqual(false);
      expect(method!.getReturnType().getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0034
     * @tc.name testInstanceMethodIsPrivate0034
     * @tc.desc Verify public method isPrivate false isPublic true isProtected false and private undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass057>();
      let pubMethod = cls.getInstanceMethod('publicConsistent');
      expect(pubMethod!.isPrivate()).assertEqual(false);
      expect(pubMethod!.isPublic()).assertEqual(true);
      expect(pubMethod!.isProtected()).assertEqual(false);
      let privMethod = cls.getInstanceMethod('privateConsistent');
      expect(privMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0035
     * @tc.name testInstanceMethodIsPrivate0035
     * @tc.desc Verify large class with multiple public methods all return isPrivate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass055>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(5);
      Array.from(methods).forEach((method: reflect.InstanceMethod): void => {
        expect(method.isPrivate()).assertEqual(false);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0036
     * @tc.name testInstanceMethodIsPrivate0036
     * @tc.desc Verify private method with five parameters is not exposed via lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass056>();
      let method = cls.getInstanceMethod('privateWithFiveParams');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPRIVATE_0037
     * @tc.name testInstanceMethodIsPrivate0037
     * @tc.desc Verify public method returning string has return type std.core.String and is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPrivate0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass058>();
      let method = cls.getInstanceMethod('getString');
      expect(method!.isPrivate()).assertEqual(false);
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });
  });
}
