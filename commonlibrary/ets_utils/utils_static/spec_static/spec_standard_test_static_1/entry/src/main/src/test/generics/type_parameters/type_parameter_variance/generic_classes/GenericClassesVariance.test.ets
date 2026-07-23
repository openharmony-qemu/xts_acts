'use static'
/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import Utils from "../../../../Util.test";

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
} from '../../../../../../../hypium/index';

// ---- Combined usage of in, out, and invariant modifiers ----

class X1<in T1, out T2, T3> {
    readonly t2_obj: T2
    t3_obj: T3
    constructor(p: T2, t3: T3) {
        this.t2_obj = p
        this.t3_obj = t3
    }

    f1(p: T1) {}

    f2(): T2 { return this.t2_obj }

    f3(p: T3): T3 { return p }
}

// ---- Invariant: interfaces and implementing classes ----

interface I2<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class IA2<T> implements I2<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I3<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class IA3<T> implements I3<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I4<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class IA4<T> implements I4<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I5<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class IA5<T> implements I5<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I6<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class IA6<T> implements I6<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I7<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class IA7<T> implements I7<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I8<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class IA8<T> implements I8<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I9<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class IA9<T> implements I9<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I10<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class IA10<T> implements I10<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

interface I11<T> {
  c: T
  f(p: T): T
  f1(p: T): string
  f2(): T
}

class IA11<T> implements I11<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

// ---- Invariant: plain classes (no interface) ----

class A2<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A3<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A4<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A5<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A6<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A7<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A8<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A9<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A10<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

class A11<T> {
  c: T
  constructor(p: T) { this.c = p }
  f(p: T): T { return p }
  f1(p: T): string { return "v = " + p }
  f2(): T { return this.c }
}

// ---- Contravariant (in): interfaces and implementing classes ----

interface I12<in T> {
  f(p: T): void
  f1(p: T): string
}

class IA12<in T> implements I12<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I13<in T> {
  f(p: T): void
  f1(p: T): string
}

class IA13<in T> implements I13<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I14<in T> {
  f(p: T): void
  f1(p: T): string
}

class IA14<in T> implements I14<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I15<in T> {
  f(p: T): void
  f1(p: T): string
}

class IA15<in T> implements I15<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I16<in T> {
  f(p: T): void
  f1(p: T): string
}

class IA16<in T> implements I16<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I17<in T> {
  f(p: T): void
  f1(p: T): string
}

class IA17<in T> implements I17<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I18<in T> {
  f(p: T): void
  f1(p: T): string
}

class IA18<in T> implements I18<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I19<in T> {
  f(p: T): void
  f1(p: T): string
}

class IA19<in T> implements I19<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I20<in T> {
  f(p: T): void
  f1(p: T): string
}

class IA20<in T> implements I20<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

interface I21<in T> {
  f(p: T): void
  f1(p: T): string
}

class IA21<in T> implements I21<T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

// ---- Contravariant (in): plain classes (no interface) ----

class A12<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A13<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A14<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A15<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A16<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A17<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A18<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A19<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A20<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

class A21<in T> {
  f(p: T) {}
  f1(p: T): string { return "v = " + p }
}

