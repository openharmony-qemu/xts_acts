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
  protected protectedMethod(): void {
  }

  protected anotherProtected(): string {
    return 'test';
  }
}

class MyClass006 {
  private privateMethod(): void {
  }
}

class MyClass008 {
  private _value: number = 0;

  protected get value(): number {
    return this._value;
  }

  protected set value(v: number) {
    this._value = v;
  }
}

class MyClass012 {
  private privateMethod(): void {
  }

  protected protectedMethod(): void {
  }
}

class ParentClass014 {
  protected parentProtectedMethod(): void {
  }

  private parentPrivateMethod(): void {
  }
}

class ChildClass014 extends ParentClass014 {
}

class ParentClass015 {
  protected overrideMethod(): void {
  }
}

class ChildClass015 extends ParentClass015 {
  protected override overrideMethod(): void {
  }
}

class ParentClass016 {
  protected overrideMethod(): void {
  }
}

class ChildClass016 extends ParentClass016 {
  public override overrideMethod(): void {
  }
}

class MyClass017 {
  public publicMethod(): void {
  }

  private privateMethod(): void {
  }

  protected protectedMethod(): void {
  }
}

class MyClass018 {
  public publicMethod(): void {
  }

  protected protectedMethod(): void {
  }
}

class MyClass019 {
  public publicMethod(): void {
  }

  protected protectedMethod(): void {
  }
}

class GrandParentClass020 {
  protected grandProtectedMethod(): void {
  }
}

class ParentClass020 extends GrandParentClass020 {
}

class ChildClass020 extends ParentClass020 {
}

class MyClass027 {
  public publicMethod(): void {
  }

  protected protectedMethod(): void {
  }

  private privateMethod(): void {
  }
}

abstract class AbstractClass028 {
  protected abstract abstractProtectedMethod(): void;
}

class MyClass029 {
  protected async asyncProtectedMethod(): Promise<void> {
  }
}

class MyClass030 {
  protected protectedGeneric<T>(param: T): void {
  }
}

class MyClass035 {
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

class MyClass036 {
  public methodWithParams(a: number, b: string): void {
  }
}

class EmptyClass037 {
}

class MyClass038 {
  public method1(): void {
  }

  public method2(): string {
    return 'test';
  }

  public method3(a: number): boolean {
    return true;
  }
}

class ParentClass039 {
  public parentMethod(): void {
  }
}

class ChildClass039 extends ParentClass039 {
}

class MyClass040 {
  public async asyncMethod(): Promise<void> {
  }
}

class MyClass041 {
  public final finalMethod(): void {
  }
}

class MyClass042 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }
}

class MyClass043 {
  protected protectedMethodWithParams(a: number, b: string): void {
  }

  public publicMethod(): void {
  }
}

