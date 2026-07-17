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

class MyClass005 {
  private privateMethod(): void {
  }
}

class MyClass006 {
  protected protectedMethod(): void {
  }
}

class MyClass007 {
  public publicMethod(): void {
  }

  private privateMethod(): void {
  }

  protected protectedMethod(): void {
  }

  internalMethod(): void {
  }
}

class MyClass016 {
  public testMethod(): void {
  }
}

class MyClass019 {
  public publicMethod(): void {
  }

  protected protectedMethod(): void {
  }
}

class MyClass020 {
  public testMethod(): void {
  }
}

class MyClass021 {
  public publicMethod(): void {
  }

  private privateMethod(): void {
  }
}

class ParentClass022 {
  public parentPublicMethod(): void {
  }

  private parentPrivateMethod(): void {
  }

  protected parentProtectedMethod(): void {
  }
}

class ParentClass023 {
  public overrideMethod(): void {
  }
}

class ChildClass023 extends ParentClass023 {
  public override overrideMethod(): void {
  }
}

class ParentClass024 {
  public overrideMethod(): void {
  }
}

class ChildClass024 extends ParentClass024 {
  public override overrideMethod(): void {
  }
}

class MyClass025 {
  public numberParam(a: number): void {
  }

  public stringParam(a: string): void {
  }

  public boolParam(a: boolean): void {
  }

  public objectParam(a: object): void {
  }

  public arrayParam(a: number[]): void {
  }
}

class MyClass026 {
  public voidMethod(): void {
  }

  public numberMethod(): number {
    return 0;
  }

  public stringMethod(): string {
    return 'test';
  }

  public boolMethod(): boolean {
    return true;
  }

  public objectMethod(): object {
    return {};
  }
}

class MyClass028 {
  public publicMethod(): void {
  }

  private privateMethod(): void {
  }

  protected protectedMethod(): void {
  }
}

class MyClass035 {
  public testMethod(): void {
  }
}

class MyClass039 {
  public testMethod(): void {
  }
}

abstract class AbstractClass040 {
  public abstract abstractPublicMethod(): void;

  protected abstract abstractProtectedMethod(): void;
}

class MyClass041 {
  public async asyncPublicMethod(): Promise<void> {
  }

  private async asyncPrivateMethod(): Promise<void> {
  }
}

class MyClass042 {
  public publicGeneric<T>(param: T): void {
  }

  private privateGeneric<T>(param: T): void {
  }
}

class MyClass050 {
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

class MyClass051 {
  public methodWithParams(a: number, b: string, c: boolean): void {
  }
}

class EmptyClass052 {
}

class MyClass053 {
  public method1(): void {
  }

  public method2(): string {
    return 'test';
  }

  public method3(a: number): boolean {
    return true;
  }
}

class ParentClass054 {
  public parentMethod(): void {
  }
}

class ChildClass054 extends ParentClass054 {
}

class MyClass055 {
  public final finalMethod(): string {
    return 'final';
  }
}

class MyClass056 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }
}

class MyClass057 {
  public async asyncMethod(): Promise<string> {
    return 'async';
  }
}

class MyClass058 {
  public method1(): void {
  }

  public method2(): void {
  }

  public method3(): void {
  }

  public method4(): void {
  }
}

class MyClass059 {
  public static staticMethod(): void {
  }

  public instanceMethod(): void {
  }
}


class PublicClass040 {
  public pubReturnNumber(): number {
    return 42;
  }
}

class PublicClass041 {
  public pubReturnString(): string {
    return 'test';
  }
}

