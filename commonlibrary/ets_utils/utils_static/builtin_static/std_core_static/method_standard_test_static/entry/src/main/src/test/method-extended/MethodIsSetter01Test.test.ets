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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

function _M(ct: ClassType, name: string): Method {
  return ct.getMethodByName(name) as Method;
}
class S01_IsSetter01 {
  private _x: number = 0;
  public set x(v: number) {
    this._x = v;
  }
  public get x(): number {
    return this._x;
  }
  public foo(): void {}
}
class S02_IsSetter01 {
  private _a: number = 0;
  public set a(v: number) {
    this._a = v;
  }
  protected set b(v: number) {
    this._a = v;
  }
  private set c(v: number) {
    this._a = v;
  }
}
class S03_IsSetter01 {
  private static _val: number = 0;
  public static set value(v: number) {
    S03_IsSetter01._val = v;
  }
}
abstract class S04_AbstractBase_IsSetter01 {
  public abstract set abstractVal(v: number);
  public set normalVal(v: number) {}
}
class S04_ConcreteChild_IsSetter01 extends S04_AbstractBase_IsSetter01 {
  private _v: number = 0;
  public set abstractVal(v: number) {
    this._v = v;
  }
}
interface S05_ISettable_IsSetter01 {
  set val(v: number);
}
class S06_GenericClass_IsSetter01<T> {
  private _val: T | undefined = undefined;
  public set value(v: T) {
    this._val = v;
  }
  public get value(): T | undefined {
    return this._val;
  }
  public process(v: T): void {}
}
class S14_GetterNormal_IsSetter01 {
  private _d: number = 0;
  get data(): number {
    return 0;
  }
  dataMethod(): void {}
}
class S15_PrefixMethods_IsSetter01 {
  public setData(): void {}
  public getData(): number {
    return 0;
  }
  public set(): void {}
}
class S24_DefaultAccess_IsSetter01 {
  private _d: number = 0;
  set def(v: number) {
    this._d = v;
  }
  get def(): number {
    return this._d;
  }
  doSomething(): void {}
}
class S30_BothStaticAccessors_IsSetter01 {
  private static _v: number = 0;
  static set v(val: number) {
    S30_BothStaticAccessors_IsSetter01._v = val;
  }
  static get v(): number {
    return S30_BothStaticAccessors_IsSetter01._v;
  }
}
class S33_BaseWithMethods_IsSetter01 {
  private _v: number = 0;
  set val(v: number) {
    this._v = v;
  }
  get val(): number {
    return this._v;
  }
  baseNormal(): void {}
}
class S33_DerivedFromBase_IsSetter01 extends S33_BaseWithMethods_IsSetter01 {}
class S64_Return_IsSetter01 {
  doVoid(): void {}
  getNum(): number {
    return 0;
  }
}
class S76_FullProp_IsSetter01 {
  private _x: number = 0;
  public set x(v: number) {
    this._x = v;
  }
  public get x(): number {
    return this._x;
  }
}
class S79_GP2_IsSetter01 {
  private _a: number = 0;
  set a(v: number) {
    this._a = v;
  }
  get a(): number {
    return this._a;
  }
  gpFn(): void {}
}
class S79_P2_IsSetter01 extends S79_GP2_IsSetter01 {
  private _b: number = 0;
  set b(v: number) {
    this._b = v;
  }
  get b(): number {
    return this._b;
  }
  pFn(): void {}
}
class S79_C2_IsSetter01 extends S79_P2_IsSetter01 {
  private _c: number = 0;
  set c(v: number) {
    this._c = v;
  }
}
class S82_MixedImpl_IsSetter01 extends S04_AbstractBase_IsSetter01 implements S05_ISettable_IsSetter01 {
  private _v: number = 0;
  private _av: number = 0;
  set val(v: number) {
    this._v = v;
  }
  set abstractVal(v: number) {
    this._av = v;
  }
  extra(): void {}
}
class S86_OtherClassB_IsSetter01 {
  private _v: number = 0;
  set v(val: number) {
    this._v = val;
  }
}
class S87_NormalOnly_IsSetter01 {
  doWork(): void {}
}
const findSetterMethodByClassTypeName = (classType: ClassType, name: string, wantStatic?: boolean): Method => {
  for (let i: number = 0; i < classType.getMethodsNum(); i += 1) {
    const method = classType.getMethod(i.toLong());
    if (method.getName() === name) {
      if (wantStatic === undefined || method.isStatic() === wantStatic) {
        return method;
      }
    }
  }
  expect().assertFail();
  throw new Error('Missing method: ' + name);
};
class IsSetter02_PropertyClass {
  _name: string = '';
  _age: number = 0;
  _active: boolean = false;
  set name(v: string) {
    this._name = v;
  }
  get name(): string {
    return this._name;
  }
  set age(v: number) {
    this._age = v;
  }
  get age(): number {
    return this._age;
  }
  set active(v: boolean) {
    this._active = v;
  }
  get active(): boolean {
    return this._active;
  }
  doTask(): void {}
  private helper(): number {
    return 0;
  }
}
class IsSetter02_PureSetterClass {
  _x: number = 0;
  _y: string = '';
  set x(v: number) {
    this._x = v;
  }
  set y(v: string) {
    this._y = v;
  }
}
class IsSetter02_PureGetterClass {
  _x: number = 0;
  get x(): number {
    return this._x;
  }
  get label(): string {
    return 'test';
  }
}
class IsSetter02_PlainMethodClass {
  add(a: number, b: number): number {
    return a + b;
  }
  greet(): string {
    return 'hello';
  }
  log(msg: string): void {}
}
class IsSetter02_BaseProp {
  _val: number = 0;
  set val(v: number) {
    this._val = v;
  }
  get val(): number {
    return this._val;
  }
  baseMethod(): void {}
}
class IsSetter02_DerivedProp extends IsSetter02_BaseProp {
  _extra: string = '';
  set extra(v: string) {
    this._extra = v;
  }
  get extra(): string {
    return this._extra;
  }
  derivedMethod(): void {}
}
class IsSetter02_StaticMethodClass {
  static doSomething(): void {}
}
class IsSetter02_GenericClass<T> {
  process(item: T): T {
    return item;
  }
}
class IsSetter02_SameNameClass {
  _val: number = 0;
  set val(v: number) {
    this._val = v;
  }
  valMethod(v: number): void {}
}
class IsSetter02_LargePropClass {
  set p1(v: number) {}
  set p2(v: number) {}
  set p3(v: number) {}
  set p4(v: number) {}
  set p5(v: number) {}
  set p6(v: number) {}
  set p7(v: number) {}
  set p8(v: number) {}
  set p9(v: number) {}
  set p10(v: number) {}
  get p1(): number {
    return 0;
  }
  get p2(): number {
    return 0;
  }
  get p3(): number {
    return 0;
  }
  get p4(): number {
    return 0;
  }
  get p5(): number {
    return 0;
  }
  get p6(): number {
    return 0;
  }
  get p7(): number {
    return 0;
  }
  get p8(): number {
    return 0;
  }
  get p9(): number {
    return 0;
  }
  get p10(): number {
    return 0;
  }
  n1(): void {}
  n2(): void {}
  n3(): void {}
  n4(): void {}
  n5(): void {}
}
interface IsSetter02_ITask {
  set taskName(v: string);
  get taskName(): string;
  execute(): void;
}
class IsSetter02_BaseWork {
  set status(v: string) {}
  get status(): string {
    return 'ok';
  }
  log(): void {}
}
class IsSetter02_Worker extends IsSetter02_BaseWork implements IsSetter02_ITask {
  _taskName: string = '';
  set taskName(v: string) {
    this._taskName = v;
  }
  get taskName(): string {
    return this._taskName;
  }
  execute(): void {}
  report(): void {}
}
const findIsSetter02Method = (classType: ClassType, name: string, wantStatic?: boolean): Method => {
  for (let i: number = 0; i < classType.getMethodsNum(); i += 1) {
    const method: Method = classType.getMethod(i.toLong());
    if (method.getName() === name) {
      if (wantStatic === undefined || method.isStatic() === wantStatic) {
        return method;
      }
    }
  }
  expect().assertFail();
  throw new Error(`Missing method: ${name}`);
};
class IsSetter03_SingleMethodClass {
  doOneThing(): void {}
}
class IsSetter03_ParentWithPrivate {
  privateParentMethod(): void {}
}
class IsSetter03_ChildClass2 extends IsSetter03_ParentWithPrivate {}
class IsSetter03_InnerLevel {
  set inner(v: number) {}
}
class IsSetter03_OuterLevel {
  set outer(v: number) {}
}
class IsSetter03_SideEffectGetterClass {
  count: number = 0;
  get sideEffect(): number {
    this.count++;
    return 0;
  }
}
class IsSetter03_ParentWithSetter {
  set val(v: number) {}
}
class IsSetter03_ChildHides extends IsSetter03_ParentWithSetter {
  valMethod(v: number): void {}
}
interface IsSetter03_ISet {
  set val(v: number);
}
class IsSetter03_ImplAsNormal implements IsSetter03_ISet {
  set val(v: number) {}
}
class IsSetter03_AlternatingClass {
  set val(v: number) {}
  get val(): number {
    return 0;
  }
}
class IsSetter03_DemoHundredClass {
  set s(v: number) {}
  get s(): number {
    return 0;
  }
  normal(): void {}
}
class IsSetter03_ParentPrivateSetter {
  _val: number = 0;
  private set val(v: number) {
    this._val = v;
  }
}
class IsSetter03_ChildOfPrivateSetter extends IsSetter03_ParentPrivateSetter {}
class IsSetter03_AccessModifierClass {
  public set pub(v: number) {}
  protected set prot(v: number) {}
  private set priv(v: number) {}
  set def(v: number) {}
}
class IsSetter03_AccessModGetterClass {
  public get pub(): number {
    return 0;
  }
  protected get prot(): number {
    return 0;
  }
  private get priv(): number {
    return 0;
  }
  get def(): number {
    return 0;
  }
}
export default function MethodIsSetter01Test(): void {
  describe('MethodIsSetter01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_0100
     * @tc.name testMethodIsSetterAtOne001
     * @tc.desc Verify that MyClass with setter/getter/normal method can be loaded via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S01_IsSetter01>() as ClassType;
      expect(cls.getMethodByName('%%set-x')).not().assertUndefined();
      expect(cls.getMethodByName('%%get-x')).not().assertUndefined();
      expect(cls.getMethodByName('foo')).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_0200
     * @tc.name testMethodIsSetterAtOne002
     * @tc.desc Verify that AccessModifiersClass with public/protected/private setters can be loaded via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S02_IsSetter01>() as ClassType;
      expect(cls.getMethodByName('%%set-a')).not().assertUndefined();
      expect(cls.getMethodByName('%%set-b')).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_0300
     * @tc.name testMethodIsSetterAtOne003
     * @tc.desc Verify getMethodByName for the static setter of S03_IsSetter01 is defined, then the case voluntarily fails expecting TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S03_IsSetter01>() as ClassType;
      try {
        expect(_M(cls, '%%set-value')).not().assertUndefined();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_0400
     * @tc.name testMethodIsSetterAtOne004
     * @tc.desc Verify that abstract class and concrete child class can be loaded via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const absCls = Type.from<S04_AbstractBase_IsSetter01>() as ClassType;
      expect(absCls.getMethodByName('%%set-abstractVal')).not().assertUndefined();
      expect(absCls.getMethodByName('%%set-normalVal')).not().assertUndefined();
      const conCls = Type.from<S04_ConcreteChild_IsSetter01>() as ClassType;
      expect(conCls.getMethodByName('%%set-abstractVal')).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_0500
     * @tc.name testMethodIsSetterAtOne005
     * @tc.desc Verify that generic class with setter/getter/normal method can be loaded via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S06_GenericClass_IsSetter01<number>>() as ClassType;
      expect(_M(cls, '%%set-value')).not().assertUndefined();
      expect(cls.getMethodByName('%%get-value')).not().assertUndefined();
      expect(cls.getMethodByName('process')).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_0600
     * @tc.name testMethodIsSetterAtOne006
     * @tc.desc Verify that isSetter returns false for public getter accessed by getMethodByName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S01_IsSetter01>() as ClassType;
      const getter = cls.getMethodByName('%%get-x');
      expect(getter.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_0700
     * @tc.name testMethodIsSetterAtOne007
     * @tc.desc Verify getMethodByName for non-existent method throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S14_GetterNormal_IsSetter01>() as ClassType;
      expect(cls.getMethodByName('%%get-data').isSetter()).assertFalse();
      try {
        expect(_M(cls, 'data').isSetter()).assertFalse();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_0800
     * @tc.name testMethodIsSetterAtOne008
     * @tc.desc Verify that isSetter returns false for normal method starting with set prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S15_PrefixMethods_IsSetter01>() as ClassType;
      expect(cls.getMethodByName('setData').isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_0900
     * @tc.name testMethodIsSetterAtOne009
     * @tc.desc Verify that isSetter returns true for public setter with public access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S02_IsSetter01>() as ClassType;
      expect(cls.getMethodByName('%%set-a').isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_1000
     * @tc.name testMethodIsSetterAtOne010
     * @tc.desc Verify that isSetter returns false for default access normal method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S24_DefaultAccess_IsSetter01>() as ClassType;
      expect(_M(cls, 'doSomething').isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_1100
     * @tc.name testMethodIsSetterAtOne011
     * @tc.desc Verify that isSetter returns correct result comparing static setter and static getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S30_BothStaticAccessors_IsSetter01>() as ClassType;
      const staticSetter = findSetterMethodByClassTypeName(cls, '%%set-v', true);
      const staticGetter = findSetterMethodByClassTypeName(cls, '%%get-v', true);
      expect(staticSetter.isSetter()).assertTrue();
      expect(staticGetter.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_1300
     * @tc.name testMethodIsSetterAtOne013
     * @tc.desc Verify that isSetter returns false for inherited getter from parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S33_DerivedFromBase_IsSetter01>() as ClassType;
      expect(cls.getMethodByName('%%get-val').isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_1900
     * @tc.name testMethodIsSetterAtOne019
     * @tc.desc Verify that isSetter returns true for setter and false for getter in standard property encapsulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S76_FullProp_IsSetter01>() as ClassType;
      expect(cls.getMethodByName('%%set-x').isSetter()).assertTrue();
      expect(cls.getMethodByName('%%get-x').isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_2000
     * @tc.name testMethodIsSetterAtOne020
     * @tc.desc Verify that isSetter returns false for all normal methods in multi-level inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S79_C2_IsSetter01>() as ClassType;
      const normalNames: string[] = ['gpFn', 'pFn'];
      for (let i: number = 0; i < normalNames.length; i++) {
        expect(cls.getMethodByName(normalNames[i.toInt()]).isSetter()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_2100
     * @tc.name testMethodIsSetterAtOne021
     * @tc.desc Verify that isSetter returns correct results for class implementing interface and extending abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S82_MixedImpl_IsSetter01>() as ClassType;
      expect(cls.getMethodByName('%%set-val').isSetter()).assertTrue();
      expect(cls.getMethodByName('%%set-abstractVal').isSetter()).assertTrue();
      expect(cls.getMethodByName('extra').isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_2200
     * @tc.name testMethodIsSetterAtOne022
     * @tc.desc Verify that isSetter returns true for setters in unrelated classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls1 = Type.from<S76_FullProp_IsSetter01>() as ClassType;
      const cls2 = Type.from<S86_OtherClassB_IsSetter01>() as ClassType;
      expect(cls1.getMethodByName('%%set-x').isSetter()).assertTrue();
      expect(cls2.getMethodByName('%%set-v').isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_2300
     * @tc.name testMethodIsSetterAtOne023
     * @tc.desc Verify that isSetter returns false for normal methods in unrelated classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls1 = Type.from<S87_NormalOnly_IsSetter01>() as ClassType;
      const cls2 = Type.from<S64_Return_IsSetter01>() as ClassType;
      expect(cls1.getMethodByName('doWork').isSetter()).assertFalse();
      expect(cls2.getMethodByName('doVoid').isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_2400
     * @tc.name testMethodIsSetterAtOne024
     * @tc.desc Verify isSetter returns false for a static ordinary method using assertFalse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findIsSetter02Method(Type.from<IsSetter02_StaticMethodClass>() as ClassType, 'doSomething');
      expect(method.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_2500
     * @tc.name testMethodIsSetterAtOne025
     * @tc.desc Verify isSetter returns false for a generic class ordinary method using assertFalse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<IsSetter02_GenericClass<string>>() as ClassType).getMethodByName('process');
      expect(method.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_2600
     * @tc.name testMethodIsSetterAtOne026
     * @tc.desc Verify isSetter returns false for all ordinary methods in a plain method class using assertFalse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<IsSetter02_PlainMethodClass>() as ClassType;
      const mAdd = ct.getMethodByName('add');
      const mGreet = ct.getMethodByName('greet');
      const mLog = ct.getMethodByName('log');
      expect(mAdd.isSetter()).assertFalse();
      expect(mGreet.isSetter()).assertFalse();
      expect(mLog.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_2700
     * @tc.name testMethodIsSetterAtOne027
     * @tc.desc Verify isSetter returns false for all ordinary methods in parent and child classes using assertFalse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const baseType = Type.from<IsSetter02_BaseProp>() as ClassType;
      const derivedType = Type.from<IsSetter02_DerivedProp>() as ClassType;
      const mBase = baseType.getMethodByName('baseMethod');
      const mDerived = derivedType.getMethodByName('derivedMethod');
      expect(mBase.isSetter()).assertFalse();
      expect(mDerived.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_2800
     * @tc.name testMethodIsSetterAtOne028
     * @tc.desc Verify isSetter returns false for an inherited ordinary method using assertFalse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<IsSetter02_DerivedProp>() as ClassType).getMethodByName('baseMethod');
      expect(method.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_2900
     * @tc.name testMethodIsSetterAtOne029
     * @tc.desc Verify isSetter returns correct results for all methods in a class by traversing method categories
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<IsSetter02_PropertyClass>() as ClassType;
      const setterNames: string[] = ['%%set-name', '%%set-age', '%%set-active'];
      const normalNames: string[] = ['doTask', 'helper'];
      for (let i: number = 0; i < setterNames.length; i++) {
        expect(ct.getMethodByName(setterNames[i.toInt()]).isSetter()).assertTrue();
      }
      for (let i: number = 0; i < normalNames.length; i++) {
        expect(ct.getMethodByName(normalNames[i.toInt()]).isSetter()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_3000
     * @tc.name testMethodIsSetterAtOne030
     * @tc.desc Verify isSetter returns correct assertEqual results for parent and child class setters and getters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const baseType = Type.from<IsSetter02_BaseProp>() as ClassType;
      const derivedType = Type.from<IsSetter02_DerivedProp>() as ClassType;
      const baseSetter = baseType.getMethodByName('%%set-val');
      const baseGetter = baseType.getMethodByName('%%get-val');
      const derivedSetter = derivedType.getMethodByName('%%set-extra');
      const derivedGetter = derivedType.getMethodByName('%%get-extra');
      expect(baseSetter.isSetter()).assertTrue();
      expect(baseGetter.isSetter()).assertFalse();
      expect(derivedSetter.isSetter()).assertTrue();
      expect(derivedGetter.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_3100
     * @tc.name testMethodIsSetterAtOne031
     * @tc.desc Verify isSetter returns assertTrue for PureSetterClass setters and assertFalse for PureGetterClass getters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pureSetterType = Type.from<IsSetter02_PureSetterClass>() as ClassType;
      const pureGetterType = Type.from<IsSetter02_PureGetterClass>() as ClassType;
      const sX = pureSetterType.getMethodByName('%%set-x');
      const sY = pureSetterType.getMethodByName('%%set-y');
      const gX = pureGetterType.getMethodByName('%%get-x');
      const gLabel = pureGetterType.getMethodByName('%%get-label');
      expect(sX.isSetter()).assertTrue();
      expect(sY.isSetter()).assertTrue();
      expect(gX.isSetter()).assertFalse();
      expect(gLabel.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_3300
     * @tc.name testMethodIsSetterAtOne033
     * @tc.desc Verify isSetter returns true for a setter when a same-named ordinary method exists in the class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<IsSetter02_SameNameClass>() as ClassType).getMethodByName('%%set-val');
      expect(method.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_3400
     * @tc.name testMethodIsSetterAtOne034
     * @tc.desc Verify isSetter returns correct results for a large class with 10 properties and 5 ordinary methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<IsSetter02_LargePropClass>() as ClassType;
      for (let i: number = 1; i <= 10; i++) {
        expect(ct.getMethodByName('%%set-p' + i).isSetter()).assertTrue();
      }
      for (let i: number = 1; i <= 5; i++) {
        expect(ct.getMethodByName('n' + i).isSetter()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_3500
     * @tc.name testMethodIsSetterAtOne035
     * @tc.desc Verify isSetter returns correct results for class combining inheritance interface and own methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<IsSetter02_Worker>() as ClassType;
      const setterNames: string[] = ['%%set-status', '%%set-taskName'];
      const otherNames: string[] = ['%%get-status', '%%get-taskName', 'log', 'execute', 'report'];
      for (let i: number = 0; i < setterNames.length; i++) {
        expect(ct.getMethodByName(setterNames[i.toInt()]).isSetter()).assertTrue();
      }
      for (let i: number = 0; i < otherNames.length; i++) {
        expect(ct.getMethodByName(otherNames[i.toInt()]).isSetter()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_3600
     * @tc.name testMethodIsSetterAtOne036
     * @tc.desc Verify SingleMethodClass compiles and contains doOneThing method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<IsSetter03_SingleMethodClass>() as ClassType;
      const method = ct.getMethodByName('doOneThing');
      expect(method.getName()).assertEqual('doOneThing');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_3800
     * @tc.name testMethodIsSetterAtOne038
     * @tc.desc Verify getMethodByName may not find private parent method from child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const childType: ClassType = Type.from<IsSetter03_ChildClass2>() as ClassType;
      const method = childType.getMethodByName('privateParentMethod');
      if (method != null) {
        expect(method.isSetter()).assertFalse();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_4100
     * @tc.name testMethodIsSetterAtOne041
     * @tc.desc Verify isSetter returns true for setters in nested class hierarchy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerMethod = (Type.from<IsSetter03_InnerLevel>() as ClassType).getMethodByName('%%set-inner');
      const outerMethod = (Type.from<IsSetter03_OuterLevel>() as ClassType).getMethodByName('%%set-outer');
      expect(innerMethod.isSetter()).assertTrue();
      expect(outerMethod.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_4200
     * @tc.name testMethodIsSetterAtOne042
     * @tc.desc Verify isSetter returns false for getter with side-effect implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<IsSetter03_SideEffectGetterClass>() as ClassType).getMethodByName('%%get-sideEffect');
      expect(method.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_4300
     * @tc.name testMethodIsSetterAtOne043
     * @tc.desc Verify getMethodByName for inherited non-existent method throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const parentCt: ClassType = Type.from<IsSetter03_ParentWithSetter>() as ClassType;
        const childCt: ClassType = Type.from<IsSetter03_ChildHides>() as ClassType;
        expect(parentCt.getMethodByName('%%set-val').isSetter()).assertTrue();
        expect(_M(childCt, 'val').isSetter()).assertFalse();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_4400
     * @tc.name testMethodIsSetterAtOne044
     * @tc.desc Verify implemention class of interface setter has valid method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<IsSetter03_ImplAsNormal>() as ClassType;
      const method = ct.getMethodByName('%%set-val');
      expect(method.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_4500
     * @tc.name testMethodIsSetterAtOne045
     * @tc.desc Verify alternating isSetter calls on setter and getter are stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<IsSetter03_AlternatingClass>() as ClassType;
      const setter = ct.getMethodByName('%%set-val');
      const getter = ct.getMethodByName('%%get-val');
      for (let i: int = 0; i < 5; i++) {
        expect(setter.isSetter()).assertTrue();
        expect(getter.isSetter()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_4600
     * @tc.name testMethodIsSetterAtOne046
     * @tc.desc Verify isSetter correctly classifies setter getter and normal methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<IsSetter03_DemoHundredClass>() as ClassType;
      expect(ct.getMethodByName('%%set-s').isSetter()).assertTrue();
      expect(ct.getMethodByName('%%get-s').isSetter()).assertFalse();
      expect(ct.getMethodByName('normal').isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_4700
     * @tc.name testMethodIsSetterAtOne047
     * @tc.desc Verify getMethodByName for parent private setter val on child class yields isSetter false, then the case voluntarily fails expecting TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const childType: ClassType = Type.from<IsSetter03_ChildOfPrivateSetter>() as ClassType;
        const method = _M(childType, 'val');
        if (method != null) {
          expect(method.isSetter()).assertFalse();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_4800
     * @tc.name testMethodIsSetterAtOne048
     * @tc.desc Verify isSetter returns true for setter regardless of access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<IsSetter03_AccessModifierClass>() as ClassType;
      expect(ct.getMethodByName('%%set-pub').isSetter()).assertTrue();
      expect(ct.getMethodByName('%%set-prot').isSetter()).assertTrue();
      expect(ct.getMethodByName('%%set-priv').isSetter()).assertTrue();
      expect(ct.getMethodByName('%%set-def').isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSETTER_ONE_4900
     * @tc.name testMethodIsSetterAtOne049
     * @tc.desc Verify isSetter returns false for getter regardless of access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsSetterAtOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<IsSetter03_AccessModGetterClass>() as ClassType;
      expect(ct.getMethodByName('%%get-pub').isSetter()).assertFalse();
      expect(ct.getMethodByName('%%get-prot').isSetter()).assertFalse();
      expect(ct.getMethodByName('%%get-priv').isSetter()).assertFalse();
      expect(ct.getMethodByName('%%get-def').isSetter()).assertFalse();
    });

  });
}
