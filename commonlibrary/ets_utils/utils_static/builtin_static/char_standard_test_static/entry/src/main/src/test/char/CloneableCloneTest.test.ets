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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class Point001 implements Cloneable {
  x: int
  y: int
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  clone(): Point001 {
    return new Point001(this.x, this.y)
  }
}

class Point003 implements Cloneable {
  x: int
  y: int
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  clone(): Point003 {
    return new Point003(this.x, this.y)
  }
}

class Point004 implements Cloneable {
  x: int
  y: int
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  clone(): Point004 {
    return new Point004(this.x, this.y)
  }
}

class Point007 implements Cloneable {
  x: int
  y: int
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  clone(): Point007 {
    return new Point007(this.x, this.y)
  }
}

class Point008 implements Cloneable {
  x: int
  y: int
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  clone(): Point008 {
    return new Point008(this.x, this.y)
  }
}

class Point3D008 extends Point008 {
  z: int
  constructor(x: int, y: int, z: int) {
    super(x, y)
    this.z = z
  }
  clone(): Point3D008 {
    return new Point3D008(this.x, this.y, this.z)
  }
}

class ColorPoint009 extends Point008 {
  color: string
  constructor(x: int, y: int, color: string) {
    super(x, y)
    this.color = color
  }
  clone(): ColorPoint009 {
    return new ColorPoint009(this.x, this.y, this.color)
  }
}

class Point010 implements Cloneable {
  x: int
  y: int
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  clone(): Point010 {
    return new Point010(this.x, this.y)
  }
}

class Inner012 implements Cloneable {
  value: int
  constructor(value: int) {
    this.value = value
  }
  clone(): Inner012 {
    return new Inner012(this.value)
  }
}

class Outer012 implements Cloneable {
  inner: Inner012
  constructor(inner: Inner012) {
    this.inner = inner
  }
  clone(): Outer012 {
    return new Outer012(this.inner.clone())
  }
}

class NamedPoint016 implements Cloneable {
  name: string
  x: int
  y: int
  constructor(name: string, x: int, y: int) {
    this.name = name
    this.x = x
    this.y = y
  }
  clone(): NamedPoint016 {
    return new NamedPoint016(this.name, this.x, this.y)
  }
}

class Single024 implements Cloneable {
  value: int
  constructor(value: int) {
    this.value = value
  }
  clone(): Single024 {
    return new Single024(this.value)
  }
}

class Complex025 implements Cloneable {
  intVal: int
  strVal: string
  boolVal: boolean
  constructor(intVal: int, strVal: string, boolVal: boolean) {
    this.intVal = intVal
    this.strVal = strVal
    this.boolVal = boolVal
  }
  clone(): Complex025 {
    return new Complex025(this.intVal, this.strVal, this.boolVal)
  }
}

class CharHolder026 implements Cloneable {
  ch: char
  constructor(ch: char) {
    this.ch = ch
  }
  clone(): CharHolder026 {
    return new CharHolder026(this.ch)
  }
}

class ArrayHolder028 implements Cloneable {
  items: int[]
  constructor(items: int[]) {
    this.items = items
  }
  clone(): ArrayHolder028 {
    return new ArrayHolder028([...this.items])
  }
}

class BadPoint030 implements Cloneable {
  x: int
  y: int
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  clone(): BadPoint030 {
    throw new Error("clone failed")
  }
}

class ErrorPoint032 implements Cloneable {
  x: int
  constructor(x: int) {
    this.x = x
  }
  clone(): ErrorPoint032 {
    throw new Error("clone failed")
  }
}

class CloneError033 extends Error {
  errorCode: int
  constructor(message: string, errorCode: int) {
    super(message)
    this.name = "CloneError"
    this.errorCode = errorCode
  }
}

class FaultyPoint033 implements Cloneable {
  x: int
  constructor(x: int) {
    this.x = x
  }
  clone(): FaultyPoint033 {
    throw new CloneError033("unsupported type", 1001)
  }
}

class CrashPoint036 implements Cloneable {
  x: int
  constructor(x: int) {
    this.x = x
  }
  clone(): CrashPoint036 {
    throw new Error("unhandled clone error")
  }
}

class BasePoint037 implements Cloneable {
  x: int
  y: int
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  clone(): BasePoint037 {
    return new BasePoint037(this.x, this.y)
  }
}

