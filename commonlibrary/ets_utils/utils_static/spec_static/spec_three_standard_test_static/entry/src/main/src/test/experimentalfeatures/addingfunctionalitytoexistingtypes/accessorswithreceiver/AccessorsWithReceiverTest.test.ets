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

import Utils from '../../../Util.test'


class Person {
  firstName: string
  lastName: string
  constructor (first: string, last: string) {
    this.firstName = first
    this.lastName = last
  }
}
get fullName(this: Person): string {
  return this.firstName + ' ' + this.lastName
}

class A {
  member: int = 0
}
set m(this: A, param: int) {
  this.member = param
}

class A1 {
  member: int = 0
}
get m(this: A1): int {
  return this.member
}
set m(this: A1, param: int) {
  this.member = param
}

class Base {
  public member: int = 1
}
class A2 extends Base {}
get m(this: A2): int {
  return this.member
}
set m(this: A2, param: int) {
  this.member = param
}

class Base1 {
  public member: int = 1
  get m(): int {
    return this.member
  }
}
class A3 extends Base1 {}

set m(this: A3, param: int) {
  this.member = param
}

interface I {
  x: int;
}
get _x(this: I): long {return this.x}
set _x(this: I, param: long) {this.x = param.toInt()}

namespace myNamespace {
  export class A4 {
    member: int = 0
  }
}
get m(this: myNamespace.A4): int {
  return this.member
}
set m(this: myNamespace.A4, param: int) {
  this.member = param
}

namespace myNamespace {
  export interface I1 {
    x: int;
  }
}
get _x(this: myNamespace.I1): long {return this.x}
set _x(this: myNamespace.I1, param: long) {this.x = param.toInt()}

export default function AccessorsWithReceiverTest() :void{
  describe('AccessorsWithReceiverTest', () => {
    beforeAll(() => {})

    beforeEach(async () => {
      await Utils.msSleep(30);
    })

    afterEach(() => {})

    afterAll(() => {})

    /**
     * @tc.number    SUB_ACCESSORS_WITH_RECEIVERTEST_0100
     * @tc.name      testAccessorsWithReceiver0001
     * @tc.desc      'A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
    Class, only get accessor'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorsWithReceiver0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new Person("John", "Doe")
      expect(c.fullName).assertEqual("John Doe");
    });

    /**
     * @tc.number    SUB_ACCESSORS_WITH_RECEIVERTEST_0200
     * @tc.name      testAccessorsWithReceiver0002
     * @tc.desc      'A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
    Class, only get accessor'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorsWithReceiver0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A()
      a.m = 1
      expect(a.member).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ACCESSORS_WITH_RECEIVERTEST_0300
     * @tc.name      testAccessorsWithReceiver0003
     * @tc.desc      'A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
    Class, only get accessor'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorsWithReceiver0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A1()
      a.m++
      expect(a.m).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ACCESSORS_WITH_RECEIVERTEST_0400
     * @tc.name      testAccessorsWithReceiver0004
     * @tc.desc      'A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
    Derived class, get and set accessors'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorsWithReceiver0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A2()
      a.m++
      expect(a.m).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ACCESSORS_WITH_RECEIVERTEST_0500
     * @tc.name      testAccessorsWithReceiver0005
     * @tc.desc      'A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
    Derived class, mixed accessors'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorsWithReceiver0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A3()
      a.m++
      expect(a.m).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ACCESSORS_WITH_RECEIVERTEST_0600
     * @tc.name      testAccessorsWithReceiver0006
     * @tc.desc      'A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
    Interface, get and set accessors'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorsWithReceiver0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tstI: I = {x: 1}
      expect(tstI.x instanceof int).assertEqual(true);
      expect(tstI._x instanceof long).assertEqual(true);
      expect(tstI._x).assertEqual(1);
      tstI._x = new long(0x7FFF_FFFF_1)
      expect(tstI._x).assertEqual(-15);
    });

    /**
     * @tc.number    SUB_ACCESSORS_WITH_RECEIVERTEST_0700
     * @tc.name      testAccessorsWithReceiver0007
     * @tc.desc      'If the accessor with receiver is an entity of a namespace, then the same rules
    apply to it when exporting and using qualified names as the rules that apply to
    other namespace entities
    Class in namespace'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorsWithReceiver0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new myNamespace.A4()
      a.m++
      expect(a.m).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ACCESSORS_WITH_RECEIVERTEST_0800
     * @tc.name      testAccessorsWithReceiver0008
     * @tc.desc      'If the accessor with receiver is an entity of a namespace, then the same rules
    apply to it when exporting and using qualified names as the rules that apply to
    other namespace entities
    Interface in namespace'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorsWithReceiver0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tstI: myNamespace.I1 = {x: 1}
      expect(tstI.x instanceof int).assertEqual(true);
      expect(tstI._x instanceof long).assertEqual(true);
      expect(tstI._x).assertEqual(1);
      tstI._x = new long(0x7FFF_FFFF_1)
      expect(tstI._x).assertEqual(-15);
    });
  })
}
