'use static'
/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,
  Level, Size, TestType } from '../../../../../../hypium/index';

import Utils from '../../../Util.test'


class A {
  res: int = 0;
  final foo(): void {
    this.res = 1;
  }
}

class A1 {
  res: int = 0;
  public final method1(): void {
    this.res = 1;
  }
  public final method2(): void {
    this.method1();
  }
}

class A2 {
  res: int = 0;
  final method1(): void {
    this.res = 1;
  }
}
class B extends A2 {
  method2(): void {
    this.method1();
  }
}

class A3 {
  meth(s: string, n: number): string {
    return s + n + "A3"
  }
}
class F extends A3 {
  final meth(s: string, n: number): string {
    return s + n + "F"
  }
}

export default function FinalMethodsTest() :void{
  describe('FinalMethodsTest', () => {
    beforeAll(() => {})

    beforeEach(async () => {
      await Utils.msSleep(30);
    })

    afterEach(() => {})

    afterAll(() => {})

    /**
     * @tc.number    SUB_FINAL_METHODS_XTSTEST_0100
     * @tc.name      testFinalMethods0001
     * @tc.desc      Checks that final method can be called.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFinalMethods0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A = new A();
      a.foo();
      expect( a.res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FINAL_METHODS_XTSTEST_0200
     * @tc.name      testFinalMethods0002
     * @tc.desc      Checks that final method can be called from another final method inside the
    same class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFinalMethods0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A1 = new A1();
      a.method2();
      expect( a.res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FINAL_METHODS_XTSTEST_0300
     * @tc.name      testFinalMethods0003
     * @tc.desc      Checks that final method can be called from another method inside the same class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFinalMethods0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B = new B();
      b.method2();
      expect( b.res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FINAL_METHODS_XTSTEST_0400
     * @tc.name      testFinalMethods0004
     * @tc.desc      A method can be declared final to prevent it from being overridden (see Overloading
    and Overriding) in subclasses.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFinalMethods0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( new A3().meth("x", 1)).assertEqual("x1A3");
      expect( new F().meth("y", 2)).assertEqual("y2F");
    });
  })
}
