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
class T1_A {
  constructor() {}
}
class T2_A2 {
  foo(): void {}
}
class T6_E {
  constructor() {}
  static util(): void {}
}
class T9_H {
  constructor() {}
  open(): void {}
}
class T67_Mix5 {
  constructor() {}
  constructor(x: number) {}
  constructor(x: number, y: number) {}
  constructor(x: number, y: number, z: number) {}
  constructor(x: number, y: number, z: number, w: number) {}
  m0(): void {}
  m1(): void {}
  m2(): void {}
  m3(): void {}
  m4(): void {}
}
class T71_Parent {
  constructor() {}
}
class T71_Child extends T71_Parent {
  run(): void {}
}
class T74_GP2 {
  constructor() {}
  gpMethod(): void {}
}
class T74_P2 extends T74_GP2 {
  constructor() {
    super();
  }
  pMethod(): void {}
}
class T74_C2 extends T74_P2 {
  constructor() {
    super();
  }
  cMethod(): void {}
}
class T81_Base5 {
  constructor() {}
  constructor(x: number) {}
}
class T81_Mid extends T81_Base5 {
  constructor() {
    super();
  }
  constructor(x: number) {
    super(x);
  }
}
class T81_Leaf extends T81_Mid {
  constructor() {
    super();
  }
  constructor(x: number) {
    super(x);
  }
  constructor(x: number, y: string) {
    super(x);
  }
}
abstract class T87_AbsAll {
  constructor() {}
  abstract abs(): void;
  conc(): void {}
}
abstract class T109_Abs2_MethodIsConstructor03 {
  abstract Abs2_MethodIsConstructor03(): void;
}

export default function MethodIsConstructor01Test(): void {
  describe('MethodIsConstructor01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISCONSTRUCTOR_ONE_0100
     * @tc.name testMethodIsConstructorAtOne001
     * @tc.desc Verify isConstructor returns true for class with only default constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsConstructorAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((Type.from<T1_A>() as ClassType).getConstructor(0).isConstructor()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISCONSTRUCTOR_ONE_0200
     * @tc.name testMethodIsConstructorAtOne002
     * @tc.desc Verify isConstructor returns false for no-arg ordinary method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsConstructorAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((Type.from<T2_A2>() as ClassType).getMethodByName('foo').isConstructor()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISCONSTRUCTOR_ONE_0300
     * @tc.name testMethodIsConstructorAtOne003
     * @tc.desc Verify isConstructor on static method throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsConstructorAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<T6_E>() as ClassType;
      expect(ct.getConstructor(0).isConstructor()).assertTrue();
      try {
        expect(_M(ct, 'util').isConstructor()).assertFalse();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISCONSTRUCTOR_ONE_0400
     * @tc.name testMethodIsConstructorAtOne004
     * @tc.desc Verify isConstructor returns true for constructor and false for public method in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsConstructorAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<T9_H>() as ClassType;
      expect(ct.getConstructor(0).isConstructor()).assertTrue();
      expect(ct.getMethodByName('open').isConstructor()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISCONSTRUCTOR_ONE_0500
     * @tc.name testMethodIsConstructorAtOne005
     * @tc.desc Verify isConstructor returns true for 5 constructors and false for 5 instance methods in Mix5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsConstructorAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<T67_Mix5>() as ClassType;
      for (let i: number = 0; i < 5; i++) {
        expect(ct.getConstructor(i.toLong()).isConstructor()).assertTrue();
      }
      expect(ct.getMethodByName('m0').isConstructor()).assertFalse();
      expect(ct.getMethodByName('m1').isConstructor()).assertFalse();
      expect(ct.getMethodByName('m2').isConstructor()).assertFalse();
      expect(ct.getMethodByName('m3').isConstructor()).assertFalse();
      expect(ct.getMethodByName('m4').isConstructor()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISCONSTRUCTOR_ONE_0600
     * @tc.name testMethodIsConstructorAtOne006
     * @tc.desc Verify isConstructor returns true for constructors and false for instance methods across GP2/P2/C2 hierarchy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsConstructorAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((Type.from<T74_GP2>() as ClassType).getConstructor(0).isConstructor()).assertTrue();
      expect((Type.from<T74_GP2>() as ClassType).getMethodByName('gpMethod').isConstructor()).assertFalse();
      expect((Type.from<T74_P2>() as ClassType).getConstructor(0).isConstructor()).assertTrue();
      expect((Type.from<T74_P2>() as ClassType).getMethodByName('pMethod').isConstructor()).assertFalse();
      expect((Type.from<T74_C2>() as ClassType).getConstructor(0).isConstructor()).assertTrue();
      expect((Type.from<T74_C2>() as ClassType).getMethodByName('cMethod').isConstructor()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISCONSTRUCTOR_ONE_0700
     * @tc.name testMethodIsConstructorAtOne007
     * @tc.desc Verify isConstructor returns true for Parent/Child constructors and false for run method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsConstructorAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((Type.from<T71_Parent>() as ClassType).getConstructor(0).isConstructor()).assertTrue();
      expect((Type.from<T71_Child>() as ClassType).getConstructor(0).isConstructor()).assertTrue();
      expect((Type.from<T71_Child>() as ClassType).getMethodByName('run').isConstructor()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISCONSTRUCTOR_ONE_0900
     * @tc.name testMethodIsConstructorAtOne009
     * @tc.desc Verify isConstructor returns true for overloaded constructors across 3-level inheritance with overloading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsConstructorAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((Type.from<T81_Base5>() as ClassType).getConstructor(0).isConstructor()).assertTrue();
      expect((Type.from<T81_Base5>() as ClassType).getConstructor(1).isConstructor()).assertTrue();
      expect((Type.from<T81_Mid>() as ClassType).getConstructor(0).isConstructor()).assertTrue();
      expect((Type.from<T81_Mid>() as ClassType).getConstructor(1).isConstructor()).assertTrue();
      expect((Type.from<T81_Leaf>() as ClassType).getConstructor(0).isConstructor()).assertTrue();
      expect((Type.from<T81_Leaf>() as ClassType).getConstructor(1).isConstructor()).assertTrue();
      expect((Type.from<T81_Leaf>() as ClassType).getConstructor(2).isConstructor()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISCONSTRUCTOR_ONE_1000
     * @tc.name testMethodIsConstructorAtOne010
     * @tc.desc Verify isConstructor returns true for constructor and false for both abstract and concrete methods in same abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsConstructorAtOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct: ClassType = Type.from<T87_AbsAll>() as ClassType;
      expect(ct.getConstructor(0).isConstructor()).assertTrue();
      expect(ct.getMethodByName('abs').isConstructor()).assertFalse();
      expect(ct.getMethodByName('conc').isConstructor()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISCONSTRUCTOR_ONE_1100
     * @tc.name testMethodIsConstructorAtOne011
     * @tc.desc Verify isConstructor returns false for abstract method with same name as class in abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsConstructorAtOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(
        (Type.from<T109_Abs2_MethodIsConstructor03>() as ClassType)
          .getMethodByName('Abs2_MethodIsConstructor03')
          .isConstructor(),
      ).assertFalse();
    });
  });
}
