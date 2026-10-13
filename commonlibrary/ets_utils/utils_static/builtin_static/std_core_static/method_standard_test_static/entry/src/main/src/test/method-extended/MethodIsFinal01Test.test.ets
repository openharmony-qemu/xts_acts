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
  TestType
} from '../../../../../hypium/index';
import Utils from '../../Util.test';

function _M(ct: ClassType, name: string): Method {
  return ct.getMethodByName(name) as Method;
}
class NormalCls_IsFinal01_T03 { getName(): string { return ''; } }
class NormalCls_IsFinal01_T31 { static create(name: string): void {} }
class NormalCls_IsFinal01_T35 { static get count(): number { return 0; } }
class NormalCls_IsFinal01_T39 { constructor(name: string) {} }
class A_IsFinal01_T50 { a(): void {} }
class B_IsFinal01_T50 extends A_IsFinal01_T50 { b(): void {} }
class C_IsFinal01_T50 extends B_IsFinal01_T50 { c(): void {} }
class D_IsFinal01_T50 extends C_IsFinal01_T50 { d(): void {} }
class E_IsFinal01_T50 extends D_IsFinal01_T50 { e(): void {} }
class Top_IsFinal01_T52 { topMethod(): void {} }
class Mid_IsFinal01_T52 extends Top_IsFinal01_T52 { midMethod(): void {} }
class Bot_IsFinal01_T52 extends Mid_IsFinal01_T52 { botMethod(): void {} }
interface IA_IsFinal01_T74 { methodA(): void }
interface IB_IsFinal01_T74 extends IA_IsFinal01_T74 { methodB(): void }

final class Impl_IsFinal01_T74 implements IB_IsFinal01_T74 { methodA(): void {}; methodB(): void {} }
final class TenMethods_IsFinal01_T81 {
  a(): void {}; b(): void {}; c(): void {}; d(): void {}; e(): void {};
  f(): void {}; g(): void {}; h(): void {}; i(): void {}; j(): void {}
}

final class Mixed_IsFinal01_T83 {
  static s(): void {}; i(): void {};
  get v(): number { return 0; }; set v(x: number) {};
  constructor() {}
}

final class EmptyCls_IsFinal01_T85 {}
class OnlyCtor_IsFinal01_T88 { constructor() {} }
class Parent_IsFinal02_T89 { parentMethod(): void {} }

final class Child_IsFinal02_T89 extends Parent_IsFinal02_T89 { childMethod(): void {} }
class GP_IsFinal02_T90 { gpMethod(): void {} }

final class P_IsFinal02_T90 extends GP_IsFinal02_T90 { pMethod(): void {} }
class Cls_IsFinal03_T21 { run(): void {} }
interface IA_IsFinal03_T45 {
  a(): void
  b(): void
}
class Impl_IsFinal03_T45 implements IA_IsFinal03_T45 { a(): void {}; b(): void {} }
abstract class AbsCls_IsFinal03_T27 { abstract doIt(): void; }
class NormalCls_IsFinal03_T27 extends AbsCls_IsFinal03_T27 { doIt(): void {} }
final class Cls_IsFinal03_T82 { classMethod(): void {} }

final class FinalCls_IsFinal02_T10 { getChar(): string { return ''; } }
final class FinalCls_IsFinal02_T21 { private secret(): void {} }
final class FinalCls_IsFinal02_T28 { constructor() {} }
final class FinalCls_IsFinal02_T29 { native doNative(): void }
final class FinalCls_IsFinal02_T30 { async fetch(): Promise<void> {} }
final class FinalCls_IsFinal02_T31 { wrap<T>(val: T): T { return val; } }

