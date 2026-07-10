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
  Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';

import Utils from '../../Util.test'

interface Vehicle {
  getHorsePower(rpm: int, torque: int): int {
  return (rpm * torque) / 5;
}
}

interface Auto extends Vehicle {}

interface Vehicle1 {
  private getHorsePower3(rpm: int, torque: int): int {
  return (rpm * torque) / 5252;
}

getPwrIndex(torque: int): int {
  return this.getHorsePower3(5252, torque);
}
}

class A implements Vehicle {
}

class B implements Vehicle {
  public getHorsePower(rpm: int, torque: int): int {
    return rpm * torque;
  }
}

class A1 implements Auto {
  public getHorsePower(rpm: int, torque: int): int {
    return rpm * torque;
  }
}

class B1 extends A1 {}

class C implements Auto {}

class Car implements Vehicle1 {}

export default function DefaultInterfaceMethodDeclarationsTest() : void{
  describe('DefaultInterfaceMethodDeclarationsTest', () => {
    beforeAll(() => {})

    beforeEach(async () => {
      await Utils.msSleep(30);
    })

    afterEach(() => {})

    afterAll(() => {})

    /**
     * @tc.number    SUB_DEFAULT_INTERFACE_METHOD_DECLARATIONSTEST_0100
     * @tc.name      testDefaultInterfaceMethodDeclarations0001
     * @tc.desc      A class implementing an interface uses the default method implementation
     *               unless it overrides the method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultInterfaceMethodDeclarations0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A = new A()
      expect(a.getHorsePower(5, 5)).assertEqual(5);

      let b: B = new B()
      expect(b.getHorsePower(5, 5)).assertEqual(25);

    });

    /**
     * @tc.number    SUB_DEFAULT_INTERFACE_METHOD_DECLARATIONSTEST_0200
     * @tc.name      testDefaultInterfaceMethodDeclarations0002
     * @tc.desc      A block of code that represents the body of a default method in an interface
     *               provides a default implementation for any class unless such class overrides the
     *               method to implement the interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultInterfaceMethodDeclarations0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A1 = new A1()
      expect(a.getHorsePower(5, 5)).assertEqual(25);

      let b: B1 = new B1()
      expect(b.getHorsePower(5, 5)).assertEqual(25);

      let c: C = new C()
      expect(c.getHorsePower(5, 5)).assertEqual(5);
    });

    /**
     * @tc.number    SUB_DEFAULT_INTERFACE_METHOD_DECLARATIONSTEST_0300
     * @tc.name      testDefaultInterfaceMethodDeclarations0003
     * @tc.desc      A default method can be explicitly declared private in an interface body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultInterfaceMethodDeclarations0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Car().getPwrIndex(1)).assertEqual(1);
    });
  })
}