export default function GenericVarianceTest(): void {
  describe("GenericVarianceTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_0100
     * @tc.name      testGenericVariance0001
     * @tc.desc      Test of usage modifiers in and out, as well as type parameter without modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: X1<number, number, number> = new X1<number, number, number>(1, 0)
      expect(x.f2()).assertEqual(1)
      expect(x.f3(1)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_0200
     * @tc.name      testGenericVariance0002
     * @tc.desc      Test invariant class and interface with string type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: string = "abc"
      // Class invariance
      let a: A2<string> = new A2<string>(arg)
      expect(a.f(arg)).assertEqual("abc")
      expect(a.f1(arg)).assertEqual("v = abc")
      expect(a.f2()).assertEqual("abc")
      // Interface invariance
      let a_i: I2<string> = new IA2<string>(arg)
      expect(a_i.f(arg)).assertEqual("abc")
      expect(a_i.f1(arg)).assertEqual("v = abc")
      expect(a_i.f2()).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_0300
     * @tc.name      testGenericVariance0003
     * @tc.desc      Test invariant class and interface with byte type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: byte = 1
      // Class invariance
      let a: A3<byte> = new A3<byte>(arg)
      expect(a.f(arg)).assertEqual(1)
      expect(a.f1(arg)).assertEqual("v = 1")
      expect(a.f2()).assertEqual(1)
      // Interface invariance
      let a_i: I3<byte> = new IA3<byte>(arg)
      expect(a_i.f(arg)).assertEqual(1)
      expect(a_i.f1(arg)).assertEqual("v = 1")
      expect(a_i.f2()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_0400
     * @tc.name      testGenericVariance0004
     * @tc.desc      Test invariant class and interface with short type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: short = 1
      // Class invariance
      let a: A4<short> = new A4<short>(arg)
      expect(a.f(arg)).assertEqual(1)
      expect(a.f1(arg)).assertEqual("v = 1")
      expect(a.f2()).assertEqual(1)
      // Interface invariance
      let a_i: I4<short> = new IA4<short>(arg)
      expect(a_i.f(arg)).assertEqual(1)
      expect(a_i.f1(arg)).assertEqual("v = 1")
      expect(a_i.f2()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_0500
     * @tc.name      testGenericVariance0005
     * @tc.desc      Test invariant class and interface with int type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: int = 1
      // Class invariance
      let a: A5<int> = new A5<int>(arg)
      expect(a.f(arg)).assertEqual(1)
      expect(a.f1(arg)).assertEqual("v = 1")
      expect(a.f2()).assertEqual(1)
      // Interface invariance
      let a_i: I5<int> = new IA5<int>(arg)
      expect(a_i.f(arg)).assertEqual(1)
      expect(a_i.f1(arg)).assertEqual("v = 1")
      expect(a_i.f2()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_0600
     * @tc.name      testGenericVariance0006
     * @tc.desc      Test invariant class and interface with long type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: long = 1
      // Class invariance
      let a: A6<long> = new A6<long>(arg)
      expect(a.f(arg)).assertEqual(1)
      expect(a.f1(arg)).assertEqual("v = 1")
      expect(a.f2()).assertEqual(1)
      // Interface invariance
      let a_i: I6<long> = new IA6<long>(arg)
      expect(a_i.f(arg)).assertEqual(1)
      expect(a_i.f1(arg)).assertEqual("v = 1")
      expect(a_i.f2()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_0700
     * @tc.name      testGenericVariance0007
     * @tc.desc      Test invariant class and interface with float type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: float = 1.1f
      // Class invariance
      let a: A7<float> = new A7<float>(arg)
      expect(a.f(arg)).assertEqual(1.1f)
      expect(a.f1(arg)).assertEqual("v = 1.1")
      expect(a.f2()).assertEqual(1.1f)
      // Interface invariance
      let a_i: I7<float> = new IA7<float>(arg)
      expect(a_i.f(arg)).assertEqual(1.1f)
      expect(a_i.f1(arg)).assertEqual("v = 1.1")
      expect(a_i.f2()).assertEqual(1.1f)
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_0800
     * @tc.name      testGenericVariance0008
     * @tc.desc      Test invariant class and interface with double type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: double = 1.2
      // Class invariance
      let a: A8<double> = new A8<double>(arg)
      expect(a.f(arg)).assertEqual(1.2)
      expect(a.f1(arg)).assertEqual("v = 1.2")
      expect(a.f2()).assertEqual(1.2)
      // Interface invariance
      let a_i: I8<double> = new IA8<double>(arg)
      expect(a_i.f(arg)).assertEqual(1.2)
      expect(a_i.f1(arg)).assertEqual("v = 1.2")
      expect(a_i.f2()).assertEqual(1.2)
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_0900
     * @tc.name      testGenericVariance0009
     * @tc.desc      Test invariant class and interface with number type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: number = 1.3
      // Class invariance
      let a: A9<number> = new A9<number>(arg)
      expect(a.f(arg)).assertEqual(1.3)
      expect(a.f1(arg)).assertEqual("v = 1.3")
      expect(a.f2()).assertEqual(1.3)
      // Interface invariance
      let a_i: I9<number> = new IA9<number>(arg)
      expect(a_i.f(arg)).assertEqual(1.3)
      expect(a_i.f1(arg)).assertEqual("v = 1.3")
      expect(a_i.f2()).assertEqual(1.3)
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_1000
     * @tc.name      testGenericVariance0010
     * @tc.desc      Test invariant class and interface with boolean type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: boolean = true
      // Class invariance
      let a: A10<boolean> = new A10<boolean>(arg)
      expect(a.f(arg)).assertTrue()
      expect(a.f1(arg)).assertEqual("v = true")
      expect(a.f2()).assertTrue()
      // Interface invariance
      let a_i: I10<boolean> = new IA10<boolean>(arg)
      expect(a_i.f(arg)).assertTrue()
      expect(a_i.f1(arg)).assertEqual("v = true")
      expect(a_i.f2()).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_1100
     * @tc.name      testGenericVariance0011
     * @tc.desc      Test invariant class and interface with bigint type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: bigint = 10n
      // Class invariance
      let a: A11<bigint> = new A11<bigint>(arg)
      expect(a.f(arg)).assertEqual(10n)
      expect(a.f1(arg)).assertEqual("v = 10")
      expect(a.f2()).assertEqual(10n)
      // Interface invariance
      let a_i: I11<bigint> = new IA11<bigint>(arg)
      expect(a_i.f(arg)).assertEqual(10n)
      expect(a_i.f1(arg)).assertEqual("v = 10")
      expect(a_i.f2()).assertEqual(10n)
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_1200
     * @tc.name      testGenericVariance0012
     * @tc.desc      Test contravariant in class and interface with string type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: string = "abc"
      // Class contravariance
      let a: A12<string> = new A12<string>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = abc")
      // Interface contravariance
      let a_i: I12<string> = new IA12<string>()
      a_i.f(arg)
      expect(a_i.f1(arg)).assertEqual("v = abc")
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_1300
     * @tc.name      testGenericVariance0013
     * @tc.desc      Test contravariant in class and interface with byte type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: byte = 1
      // Class contravariance
      let a: A13<byte> = new A13<byte>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1")
      // Interface contravariance
      let a_i: I13<byte> = new IA13<byte>()
      a_i.f(arg)
      expect(a_i.f1(arg)).assertEqual("v = 1")
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_1400
     * @tc.name      testGenericVariance0014
     * @tc.desc      Test contravariant in class and interface with short type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: short = 1
      // Class contravariance
      let a: A14<short> = new A14<short>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1")
      // Interface contravariance
      let a_i: I14<short> = new IA14<short>()
      a_i.f(arg)
      expect(a_i.f1(arg)).assertEqual("v = 1")
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_1500
     * @tc.name      testGenericVariance0015
     * @tc.desc      Test contravariant in class and interface with int type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: int = 1
      // Class contravariance
      let a: A15<int> = new A15<int>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1")
      // Interface contravariance
      let a_i: I15<int> = new IA15<int>()
      a_i.f(arg)
      expect(a_i.f1(arg)).assertEqual("v = 1")
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_1600
     * @tc.name      testGenericVariance0016
     * @tc.desc      Test contravariant in class and interface with long type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: long = 1
      // Class contravariance
      let a: A16<long> = new A16<long>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1")
      // Interface contravariance
      let a_i: I16<long> = new IA16<long>()
      a_i.f(arg)
      expect(a_i.f1(arg)).assertEqual("v = 1")
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_1700
     * @tc.name      testGenericVariance0017
     * @tc.desc      Test contravariant in class and interface with float type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: float = 1.1f
      // Class contravariance
      let a: A17<float> = new A17<float>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1.1")
      // Interface contravariance
      let a_i: I17<float> = new IA17<float>()
      a_i.f(arg)
      expect(a_i.f1(arg)).assertEqual("v = 1.1")
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_1800
     * @tc.name      testGenericVariance0018
     * @tc.desc      Test contravariant in class and interface with double type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: double = 1.2
      // Class contravariance
      let a: A18<double> = new A18<double>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1.2")
      // Interface contravariance
      let a_i: I18<double> = new IA18<double>()
      a_i.f(arg)
      expect(a_i.f1(arg)).assertEqual("v = 1.2")
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_1900
     * @tc.name      testGenericVariance0019
     * @tc.desc      Test contravariant in class and interface with number type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: number = 1.3
      // Class contravariance
      let a: A19<number> = new A19<number>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 1.3")
      // Interface contravariance
      let a_i: I19<number> = new IA19<number>()
      a_i.f(arg)
      expect(a_i.f1(arg)).assertEqual("v = 1.3")
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_2000
     * @tc.name      testGenericVariance0020
     * @tc.desc      Test contravariant in class and interface with boolean type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: boolean = true
      // Class contravariance
      let a: A20<boolean> = new A20<boolean>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = true")
      // Interface contravariance
      let a_i: I20<boolean> = new IA20<boolean>()
      a_i.f(arg)
      expect(a_i.f1(arg)).assertEqual("v = true")
    })

    /**
     * @tc.number    SUB_GENERIC_VARIANCE_2100
     * @tc.name      testGenericVariance0021
     * @tc.desc      Test contravariant in class and interface with bigint type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericVariance0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: bigint = 10n
      // Class contravariance
      let a: A21<bigint> = new A21<bigint>()
      a.f(arg)
      expect(a.f1(arg)).assertEqual("v = 10")
      // Interface contravariance
      let a_i: I21<bigint> = new IA21<bigint>()
      a_i.f(arg)
      expect(a_i.f1(arg)).assertEqual("v = 10")
    })
  })
}
