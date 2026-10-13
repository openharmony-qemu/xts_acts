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
abstract class L03_IsAbstract01 {
  abstract abs(): void;
  constructor() {}
  get v(): number {
    return 0;
  }
  set v(x: number) {}
  concrete(): void {}
}
abstract class L04_IsAbstract01 {
  abstract a(): void;
  abstract b(): void;
  abstract c(): void;
  d(): void {}
  e(): void {}
}
abstract class M07_GP_IsAbstract01 {
  abstract gp(): void;
}
abstract class M07_P_IsAbstract01 extends M07_GP_IsAbstract01 {
  abstract p(): void;
}
class M07_C_IsAbstract01 extends M07_P_IsAbstract01 {
  gp(): void {}
  p(): void {}
}
interface N06_IF_IsAbstract01 {
  a(): void;
  b(): void;
}
abstract class N06_Abs_IsAbstract01 implements N06_IF_IsAbstract01 {
  abstract a(): void;
  b(): void {}
}
class O12_IsAbstract01 {
  a(): void {}
  b(): void {}
  c(): void {}
}
function __getMethods(cls: ClassType): Method[] {
  let result: Method[] = [];
  let n: long = cls.getMethodsNum();
  for (let i: long = 0; i < n; i++) {
    result.push(cls.getMethod(i.toLong()));
  }
  return result;
}

export default function MethodIsAbstract01Test(): void {
  describe('MethodIsAbstract01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISABSTRACT_ONE_0100
     * @tc.name testMethodIsAbstractAtOne001
     * @tc.desc Verify isAbstract returns true for abstract method and false for constructor, getter, setter and concrete method in same abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAbstractAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct = Type.from<L03_IsAbstract01>() as ClassType;
      expect(ct.getMethodByName('abs').isAbstract()).assertTrue();
      expect(ct.getConstructor(0).isAbstract()).assertFalse();
      expect(ct.getMethodByName('%%get-v').isAbstract()).assertFalse();
      expect(ct.getMethodByName('concrete').isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISABSTRACT_ONE_0200
     * @tc.name testMethodIsAbstractAtOne002
     * @tc.desc Verify isAbstract returns true for 3 abstract methods and false for 2 concrete methods in same abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAbstractAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct = Type.from<L04_IsAbstract01>() as ClassType;
      let abstractNames: string[] = ['a', 'b', 'c'];
      let concreteNames: string[] = ['d', 'e'];
      for (let name of abstractNames) {
        expect(ct.getMethodByName(name).isAbstract()).assertTrue();
      }
      for (let name of concreteNames) {
        expect(ct.getMethodByName(name).isAbstract()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISABSTRACT_ONE_0300
     * @tc.name testMethodIsAbstractAtOne003
     * @tc.desc Verify isAbstract returns true for abstract methods in multi-level abstract parent and false for concrete child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAbstractAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCt = Type.from<M07_P_IsAbstract01>() as ClassType;
      let childCt = Type.from<M07_C_IsAbstract01>() as ClassType;
      expect(parentCt.getMethodByName('gp').isAbstract()).assertTrue();
      expect(parentCt.getMethodByName('p').isAbstract()).assertTrue();
      expect(childCt.getMethodByName('gp').isAbstract()).assertFalse();
      expect(childCt.getMethodByName('p').isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISABSTRACT_ONE_0400
     * @tc.name testMethodIsAbstractAtOne004
     * @tc.desc Verify isAbstract returns true for abstract implementation and false for concrete implementation in abstract class implementing interface partially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAbstractAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct = Type.from<N06_Abs_IsAbstract01>() as ClassType;
      expect(ct.getMethodByName('a').isAbstract()).assertTrue();
      expect(ct.getMethodByName('b').isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISABSTRACT_ONE_0500
     * @tc.name testMethodIsAbstractAtOne005
     * @tc.desc Verify isAbstract returns false for all methods in normal class when traversing via __getMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsAbstractAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct = Type.from<O12_IsAbstract01>() as ClassType;
      let methods = __getMethods(ct);
      for (let method of methods) {
        expect(method.isAbstract()).assertFalse();
      }
    });
  });
}