export default function InstanceMethodIsPublicTest(): void {
  describe('InstanceMethodIsPublicTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0001
     * @tc.name testInstanceMethodIsPublic0001
     * @tc.desc Verify private method lookup returns undefined before isPublic()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let method = cls.getInstanceMethod('privateMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0002
     * @tc.name testInstanceMethodIsPublic0002
     * @tc.desc Verify protected method lookup returns undefined before isPublic()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      let method = cls.getInstanceMethod('protectedMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0003
     * @tc.name testInstanceMethodIsPublic0003
     * @tc.desc Verify public methods are exposed and private or protected lookups return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      expect(cls.getInstanceMethod('publicMethod')!.isPublic()).assertEqual(true);
      let privMethod = cls.getInstanceMethod('privateMethod');
      expect(privMethod).assertUndefined();
      let protMethod = cls.getInstanceMethod('protectedMethod');
      expect(protMethod).assertUndefined();
      expect(cls.getInstanceMethod('internalMethod')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0004
     * @tc.name testInstanceMethodIsPublic0004
     * @tc.desc Verify non-existent method handling for isPublic()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass016>();
      let method = cls.getInstanceMethod('nonExistentMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0005
     * @tc.name testInstanceMethodIsPublic0005
     * @tc.desc Verify public method is not protected and protected method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      let pubMethod = cls.getInstanceMethod('publicMethod');
      expect(pubMethod!.isPublic()).assertEqual(true);
      expect(pubMethod!.isProtected()).assertEqual(false);
      let protMethod = cls.getInstanceMethod('protectedMethod');
      expect(protMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0006
     * @tc.name testInstanceMethodIsPublic0006
     * @tc.desc Verify isPublic() with getName() coordination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let method = cls.getInstanceMethod('testMethod');
      let methodName = method!.getName();
      let isPublic = method!.isPublic();
      expect(methodName).assertEqual('testMethod');
      expect(isPublic).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0007
     * @tc.name testInstanceMethodIsPublic0007
     * @tc.desc Verify instance method access permissions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
      let pubMethod = cls.getInstanceMethod('publicMethod');
      expect(pubMethod!.isPublic()).assertEqual(true);
      let privMethod = cls.getInstanceMethod('privateMethod');
      expect(privMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0008
     * @tc.name testInstanceMethodIsPublic0008
     * @tc.desc Verify public method declared on a parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentClass022>();
      let parentPub = cls.getInstanceMethod('parentPublicMethod');
      expect(parentPub!.isPublic()).assertEqual(true);
      let parentProt = cls.getInstanceMethod('parentProtectedMethod');
      expect(parentProt).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0009
     * @tc.name testInstanceMethodIsPublic0009
     * @tc.desc Verify subclass overridden method keeps public access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass023>();
      let childMethod = childCls.getInstanceMethod('overrideMethod');
      expect(childMethod!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0010
     * @tc.name testInstanceMethodIsPublic0010
     * @tc.desc Verify subclass override remains publicly visible in reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass024>();
      let childMethod = childCls.getInstanceMethod('overrideMethod');
      expect(childMethod!.getName()).assertEqual('overrideMethod');
      expect(childMethod!.isPublic()).assertEqual(true);
      expect(childMethod!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0011
     * @tc.name testInstanceMethodIsPublic0011
     * @tc.desc Verify public methods with different parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025>();
      expect(cls.getInstanceMethod('numberParam')!.isPublic()).assertEqual(true);
      expect(cls.getInstanceMethod('stringParam')!.isPublic()).assertEqual(true);
      expect(cls.getInstanceMethod('boolParam')!.isPublic()).assertEqual(true);
      expect(cls.getInstanceMethod('objectParam')!.isPublic()).assertEqual(true);
      expect(cls.getInstanceMethod('arrayParam')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0012
     * @tc.name testInstanceMethodIsPublic0012
     * @tc.desc Verify public methods with different return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass026>();
      expect(cls.getInstanceMethod('voidMethod')!.isPublic()).assertEqual(true);
      expect(cls.getInstanceMethod('numberMethod')!.isPublic()).assertEqual(true);
      expect(cls.getInstanceMethod('stringMethod')!.isPublic()).assertEqual(true);
      expect(cls.getInstanceMethod('boolMethod')!.isPublic()).assertEqual(true);
      expect(cls.getInstanceMethod('objectMethod')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0013
     * @tc.name testInstanceMethodIsPublic0013
     * @tc.desc Verify filtering public methods and checking modifier mutual exclusion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass028>();
      let publicMethodCount: number = 0;
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        if (method.isPublic()) {
          publicMethodCount++;
          expect(method.isPrivate()).assertEqual(false);
          expect(method.isProtected()).assertEqual(false);
        }
      });
      expect(publicMethodCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0014
     * @tc.name testInstanceMethodIsPublic0014
     * @tc.desc Verify isPublic() with logical combination conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass035>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method!.isPublic()).assertEqual(true);
      expect(method!.isPrivate()).assertEqual(false);
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0015
     * @tc.name testInstanceMethodIsPublic0015
     * @tc.desc Verify access modifier mutual exclusion for public methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass039>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method!.isPublic()).assertEqual(true);
      expect(method!.isPrivate()).assertEqual(false);
      expect(method!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0016
     * @tc.name testInstanceMethodIsPublic0016
     * @tc.desc Verify abstract public method is exposed and abstract protected lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let absCls = Class.from<AbstractClass040>();
      let absPub = absCls.getInstanceMethod('abstractPublicMethod');
      expect(absPub!.isPublic()).assertEqual(true);
      let absProt = absCls.getInstanceMethod('abstractProtectedMethod');
      expect(absProt).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0017
     * @tc.name testInstanceMethodIsPublic0017
     * @tc.desc Verify async public method is exposed and async private lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass041>();
      let asyncPub = cls.getInstanceMethod('asyncPublicMethod');
      expect(asyncPub!.isPublic()).assertEqual(true);
      let asyncPriv = cls.getInstanceMethod('asyncPrivateMethod');
      expect(asyncPriv).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0018
     * @tc.name testInstanceMethodIsPublic0018
     * @tc.desc Verify generic public method is exposed and generic private lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass042>();
      let pubGen = cls.getInstanceMethod('publicGeneric');
      expect(pubGen!.isPublic()).assertEqual(true);
      let privGen = cls.getInstanceMethod('privateGeneric');
      expect(privGen).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0019
     * @tc.name testInstanceMethodIsPublic0019
     * @tc.desc Verify public methods with different return types all return true for isPublic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass050>();
      expect(cls.getInstanceMethod('returnNumber')!.isPublic()).assertEqual(true);
      expect(cls.getInstanceMethod('returnString')!.isPublic()).assertEqual(true);
      expect(cls.getInstanceMethod('returnBoolean')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0020
     * @tc.name testInstanceMethodIsPublic0020
     * @tc.desc Verify public method with multiple parameters returns true for isPublic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass051>();
      let method = cls.getInstanceMethod('methodWithParams');
      expect(method!.isPublic()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0021
     * @tc.name testInstanceMethodIsPublic0021
     * @tc.desc Verify empty class has no methods to check isPublic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass052>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0022
     * @tc.name testInstanceMethodIsPublic0022
     * @tc.desc Verify all public methods in a class return true for isPublic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass053>();
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        expect(method.isPublic()).assertEqual(true);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0023
     * @tc.name testInstanceMethodIsPublic0023
     * @tc.desc Verify inherited public method returns true for isPublic in child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass054>();
      let childCls = Class.from<ChildClass054>();
      expect(parentCls.getInstanceMethod('parentMethod')!.isPublic()).assertEqual(true);
      let childMethod = childCls.getInstanceMethod('parentMethod');
      if (childMethod !== undefined) {
        expect(childMethod!.isPublic()).assertEqual(true);
      } else {
        expect(childMethod).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0024
     * @tc.name testInstanceMethodIsPublic0024
     * @tc.desc Verify final public method returns true for isPublic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass055>();
      let method = cls.getInstanceMethod('finalMethod');
      expect(method!.isPublic()).assertEqual(true);
      expect(method!.isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0025
     * @tc.name testInstanceMethodIsPublic0025
     * @tc.desc Verify public getter and setter return true for isPublic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass056>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.isPublic()).assertEqual(true);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0026
     * @tc.name testInstanceMethodIsPublic0026
     * @tc.desc Verify async public method returns true for isPublic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass057>();
      let method = cls.getInstanceMethod('asyncMethod');
      expect(method!.isPublic()).assertEqual(true);
      expect(method!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0027
     * @tc.name testInstanceMethodIsPublic0027
     * @tc.desc Verify isPublic for all methods in a class with many public methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass058>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(4);
      Array.from(methods).forEach((method: reflect.InstanceMethod): void => {
        expect(method.isPublic()).assertEqual(true);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0028
     * @tc.name testInstanceMethodIsPublic0028
     * @tc.desc Verify that static methods are not accessible via getInstanceMethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass059>();
      let instanceMethod = cls.getInstanceMethod('instanceMethod');
      expect(instanceMethod!.isPublic()).assertEqual(true);
      let staticMethod = cls.getInstanceMethod('staticMethod');
      expect(staticMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0029
     * @tc.name testInstanceMethodIsPublic0029
     * @tc.desc Verify public method returning number isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicClass040>();
      let method = cls.getInstanceMethod('pubReturnNumber');
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPUBLIC_0030
     * @tc.name testInstanceMethodIsPublic0030
     * @tc.desc Verify public method returning string isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsPublic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicClass041>();
      let method = cls.getInstanceMethod('pubReturnString');
      expect(method!.isPublic()).assertEqual(true);
    });

  });
}