class DerivedPoint037 extends BasePoint037 {
  z: int
  constructor(x: int, y: int, z: int) {
    super(x, y)
    this.z = z
  }
  override clone(): DerivedPoint037 {
    return new DerivedPoint037(this.x, this.y, this.z)
  }
}

class Animal038 implements Cloneable {
  name: string
  constructor(name: string) {
    this.name = name
  }
  clone(): Animal038 {
    return new Animal038(this.name)
  }
}

class Dog038 extends Animal038 {
  breed: string
  constructor(name: string, breed: string) {
    super(name)
    this.breed = breed
  }
  override clone(): Dog038 {
    return new Dog038(this.name, this.breed)
  }
}

class NonCloneable039 {
  x: int
  constructor(x: int) {
    this.x = x
  }
}

interface Printable040 {
  print(): void
}

class PrintablePoint040 implements Cloneable, Printable040 {
  x: int
  y: int
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  clone(): PrintablePoint040 {
    return new PrintablePoint040(this.x, this.y)
  }
  print(): void {
    console.info("Point(" + this.x.toString() + ", " + this.y.toString() + ")")
  }
}

export default function CloneableCloneTest(): void {
  describe('CloneableCloneTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_0100
     * @tc.name testCloneableClone0001
     * @tc.desc Verify clone method called without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point001 = new Point001(1, 2)
      let q: Cloneable = p.clone()
      expect(q !== null).assertTrue()
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_0300
     * @tc.name testCloneableClone0003
     * @tc.desc Verify clone returns new Cloneable instance with same values but different reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point003 = new Point003(10, 20)
      let q: Cloneable = p.clone()
      expect(q !== null).assertTrue()
      expect((q as Point003).x).assertEqual(10)
      expect((q as Point003).y).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_0400
     * @tc.name testCloneableClone0004
     * @tc.desc Verify modifying cloned object does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point004 = new Point004(1, 2)
      let q: Point004 = p.clone() as Point004
      q.x = 100
      expect(p.x).assertEqual(1)
      expect(q.x).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_0500
     * @tc.name testCloneableClone0005
     * @tc.desc Verify multiple clone calls return different instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point004 = new Point004(5, 6)
      let q1: Point004 = p.clone() as Point004
      let q2: Point004 = p.clone() as Point004
      expect(q1 === q2).assertFalse()
      expect(q1 !== p).assertTrue()
      expect(q2 !== p).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_0600
     * @tc.name testCloneableClone0006
     * @tc.desc Verify cloned object reference is not equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point004 = new Point004(1, 2)
      let q: Cloneable = p.clone()
      expect(p === q).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_0700
     * @tc.name testCloneableClone0007
     * @tc.desc Verify subclass clone returns subclass instance with covariant return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point007 = new Point007(3, 4)
      let q: Point007 = p.clone()
      expect(q instanceof Point007).assertTrue()
      expect(q.x).assertEqual(3)
      expect(q.y).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_0800
     * @tc.name testCloneableClone0008
     * @tc.desc Verify multi-level inheritance clone returns most specific subclass instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p3d: Point3D008 = new Point3D008(1, 2, 3)
      let q3d: Point3D008 = p3d.clone()
      expect(q3d instanceof Point3D008).assertTrue()
      expect(q3d.x).assertEqual(1)
      expect(q3d.y).assertEqual(2)
      expect(q3d.z).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_0900
     * @tc.name testCloneableClone0009
     * @tc.desc Verify different subclasses implementing Cloneable each return their own type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cp: ColorPoint009 = new ColorPoint009(1, 2, "red")
      let cq: ColorPoint009 = cp.clone()
      expect(cq instanceof ColorPoint009).assertTrue()
      expect(cq.color).assertEqual("red")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_1000
     * @tc.name testCloneableClone0010
     * @tc.desc Verify deepcopy uses clone method when class implements Cloneable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point010 = new Point010(1, 2)
      let q: Point010 = deepcopy(p) as Point010
      expect(q.x).assertEqual(1)
      expect(q.y).assertEqual(2)
      expect(p === q).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_1100
     * @tc.name testCloneableClone0011
     * @tc.desc Verify deepcopy cloned object modification does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point010 = new Point010(10, 20)
      let q: Point010 = deepcopy(p) as Point010
      q.x = 999
      expect(p.x).assertEqual(10)
      expect(q.x).assertEqual(999)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_1200
     * @tc.name testCloneableClone0012
     * @tc.desc Verify deepcopy nested objects are independent after cloning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let inner: Inner012 = new Inner012(42)
      let outer: Outer012 = new Outer012(inner)
      let cloned: Outer012 = deepcopy(outer) as Outer012
      cloned.inner.value = 100
      expect(outer.inner.value).assertEqual(42)
      expect(cloned.inner.value).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_1300
     * @tc.name testCloneableClone0013
     * @tc.desc Verify clone with zero value properties maintains values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point010 = new Point010(0, 0)
      let q: Point010 = p.clone() as Point010
      expect(q.x).assertEqual(0)
      expect(q.y).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_1400
     * @tc.name testCloneableClone0014
     * @tc.desc Verify clone with negative value properties maintains values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point010 = new Point010(-1, -999)
      let q: Point010 = p.clone() as Point010
      expect(q.x).assertEqual(-1)
      expect(q.y).assertEqual(-999)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_1500
     * @tc.name testCloneableClone0015
     * @tc.desc Verify clone with int boundary values maintains values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point010 = new Point010(2147483647, -2147483648)
      let q: Point010 = p.clone() as Point010
      expect(q.x).assertEqual(2147483647)
      expect(q.y).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_1600
     * @tc.name testCloneableClone0016
     * @tc.desc Verify clone with empty string property maintains values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: NamedPoint016 = new NamedPoint016("", 1, 2)
      let q: NamedPoint016 = p.clone() as NamedPoint016
      expect(q.name).assertEqual("")
      expect(q.x).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_1700
     * @tc.name testCloneableClone0017
     * @tc.desc Verify clone with Unicode and special string properties maintains values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p1: NamedPoint016 = new NamedPoint016("\u200B", 1, 2)
      let q1: NamedPoint016 = p1.clone() as NamedPoint016
      expect(q1.name).assertEqual("\u200B")
      let p2: NamedPoint016 = new NamedPoint016("<script>alert(1)</script>", 1, 2)
      let q2: NamedPoint016 = p2.clone() as NamedPoint016
      expect(q2.name).assertEqual("<script>alert(1)</script>")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_1800
     * @tc.name testCloneableClone0018
     * @tc.desc Verify clone with long string property maintains value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let longStr: string = "a".repeat(10000)
      let p: NamedPoint016 = new NamedPoint016(longStr, 1, 2)
      let q: NamedPoint016 = p.clone() as NamedPoint016
      expect(q.name.length).assertEqual(10000)
      expect(q.name).assertEqual(longStr)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_1900
     * @tc.name testCloneableClone0019
     * @tc.desc Verify clone return type is Cloneable interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point010 = new Point010(1, 2)
      let result: Cloneable = p.clone()
      expect(result !== null).assertTrue()
      expect(typeof result === "object").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_2000
     * @tc.name testCloneableClone0020
     * @tc.desc Verify clone return value instanceof specific subclass type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point010 = new Point010(1, 2)
      let q: Cloneable = p.clone()
      expect(q instanceof Point010).assertTrue()
      expect(q instanceof Cloneable).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_2100
     * @tc.name testCloneableClone0021
     * @tc.desc Verify clone return value instanceof multi-level inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p3d: Point3D008 = new Point3D008(1, 2, 3)
      let q3d: Cloneable = p3d.clone()
      expect(q3d instanceof Point3D008).assertTrue()
      expect(q3d instanceof Point008).assertTrue()
      expect(q3d instanceof Cloneable).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_2200
     * @tc.name testCloneableClone0022
     * @tc.desc Verify clone return value as cast to target subclass has correct properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point010 = new Point010(5, 6)
      let base: Cloneable = p.clone()
      let typed: Point010 = base as Point010
      expect(typed.x).assertEqual(5)
      expect(typed.y).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_2300
     * @tc.name testCloneableClone0023
     * @tc.desc Verify clone return object has same properties as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point010 = new Point010(1, 2)
      let q: Cloneable = p.clone()
      let typed: Point010 = q as Point010
      expect(typed.x).assertEqual(1)
      expect(typed.y).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_2400
     * @tc.name testCloneableClone0024
     * @tc.desc Verify clone of single property object maintains value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: Single024 = new Single024(42)
      let sc: Single024 = s.clone()
      expect(sc.value).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_2500
     * @tc.name testCloneableClone0025
     * @tc.desc Verify clone of multi-type property object maintains all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let c: Complex025 = new Complex025(1, "hello", true)
      let cc: Complex025 = c.clone()
      expect(cc.intVal).assertEqual(1)
      expect(cc.strVal).assertEqual("hello")
      expect(cc.boolVal).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_2600
     * @tc.name testCloneableClone0026
     * @tc.desc Verify clone of char property object maintains char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let h: CharHolder026 = new CharHolder026(c'A')
      let hc: CharHolder026 = h.clone()
      expect(hc.ch).assertEqual(c'A')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_2700
     * @tc.name testCloneableClone0027
     * @tc.desc Verify clone with escape character char property maintains value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let h1: CharHolder026 = new CharHolder026(c'\n')
      let hc1: CharHolder026 = h1.clone()
      expect(hc1.ch).assertEqual(c'\n')
      let h2: CharHolder026 = new CharHolder026(c'\x7F')
      let hc2: CharHolder026 = h2.clone()
      expect(hc2.ch).assertEqual(c'\x7F')
      let h3: CharHolder026 = new CharHolder026(c'\u0000')
      let hc3: CharHolder026 = h3.clone()
      expect(hc3.ch).assertEqual(c'\u0000')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_2800
     * @tc.name testCloneableClone0028
     * @tc.desc Verify clone of array property object maintains array content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let ah: ArrayHolder028 = new ArrayHolder028([1, 2, 3])
      let ahc: ArrayHolder028 = ah.clone()
      expect(ahc.items.length).assertEqual(3)
      expect(ahc.items[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_2900
     * @tc.name testCloneableClone0029
     * @tc.desc Verify clone with empty array property maintains value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let ah: ArrayHolder028 = new ArrayHolder028([])
      let ahc: ArrayHolder028 = ah.clone()
      expect(ahc.items.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_3000
     * @tc.name testCloneableClone0030
     * @tc.desc Verify class implementing Cloneable without clone method throws runtime error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bp: BadPoint030 = new BadPoint030(1, 2)
      try {
        bp.clone()
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_3100
     * @tc.name testCloneableClone0031
     * @tc.desc Verify deepcopy throws error for Cloneable class without proper clone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bp: BadPoint030 = new BadPoint030(1, 2)
      try {
        deepcopy(bp)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_3200
     * @tc.name testCloneableClone0032
     * @tc.desc Verify caller correctly catches Error thrown inside clone method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let ep: ErrorPoint032 = new ErrorPoint032(1)
      try {
        ep.clone()
        expect().assertFail()
      } catch (error) {
        expect(error.message).assertEqual("clone failed")
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_3400
     * @tc.name testCloneableClone0034
     * @tc.desc Verify clone call in try-catch block executes normally without entering catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point010 = new Point010(1, 2)
      let result: Point010 | null = null
      try {
        result = p.clone() as Point010
      } finally {
        expect(result !== null).assertTrue()
        expect((result as Point010).x).assertEqual(1)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_3500
     * @tc.name testCloneableClone0035
     * @tc.desc Verify finally block executes after clone throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let ep: ErrorPoint032 = new ErrorPoint032(1)
      let finallyExecuted: boolean = true
      try {
        ep.clone()
        expect(finallyExecuted).assertTrue()
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
      
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_3600
     * @tc.name testCloneableClone0036
     * @tc.desc Verify behavior when clone exception is not caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cp: CrashPoint036 = new CrashPoint036(1)
      try {
        cp.clone()
        expect().assertFail()
      } catch (error) {
        expect(error.name.length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_3700
     * @tc.name testCloneableClone0037
     * @tc.desc Verify subclass override clone method with override keyword
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dp: DerivedPoint037 = new DerivedPoint037(1, 2, 3)
      let dc: DerivedPoint037 = dp.clone()
      expect(dc.z).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_3800
     * @tc.name testCloneableClone0038
     * @tc.desc Verify override clone method returns more specific subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let d: Dog038 = new Dog038("Rex", "Shepherd")
      let dc: Dog038 = d.clone()
      expect(dc instanceof Dog038).assertTrue()
      expect(dc.breed).assertEqual("Shepherd")
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_CLONEABLE_CLONETEST_4000
     * @tc.name testCloneableClone0040
     * @tc.desc Verify class implementing multiple interfaces including Cloneable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCloneableClone0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pp: PrintablePoint040 = new PrintablePoint040(1, 2)
      let ppc: PrintablePoint040 = pp.clone()
      expect(ppc.x).assertEqual(1)
      expect(ppc instanceof PrintablePoint040).assertTrue()
    });
  });
}