export default function MethodIsFinal01Test(): void {
  describe('MethodIsFinal01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_0100
     * @tc.name testMethodIsFinalAtOne001
     * @tc.desc Verify isFinal returns false for normal class method with string return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((Type.from<NormalCls_IsFinal01_T03>() as ClassType).getMethodByName('getName').isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_0300
     * @tc.name testMethodIsFinalAtOne003
     * @tc.desc Verify isFinal on normal class static method with parameters throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        expect(_M((Type.from<NormalCls_IsFinal01_T31>() as ClassType), 'create').isFinal()).assertFalse();
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('TypeError'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_0400
     * @tc.name testMethodIsFinalAtOne004
     * @tc.desc Verify isFinal on normal class static getter throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        expect(_M((Type.from<NormalCls_IsFinal01_T35>() as ClassType), '%%get-count').isFinal()).assertFalse();
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('TypeError'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_0500
     * @tc.name testMethodIsFinalAtOne005
     * @tc.desc Verify getConstructor with out-of-range index throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        expect((Type.from<NormalCls_IsFinal01_T39>() as ClassType).getConstructor(1).isFinal()).assertFalse();
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('TypeError'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_0800
     * @tc.name testMethodIsFinalAtOne008
     * @tc.desc Verify isFinal returns false for all methods in five-layer normal inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct = Type.from<E_IsFinal01_T50>() as ClassType;
      expect(ct.getMethodByName('a').isFinal()).assertFalse();
      expect(ct.getMethodByName('b').isFinal()).assertFalse();
      expect(ct.getMethodByName('c').isFinal()).assertFalse();
      expect(ct.getMethodByName('d').isFinal()).assertFalse();
      expect(ct.getMethodByName('e').isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_0900
     * @tc.name testMethodIsFinalAtOne009
     * @tc.desc Verify isFinal returns false for bottom non-final method in three-layer inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct = Type.from<Bot_IsFinal01_T52>() as ClassType;
      expect(ct.getMethodByName('botMethod').isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_1400
     * @tc.name testMethodIsFinalAtOne014
     * @tc.desc Verify isFinal returns false for interface methods implemented in normal subclass with multi-level interface inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct = Type.from<Impl_IsFinal01_T74>() as ClassType;
      expect(ct.getMethodByName('methodA').isFinal()).assertFalse();
      expect(ct.getMethodByName('methodB').isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_1600
     * @tc.name testMethodIsFinalAtOne016
     * @tc.desc Verify isFinal returns false for all ten methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct = Type.from<TenMethods_IsFinal01_T81>() as ClassType;
      expect(ct.getMethodByName('a').isFinal()).assertFalse();
      expect(ct.getMethodByName('b').isFinal()).assertFalse();
      expect(ct.getMethodByName('c').isFinal()).assertFalse();
      expect(ct.getMethodByName('d').isFinal()).assertFalse();
      expect(ct.getMethodByName('e').isFinal()).assertFalse();
      expect(ct.getMethodByName('f').isFinal()).assertFalse();
      expect(ct.getMethodByName('g').isFinal()).assertFalse();
      expect(ct.getMethodByName('h').isFinal()).assertFalse();
      expect(ct.getMethodByName('i').isFinal()).assertFalse();
      expect(ct.getMethodByName('j').isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_1700
     * @tc.name testMethodIsFinalAtOne017
     * @tc.desc Verify isFinal on static method throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct = Type.from<Mixed_IsFinal01_T83>() as ClassType;
      try {
        expect(_M(ct, 's').isFinal()).assertFalse();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(ct.getMethodByName('i').isFinal()).assertFalse();
      expect(ct.getMethodByName('%%get-v').isFinal()).assertFalse();
      expect(ct.getMethodByName('%%set-v').isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_1800
     * @tc.name testMethodIsFinalAtOne018
     * @tc.desc Verify getMethodsNum returns 18 for empty final class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((Type.from<EmptyCls_IsFinal01_T85>() as ClassType).getMethodsNum()).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_1900
     * @tc.name testMethodIsFinalAtOne019
     * @tc.desc Verify isFinal returns false for constructor in normal class with only constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((Type.from<OnlyCtor_IsFinal01_T88>() as ClassType).getConstructor(0).isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_3100
     * @tc.name testMethodIsFinalAtOne031
     * @tc.desc Verify that getMethodByName with non-existent name on normal class throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let m = (Type.from<Cls_IsFinal03_T21>() as ClassType).getMethodByName('nonExistent');
        m.isFinal();
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('TypeError'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_3200
     * @tc.name testMethodIsFinalAtOne032
     * @tc.desc Verify that isFinal returns false for abstract method implemented in normal subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let ct = Type.from<NormalCls_IsFinal03_T27>() as ClassType;
        expect(ct.getMethodByName('doIt').isFinal()).assertFalse();
        });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_3300
     * @tc.name testMethodIsFinalAtOne033
     * @tc.desc Verify that isFinal returns false for implemented interface method accessed from impl class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = (Type.from<Impl_IsFinal03_T45>() as ClassType).getMethodByName('b');
      expect(m.isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISFINAL_ONE_3500
     * @tc.name testMethodIsFinalAtOne035
     * @tc.desc Verify that getMethodsNum of final class with 19 methods returns 19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsFinalAtOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((Type.from<Cls_IsFinal03_T82>() as ClassType).getMethodsNum()).assertEqual(19);
    });
  });
}