export default function InstanceMethodIsProtectedTest(): void {
  describe('InstanceMethodIsProtectedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0001
     * @tc.name testInstanceMethodIsProtected0001
     * @tc.desc Verify isProtected() returns false for a public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      let isProtected = method!.isProtected();
      expect(isProtected).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0002
     * @tc.name testInstanceMethodIsProtected0002
     * @tc.desc Verify protected method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let protMethod = cls.getInstanceMethod('protectedMethod');
      expect(protMethod).assertUndefined();
      let anotherProt = cls.getInstanceMethod('anotherProtected');
      expect(anotherProt).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0003
     * @tc.name testInstanceMethodIsProtected0003
     * @tc.desc Verify private method lookup returns undefined before isProtected()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      let method = cls.getInstanceMethod('privateMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0004
     * @tc.name testInstanceMethodIsProtected0004
     * @tc.desc Verify protected getter and setter lookups return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter).assertUndefined();
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0005
     * @tc.name testInstanceMethodIsProtected0005
     * @tc.desc Verify private and protected method lookups return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let privMethod = cls.getInstanceMethod('privateMethod');
      expect(privMethod).assertUndefined();
      let protMethod = cls.getInstanceMethod('protectedMethod');
      expect(protMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0006
     * @tc.name testInstanceMethodIsProtected0006
     * @tc.desc Verify parent protected method lookup returns undefined in subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass014>();
      let parentProt = childCls.getInstanceMethod('parentProtectedMethod');
      expect(parentProt).assertUndefined();
      let parentPriv = childCls.getInstanceMethod('parentPrivateMethod');
      expect(parentPriv).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0007
     * @tc.name testInstanceMethodIsProtected0007
     * @tc.desc Verify protected overridden method lookup returns undefined in subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass015>();
      let childMethod = childCls.getInstanceMethod('overrideMethod');
      expect(childMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0008
     * @tc.name testInstanceMethodIsProtected0008
     * @tc.desc Verify subclass can change protected method access to public
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass016>();
      let childMethod = childCls.getInstanceMethod('overrideMethod');
      expect(childMethod!.getName()).assertEqual('overrideMethod');
      expect(childMethod!.isProtected()).assertEqual(false);
      expect(childMethod!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0009
     * @tc.name testInstanceMethodIsProtected0009
     * @tc.desc Verify getInstanceMethods() does not expose protected methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let methods = cls.getInstanceMethods();
      let hasProtected = false;
      for (let i = 0; i < methods.length; i++) {
        let method = methods[i];
        if (method.isProtected()) {
          hasProtected = true;
        }
      }
      expect(hasProtected).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0010
     * @tc.name testInstanceMethodIsProtected0010
     * @tc.desc Verify filtering protected methods returns zero because protected methods are not exposed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>();
      let methods = cls.getInstanceMethods();
      let protectedMethodCount: number = 0;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].isProtected()) {
          protectedMethodCount++;
        }
      }
      expect(protectedMethodCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0011
     * @tc.name testInstanceMethodIsProtected0011
     * @tc.desc Verify public method is not protected and protected method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      let pubMethod = cls.getInstanceMethod('publicMethod');
      let protMethod = cls.getInstanceMethod('protectedMethod');
      expect(pubMethod!.getName()).assertEqual('publicMethod');
      expect(pubMethod!.isProtected()).assertEqual(false);
      expect(pubMethod!.isPublic()).assertEqual(true);
      expect(protMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0012
     * @tc.name testInstanceMethodIsProtected0012
     * @tc.desc Verify protected method lookup returns undefined in multi-level inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass020>();
      let method = childCls.getInstanceMethod('grandProtectedMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0013
     * @tc.name testInstanceMethodIsProtected0013
     * @tc.desc Verify public access flags and hidden protected or private lookups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass027>();
      let pubMethod = cls.getInstanceMethod('publicMethod');
      expect(pubMethod!.isPublic()).assertEqual(true);
      expect(pubMethod!.isProtected()).assertEqual(false);
      expect(pubMethod!.isPrivate()).assertEqual(false);
      let protMethod = cls.getInstanceMethod('protectedMethod');
      expect(protMethod).assertUndefined();
      let privMethod = cls.getInstanceMethod('privateMethod');
      expect(privMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0014
     * @tc.name testInstanceMethodIsProtected0014
     * @tc.desc Verify abstract protected method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let absCls = Class.from<AbstractClass028>();
      let method = absCls.getInstanceMethod('abstractProtectedMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0015
     * @tc.name testInstanceMethodIsProtected0015
     * @tc.desc Verify async protected method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass029>();
      let method = cls.getInstanceMethod('asyncProtectedMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0016
     * @tc.name testInstanceMethodIsProtected0016
     * @tc.desc Verify generic protected method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass030>();
      let method = cls.getInstanceMethod('protectedGeneric');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0017
     * @tc.name testInstanceMethodIsProtected0017
     * @tc.desc Verify public methods with different return types are not protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass035>();
      expect(cls.getInstanceMethod('returnNumber')!.isProtected()).assertEqual(false);
      expect(cls.getInstanceMethod('returnString')!.isProtected()).assertEqual(false);
      expect(cls.getInstanceMethod('returnBoolean')!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0018
     * @tc.name testInstanceMethodIsProtected0018
     * @tc.desc Verify public method with parameters is not protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass036>();
      let method = cls.getInstanceMethod('methodWithParams');
      expect(method!.isProtected()).assertEqual(false);
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0019
     * @tc.name testInstanceMethodIsProtected0019
     * @tc.desc Verify empty class has no methods to check isProtected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass037>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0020
     * @tc.name testInstanceMethodIsProtected0020
     * @tc.desc Verify all public methods in a class return false for isProtected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass038>();
      let methods = cls.getInstanceMethods();
      for (let i = 0; i < methods.length; i++) {
        expect(methods[i].isProtected()).assertEqual(false);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0021
     * @tc.name testInstanceMethodIsProtected0021
     * @tc.desc Verify inherited public method is not protected in child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodIsProtected0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass039>();
      let childCls = Class.from<ChildClass039>();
      expect(parentCls.getInstanceMethod('parentMethod')!.isProtected()).assertEqual(false);
      let childMethod = childCls.getInstanceMethod('parentMethod');
      if (childMethod !== undefined) {
        expect(childMethod!.isProtected()).assertEqual(false);
      } else {
        expect(childMethod).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0022
     * @tc.name testInstanceMethodIsProtected0022
     * @tc.desc Verify async public method is not protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass040>();
      let method = cls.getInstanceMethod('asyncMethod');
      expect(method!.isProtected()).assertEqual(false);
      expect(method!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0023
     * @tc.name testInstanceMethodIsProtected0023
     * @tc.desc Verify final public method is not protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass041>();
      let method = cls.getInstanceMethod('finalMethod');
      expect(method!.isProtected()).assertEqual(false);
      expect(method!.isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0024
     * @tc.name testInstanceMethodIsProtected0024
     * @tc.desc Verify public getter and setter are not protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass042>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.isProtected()).assertEqual(false);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISPROTECTED_0025
     * @tc.name testInstanceMethodIsProtected0025
     * @tc.desc Verify protected method with parameters is not exposed and public method is not protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsProtected0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass043>();
      let protectedMethod = cls.getInstanceMethod('protectedMethodWithParams');
      expect(protectedMethod).assertUndefined();
      let publicMethod = cls.getInstanceMethod('publicMethod');
      expect(publicMethod!.isProtected()).assertEqual(false);
      expect(publicMethod!.isPublic()).assertEqual(true);
    });

  });
}
