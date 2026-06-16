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

class Item028 {
  name: string = ""
  constructor() {}
}

class Pair033 {
  key: string = ""
  constructor() {}
}

class Key036 {
  id: int = 0
  constructor() {}
}

class Val036 {
  name: string = ""
  constructor() {}
}

class Calc044 {
  add(a: int, b: int): int { return a + b }
}

enum Color045 {
  Red,
  Green,
  Blue
}

enum Direction046 {
  North,
  South,
  East,
  West
}

enum Status047 {
  Active = "active",
  Inactive = "inactive"
}

class Part048 {
  label: string = ""
  constructor() {}
}

class Part049 {
  label: string = ""
  constructor() {}
}

class Container049 {
  part: Part049 = new Part049()
  constructor() {}
}

class Level3_050 {
  val: string = ""
  constructor() {}
}

class Level2_050 {
  child: Level3_050 = new Level3_050()
  constructor() {}
}

class Level1_050 {
  child: Level2_050 = new Level2_050()
  constructor() {}
}

class Nullable051 {
  a: string | null = null
  b: string | undefined = undefined
  constructor() {}
}

class Mixed052 {
  num: int = 0
  str: string = ""
  flag: boolean = false
  arr: number[] = []
  constructor() {}
}

class Item053 {
  val: int = 0
  constructor() {}
}

class Base054 implements Cloneable {
  x: int = 0
  constructor() {}
  clone(): Base054 {
    let b: Base054 = new Base054()
    b.x = this.x
    return b
  }
}

class MyClass057 {
  name: string = ""
  constructor() {}
}

class L3_061 {
  val: string = ""
  constructor() {}
}

class L2_061 {
  child: L3_061 = new L3_061()
  constructor() {}
}

class L1_061 {
  child: L2_061 = new L2_061()
  constructor() {}
}

class L3_062 {
  val: string = ""
  constructor() {}
}

class L2_062 {
  child: L3_062 = new L3_062()
  constructor() {}
}

class L1_062 {
  child: L2_062 = new L2_062()
  constructor() {}
}

class Tag063 {
  val: string = ""
  constructor() {}
}

class Node063 {
  id: int = 0
  tag: Tag063 | undefined = undefined
  constructor() {}
}

class Tag064 {
  val: string = ""
  constructor() {}
}

class Node064 {
  id: int = 0
  tag: Tag064 | undefined = undefined
  constructor() {}
}

class L4_065 {
  val: string = ""
  constructor() {}
}

class L3_065 {
  child: L4_065 = new L4_065()
  constructor() {}
}

class L2_065 {
  child: L3_065 = new L3_065()
  constructor() {}
}

class L1_065 {
  child: L2_065 = new L2_065()
  constructor() {}
}

class Simple066 {
  val: int = 0
  constructor() {}
}

class Item067 {
  val: string = ""
  constructor() {}
}

class Val068 {
  name: string = ""
  constructor() {}
}

class Elem069 {
  id: int = 0
  constructor() {}
}

class Node070 {
  val: int = 0
  next: Node070 | null = null
  constructor() {}
}

class NodeA071 {
  b: NodeB071 | null = null
  constructor() {}
}

class NodeB071 {
  a: NodeA071 | null = null
  constructor() {}
}

class ListNode072 {
  val: int = 0
  next: ListNode072 | null = null
  constructor() {}
}

class Holder073 {
  arr: Object[] = []
  constructor() {}
}

class Wrapper074 {
  map: Map<string, Object> = new Map<string, Object>()
  constructor() {}
}

class Complex075 {
  name: string = ""
  items: number[] = []
  tags: Set<string> = new Set<string>()
  meta: Map<string, string> = new Map<string, string>()
  created: Date = new Date()
  handler: Function = (): void => {}
  constructor() {}
}

class Inner076 {
  arr: string[] = []
  constructor() {}
}

class Middle076 {
  inner: Inner076 = new Inner076()
  map: Map<string, number> = new Map<string, number>()
  constructor() {}
}

class Outer076 {
  middle: Middle076 = new Middle076()
  date: Date = new Date()
  constructor() {}
}

class Data077 {
  value: int = 0
  constructor() {}
}

class Part078 {
  label: string = ""
  constructor() {}
}

class Container078 {
  part: Part078 = new Part078()
  constructor() {}
}

class Item079 {
  val: int = 0
  constructor() {}
}

enum Color086 {
  Red,
  Green,
  Blue
}

class Empty087 {
  val: int = 0
  constructor() {}
}

class Typed091 {
  val: string = ""
  constructor() {}
}

class Animal095 {
  name: string = ""
  constructor() {}
}

class Dog095 extends Animal095 {
  breed: string = ""
  constructor() { super() }
}

class Large096 {
  f1: int = 1
  f2: int = 2
  f3: int = 3
  f4: int = 4
  f5: int = 5
  f6: string = "6"
  f7: string = "7"
  f8: string = "8"
  constructor() {}
}

class Deep097 {
  child: Deep097 | null = null
  val: int = 0
  constructor() {}
}

class Node098 {
  val: int = 0
  next: Node098 | null = null
  constructor() {}
}

class BadClone101 implements Cloneable {
  x: int = 0
  constructor() {}
  clone(): Cloneable {
    throw new Error("Clone not implemented")
  }
}

class Base102 implements Cloneable {
  x: int = 0
  constructor() {}
  clone(): Base102 {
    let b: Base102 = new Base102()
    b.x = this.x
    return b
  }
}

class Child102 extends Base102 {
  y: int = 0
  constructor() { super() }
}

class NoDefault103 {
  val: int
  constructor(val: int) {
    this.val = val
  }
}

class WithParams104 {
  name: string
  age: int
  constructor(name: string, age: int) {
    this.name = name
    this.age = age
  }
}

class NoDefault105 {
  val: int
  constructor(val: int) {
    this.val = val
  }
}

class BadClone106 implements Cloneable {
  x: int = 0
  constructor() {}
  clone(): Cloneable {
    throw new Error("Clone not implemented")
  }
}

class NoDefault107 {
  val: int
  constructor(val: int) {
    this.val = val
  }
}

class Normal107 {
  val: int = 0
  constructor() {}
}

class BadInner108 {
  val: int
  constructor(val: int) {
    this.val = val
  }
}

class Outer108 {
  inner: BadInner108 | null = null
  constructor() {}
}

class Item112 {
  val: string = ""
  constructor() {}
}

class Rec116 {
  val: int = 0
  constructor() {}
}

class KeyObj118 {
  id: int = 0
  constructor() {}
}

class Nested119 {
  inner: string = ""
  constructor() {}
}

class K120 {
  id: int = 0
  constructor() {}
}

class V120 {
  name: string = ""
  constructor() {}
}

class Item123 {
  val: int = 0
  constructor() {}
}

class Item124 {
  val: int = 0
  constructor() {}
}

class Parent125 {
  parentVal: string = ""
  constructor() {}
}

class ChildClass125 extends Parent125 {
  childVal: int = 0
  constructor() { super() }
}

class A126 {
  a: int = 0
  constructor() {}
}

class B126 extends A126 {
  b: int = 0
  constructor() { super() }
}

class C126 extends B126 {
  c: int = 0
  constructor() { super() }
}

class Holder127 {
  arr: number[] = []
  set: Set<string> = new Set<string>()
  map: Map<string, string> = new Map<string, string>()
  constructor() {}
}

class GoodClone128 implements Cloneable {
  x: int = 0
  y: int = 0
  constructor() {}
  clone(): GoodClone128 {
    let c: GoodClone128 = new GoodClone128()
    c.x = this.x
    c.y = this.y
    return c
  }
}

class ClonableObj129 implements Cloneable {
  val: string = ""
  constructor() {}
  clone(): ClonableObj129 {
    let c: ClonableObj129 = new ClonableObj129()
    c.val = this.val
    return c
  }
}

class Inner130 {
  val: string = ""
  constructor() {}
}

class Outer130 {
  inner: Inner130 = new Inner130()
  ownVal: int = 0
  constructor() {}
}

class L2_131 {
  val: string = ""
  constructor() {}
}

class L1_131 {
  child: L2_131 = new L2_131()
  constructor() {}
}

class Item132 {
  name: string = ""
  constructor() {}
}

class Elem133 {
  v: int = 0
  constructor() {}
}

export default function DeepcopyTest(): void {
  describe('DeepcopyTest', (): void => {
    beforeAll((): void => {})
    beforeEach(async (): Promise<void> => { await Utils.msSleep(30) })
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_0100
     * @tc.name testDeepcopy0001
     * @tc.desc Verify deepcopy with only src parameter using default depth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Item028 = new Item028()
      obj.name = "x"
      let result = deepcopy(obj)
      expect(result != null).assertTrue()
      expect(result === obj).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_0200
     * @tc.name testDeepcopy0002
     * @tc.desc Verify deepcopy with src and depth parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Item028 = new Item028()
      let result = deepcopy(obj, 2)
      expect(result != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_0300
     * @tc.name testDeepcopy0003
     * @tc.desc Verify deepcopy with valid argument returns non-null result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item: Item028 = new Item028()
      let result = deepcopy(item)
      expect(result != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_0400
     * @tc.name testDeepcopy0004
     * @tc.desc Verify deepcopy with extra parameters beyond src and depth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item: Item028 = new Item028()
      let result = deepcopy(item, -1)
      expect(result != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_0500
     * @tc.name testDeepcopy0005
     * @tc.desc Verify deepcopy returns null when src is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = deepcopy<Object>(null)
      expect(result).assertNull()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_0600
     * @tc.name testDeepcopy0006
     * @tc.desc Verify deepcopy returns undefined when src is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = deepcopy<Object>(undefined)
      expect(result).assertUndefined()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_0700
     * @tc.name testDeepcopy0007
     * @tc.desc Verify deepcopy of string returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello"
      let result = deepcopy(s)
      expect(result).assertEqual("hello")
      expect(result === s).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_0800
     * @tc.name testDeepcopy0008
     * @tc.desc Verify deepcopy of empty string returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = ""
      let result = deepcopy(s)
      expect(result).assertEqual("")
      expect(result === s).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_0900
     * @tc.name testDeepcopy0009
     * @tc.desc Verify deepcopy of Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "\u4e2d\u6587\uD83D\uDE00"
      let result = deepcopy(s)
      expect(result).assertEqual(s)
      expect(result === s).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_1000
     * @tc.name testDeepcopy0010
     * @tc.desc Verify deepcopy of special character strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = "<script>alert(1)</script>"
      let s2: string = "\u200B"
      let s3: string = "\t\n\r"
      let r1 = deepcopy(s1)
      let r2 = deepcopy(s2)
      let r3 = deepcopy(s3)
      expect(r1 === s1).assertTrue()
      expect(r2 === s2).assertTrue()
      expect(r3 === s3).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_1100
     * @tc.name testDeepcopy0011
     * @tc.desc Verify deepcopy of multilingual strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strings: string[] = [
        "\u30C6\u30B9\u30C8",
        "\uD14C\uC2A4\uD2B8",
        "\u0410\u0411\u0412\u0413\u0414",
        "\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631"
      ]
      strings.forEach((s: string): void => {
        let result = deepcopy(s)
        expect(result === s).assertTrue()
      })
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_1200
     * @tc.name testDeepcopy0012
     * @tc.desc Verify deepcopy of very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a".repeat(10000)
      let result = deepcopy(s)
      expect(result).assertEqual(s)
      expect(result === s).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_1300
     * @tc.name testDeepcopy0013
     * @tc.desc Verify deepcopy of Boolean wrapper creates new instance via valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Boolean = new Boolean(true)
      let result = deepcopy(b)
      expect(result!.valueOf()).assertTrue()
      expect(result != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_1400
     * @tc.name testDeepcopy0014
     * @tc.desc Verify deepcopy of Byte wrapper creates new instance via valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Byte = new Byte(Int.toByte(127))
      let result = deepcopy(b)
      expect(result!.toByte()).assertEqual(Int.toByte(127))
      expect(result != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_1500
     * @tc.name testDeepcopy0015
     * @tc.desc Verify deepcopy of Char wrapper creates new instance via valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ch: Char = new Char(c'A')
      let result = deepcopy(ch)
      expect(result!.toChar()).assertEqual(c'A')
      expect(result != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_1600
     * @tc.name testDeepcopy0016
     * @tc.desc Verify deepcopy of Char with escape sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ch1: Char = new Char(c'\n')
      let ch2: Char = new Char(c'\t')
      let ch3: Char = new Char(c'\x7F')
      let ch4: Char = new Char(c'\u0000')
      let r1 = deepcopy(ch1)
      let r2 = deepcopy(ch2)
      let r3 = deepcopy(ch3)
      let r4 = deepcopy(ch4)
      expect(r1!.toChar()).assertEqual(c'\n')
      expect(r2!.toChar()).assertEqual(c'\t')
      expect(r3!.toChar()).assertEqual(c'\x7F')
      expect(r4!.toChar()).assertEqual(c'\u0000')
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_1700
     * @tc.name testDeepcopy0017
     * @tc.desc Verify deepcopy of Short wrapper creates new instance via valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Short = new Short(Int.toShort(32767))
      let result = deepcopy(s)
      expect(result!.toShort()).assertEqual(Int.toShort(32767))
      expect(result != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_1800
     * @tc.name testDeepcopy0018
     * @tc.desc Verify deepcopy of Int wrapper creates new instance via valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: Int = new Int(2147483647)
      let result = deepcopy(i)
      expect(result!.toInt()).assertEqual(2147483647)
      expect(result != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_1900
     * @tc.name testDeepcopy0019
     * @tc.desc Verify deepcopy of Long wrapper creates new instance via valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(Long.MAX_VALUE)
      let result = deepcopy(l)
      expect(result!.toLong()).assertEqual(Long.MAX_VALUE)
      expect(result != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_2000
     * @tc.name testDeepcopy0020
     * @tc.desc Verify deepcopy of Float wrapper creates new instance via valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(Double.toFloat(3.14))
      let result = deepcopy(f)
      expect(result!.toFloat()).assertEqual(Double.toFloat(3.14))
      expect(result != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_2100
     * @tc.name testDeepcopy0021
     * @tc.desc Verify deepcopy of Float with special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nan: Float = new Float(Float.NaN)
      let inf: Float = new Float(Float.POSITIVE_INFINITY)
      let negInf: Float = new Float(Float.NEGATIVE_INFINITY)
      let zero: Float = new Float(0.0)
      let negZero: Float = new Float(-0.0)
      let r1 = deepcopy(nan)
      let r2 = deepcopy(inf)
      let r3 = deepcopy(negInf)
      let r4 = deepcopy(zero)
      let r5 = deepcopy(negZero)
      expect(r1 != null).assertTrue()
      expect(r2 != null).assertTrue()
      expect(r3 != null).assertTrue()
      expect(r4 != null).assertTrue()
      expect(r5 != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_2200
     * @tc.name testDeepcopy0022
     * @tc.desc Verify deepcopy of Double wrapper creates new instance via valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(123.456)
      let result = deepcopy(d)
      expect(result!.toDouble()).assertEqual(123.456)
      expect(result != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_2300
     * @tc.name testDeepcopy0023
     * @tc.desc Verify deepcopy of Double with special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nan: Double = new Double(Double.NaN)
      let max: Double = new Double(Double.MAX_VALUE)
      let min: Double = new Double(Double.MIN_VALUE)
      let r1 = deepcopy(nan)
      let r2 = deepcopy(max)
      let r3 = deepcopy(min)
      expect(r1 != null).assertTrue()
      expect(r2 != null).assertTrue()
      expect(r3 != null).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_2400
     * @tc.name testDeepcopy0024
     * @tc.desc Verify deepcopy of Array creates new container with recursive element copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3]
      let result = deepcopy(arr)
      expect(result!.join(",")).assertEqual("1,2,3")
      expect(result === arr).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_2500
     * @tc.name testDeepcopy0025
     * @tc.desc Verify deepcopy of empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = []
      let result = deepcopy(arr)
      expect(result!.length).assertEqual(0)
      expect(result === arr).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_2600
     * @tc.name testDeepcopy0026
     * @tc.desc Verify deepcopy of single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["only"]
      let result = deepcopy(arr)
      expect(result!.length).assertEqual(1)
      expect(result![0]).assertEqual("only")
      expect(result === arr).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_2700
     * @tc.name testDeepcopy0027
     * @tc.desc Verify deepcopy of multi-dimensional nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[][] = [[1, 2], [3, 4]]
      let result = deepcopy(arr)
      expect(result![0].join(",")).assertEqual("1,2")
      expect(result![1].join(",")).assertEqual("3,4")
      expect(result === arr).assertFalse()
      expect(result![0] === arr[0]).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_2800
     * @tc.name testDeepcopy0028
     * @tc.desc Verify deepcopy of array containing objects with recursive copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Item028[] = [new Item028()]
      arr[0].name = "test"
      let result = deepcopy(arr)
      expect(result![0].name).assertEqual("test")
      expect(result![0] === arr[0]).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_2900
     * @tc.name testDeepcopy0029
     * @tc.desc Verify deepcopy of array with null and undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: (string | null | undefined)[] = ["a", null, undefined, "b"]
      let result = deepcopy(arr)
      expect(result!.length).assertEqual(4)
      expect(result![0]).assertEqual("a")
      expect(result![1]).assertNull()
      expect(result![2]).assertUndefined()
      expect(result![3]).assertEqual("b")
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_3000
     * @tc.name testDeepcopy0030
     * @tc.desc Verify deepcopy of large array with 10000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = []
      for (let i = 0; i < 10000; i++) {
        arr.push(i)
      }
      let result = deepcopy(arr)
      expect(result!.length).assertEqual(10000)
      expect(result![0]).assertEqual(0)
      expect(result![9999]).assertEqual(9999)
      expect(result === arr).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_3100
     * @tc.name testDeepcopy0031
     * @tc.desc Verify deepcopy of Set creates new container with recursive element copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<number> = new Set<number>([1, 2, 3])
      let result = deepcopy(set)
      expect(result!.size).assertEqual(3)
      expect(result!.has(1)).assertTrue()
      expect(result!.has(2)).assertTrue()
      expect(result!.has(3)).assertTrue()
      expect(result === set).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_3200
     * @tc.name testDeepcopy0032
     * @tc.desc Verify deepcopy of empty Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<number> = new Set<number>()
      let result = deepcopy(set)
      expect(result!.size).assertEqual(0)
      expect(result === set).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_3300
     * @tc.name testDeepcopy0033
     * @tc.desc Verify deepcopy of Set containing objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Pair033 = new Pair033()
      p.key = "k1"
      let set: Set<Pair033> = new Set<Pair033>([p])
      let result = deepcopy(set)
      let arr = Array.from(result!)
      expect(arr[0].key).assertEqual("k1")
      expect(arr[0] === p).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_3400
     * @tc.name testDeepcopy0034
     * @tc.desc Verify deepcopy of Map creates new container with recursive key and value copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, number> = new Map<string, number>()
      map.set("a", 1)
      map.set("b", 2)
      let result = deepcopy(map)
      expect(result!.get("a")).assertEqual(1)
      expect(result!.get("b")).assertEqual(2)
      expect(result === map).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_3500
     * @tc.name testDeepcopy0035
     * @tc.desc Verify deepcopy of empty Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, number> = new Map<string, number>()
      let result = deepcopy(map)
      expect(result!.size).assertEqual(0)
      expect(result === map).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_3600
     * @tc.name testDeepcopy0036
     * @tc.desc Verify deepcopy of Map with object keys and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k: Key036 = new Key036()
      k.id = 1
      let v: Val036 = new Val036()
      v.name = "test"
      let map: Map<Key036, Val036> = new Map<Key036, Val036>()
      map.set(k, v)
      let result = deepcopy(map)
      let entries = Array.from(result!.entries())
      expect(entries[0][0].id).assertEqual(1)
      expect(entries[0][1].name).assertEqual("test")
      expect(entries[0][0] === k).assertFalse()
      expect(entries[0][1] === v).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_3700
     * @tc.name testDeepcopy0037
     * @tc.desc Verify deepcopy of Map with null and undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, string | null | undefined> = new Map<string, string | null | undefined>()
      map.set("a", null)
      map.set("b", undefined)
      map.set("c", "val")
      let result = deepcopy(map)
      expect(result!.get("a")).assertNull()
      expect(result!.get("b")).assertUndefined()
      expect(result!.get("c")).assertEqual("val")
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_3800
     * @tc.name testDeepcopy0038
     * @tc.desc Verify deepcopy of Date creates new instance via copy constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date: Date = new Date(2026, 0, 1)
      let result = deepcopy(date)
      expect(result!.getTime()).assertEqual(date.getTime())
      expect(result === date).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_3900
     * @tc.name testDeepcopy0039
     * @tc.desc Verify deepcopy of Date with epoch timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date: Date = new Date(0)
      let result = deepcopy(date)
      expect(result!.getTime()).assertEqual(0)
      expect(result === date).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_4000
     * @tc.name testDeepcopy0040
     * @tc.desc Verify deepcopy of current Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date: Date = new Date()
      let result = deepcopy(date)
      expect(result!.getTime()).assertEqual(date.getTime())
      expect(result === date).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_4100
     * @tc.name testDeepcopy0041
     * @tc.desc Verify deepcopy of Date with max timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date: Date = new Date(8640000000000000)
      let result = deepcopy(date)
      expect(result!.getTime()).assertEqual(date.getTime())
      expect(result === date).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_4200
     * @tc.name testDeepcopy0042
     * @tc.desc Verify deepcopy of Function returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: () => string = (): string => "hello"
      let result: () => string = deepcopy(fn) as () => string
      expect(result === fn).assertTrue()
      expect(result()).assertEqual("hello")
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_4300
     * @tc.name testDeepcopy0043
     * @tc.desc Verify deepcopy of arrow function returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let add: (a: int, b: int) => int = (a: int, b: int): int => a + b
      let result: (a: int, b: int) => int = deepcopy(add) as (a: int, b: int) => int
      expect(result === add).assertTrue()
      expect(result(1, 2)).assertEqual(3)
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_4400
     * @tc.name testDeepcopy0044
     * @tc.desc Verify deepcopy of class method returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc = new Calc044()
      let fn = calc.add
      let result = deepcopy(fn)
      expect(result === fn).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_4500
     * @tc.name testDeepcopy0045
     * @tc.desc Verify deepcopy of enum returns same enum reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = deepcopy(Color045.Red)
      expect(result).assertEqual(Color045.Red)
      expect(result === Color045.Red).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_4600
     * @tc.name testDeepcopy0046
     * @tc.desc Verify deepcopy of all enum values return same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Direction046[] = [Direction046.North, Direction046.South, Direction046.East, Direction046.West]
      for (let i = 0; i < values.length; i++) {
        let result = deepcopy(values[i])
        expect(result === values[i]).assertTrue()
      }
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_4700
     * @tc.name testDeepcopy0047
     * @tc.desc Verify deepcopy of string enum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = deepcopy(Status047.Active)
      expect(result).assertEqual(Status047.Active)
      expect(result === Status047.Active).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_4800
     * @tc.name testDeepcopy0048
     * @tc.desc Verify deepcopy of plain object with default constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Part048 = new Part048()
      p.label = "a"
      let result = deepcopy(p)
      expect(result!.label).assertEqual("a")
      expect(result === p).assertFalse()
      p.label = "b"
      expect(result!.label).assertEqual("a")
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_4900
     * @tc.name testDeepcopy0049
     * @tc.desc Verify deepcopy of nested objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Container049 = new Container049()
      c.part.label = "a"
      let cCopy: Container049 = deepcopy(c) as Container049
      c.part.label = "b"
      expect(c.part.label).assertEqual("b")
      expect(cCopy.part.label).assertEqual("a")
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_5000
     * @tc.name testDeepcopy0050
     * @tc.desc Verify deepcopy of deeply nested objects with 3 or more levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Level1_050 = new Level1_050()
      obj.child.child.val = "deep"
      let result = deepcopy(obj)
      expect(result!.child.child.val).assertEqual("deep")
      expect(result!.child.child === obj.child.child).assertFalse()
      expect(result!.child === obj.child).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_5100
     * @tc.name testDeepcopy0051
     * @tc.desc Verify deepcopy of object with null and undefined properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Nullable051 = new Nullable051()
      let nullResult = deepcopy<string | null>(obj.a)
      let undefinedResult = deepcopy<string | undefined>(obj.b)
      expect(nullResult).assertNull()
      expect(undefinedResult).assertUndefined()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_5200
     * @tc.name testDeepcopy0052
     * @tc.desc Verify deepcopy of object with mixed type properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Mixed052 = new Mixed052()
      m.num = 42
      m.str = "test"
      m.flag = true
      m.arr = [1, 2, 3]
      let result = deepcopy(m)
      expect(result!.num).assertEqual(42)
      expect(result!.str).assertEqual("test")
      expect(result!.flag).assertTrue()
      expect(result!.arr.join(",")).assertEqual("1,2,3")
      expect(result!.arr === m.arr).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_5300
     * @tc.name testDeepcopy0053
     * @tc.desc Verify deepcopy of FixedArray with recursive element copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<Item053> = [new Item053(), new Item053(), new Item053()]
      fa[0].val = 10
      let result = deepcopy(fa)
      expect(result![0].val).assertEqual(10)
      expect(result === fa).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_5400
     * @tc.name testDeepcopy0054
     * @tc.desc Verify deepcopy calls clone() for Cloneable implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Base054 = new Base054()
      b.x = 42
      let result = deepcopy(b)
      expect(result!.x).assertEqual(42)
      expect(result === b).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_5500
     * @tc.name testDeepcopy0055
     * @tc.desc Verify deepcopy with generic type number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = deepcopy<number>(42)
      expect(result).assertEqual(42)
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_5600
     * @tc.name testDeepcopy0056
     * @tc.desc Verify deepcopy with generic type string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = deepcopy<string>("hello")
      expect(result).assertEqual("hello")
      expect(result === "hello").assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_5700
     * @tc.name testDeepcopy0057
     * @tc.desc Verify deepcopy with generic custom object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MyClass057 = new MyClass057()
      obj.name = "test"
      let result = deepcopy<MyClass057>(obj)
      expect(result!.name).assertEqual("test")
      expect(result === obj).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_5800
     * @tc.name testDeepcopy0058
     * @tc.desc Verify deepcopy with generic array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3]
      let result = deepcopy<number[]>(arr)
      expect(result!.join(",")).assertEqual("1,2,3")
      expect(result === arr).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_5900
     * @tc.name testDeepcopy0059
     * @tc.desc Verify deepcopy with generic Map type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, number> = new Map<string, number>()
      map.set("key", 100)
      let result = deepcopy<Map<string, number>>(map)
      expect(result!.get("key")).assertEqual(100)
      expect(result === map).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_6000
     * @tc.name testDeepcopy0060
     * @tc.desc Verify deepcopy with generic Set type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<string> = new Set<string>(["a", "b"])
      let result = deepcopy<Set<string>>(set)
      expect(result!.has("a")).assertTrue()
      expect(result!.has("b")).assertTrue()
      expect(result === set).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_6100
     * @tc.name testDeepcopy0061
     * @tc.desc Verify deepcopy with default depth -1 for unlimited depth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: L1_061 = new L1_061()
      obj.child.child.val = "deep"
      let result = deepcopy(obj)
      expect(result!.child.child.val).assertEqual("deep")
      expect(result!.child.child === obj.child.child).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_6200
     * @tc.name testDeepcopy0062
     * @tc.desc Verify deepcopy with depth -1 copies all nested structures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: L1_062 = new L1_062()
      obj.child.child.val = "deep"
      let result = deepcopy(obj, -1)
      expect(result!.child.child.val).assertEqual("deep")
      expect(result!.child.child === obj.child.child).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_6300
     * @tc.name testDeepcopy0063
     * @tc.desc Verify deepcopy with depth 0 only copies root object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Node063 = new Node063()
      n.id = 1
      let tag: Tag063 = new Tag063()
      tag.val = "x"
      n.tag = tag
      let same: Node063 = deepcopy<Node063>(n, 0) as Node063
      expect(same.id).assertEqual(1)
      expect(same.tag!.val).assertEqual("x")
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_6400
     * @tc.name testDeepcopy0064
     * @tc.desc Verify deepcopy with depth 1 limits copy to one level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Node064 = new Node064()
      n.id = 1
      let tag: Tag064 = new Tag064()
      tag.val = "x"
      n.tag = tag
      let shallow: Node064 = deepcopy<Node064>(n, 1) as Node064
      expect(shallow.id).assertEqual(1)
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_6500
     * @tc.name testDeepcopy0065
     * @tc.desc Verify deepcopy with depth 5 limits copy depth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: L1_065 = new L1_065()
      obj.child.child.child.val = "deep"
      let result = deepcopy(obj, 5)
      expect(result != null).assertTrue()
      expect(result === obj).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_6600
     * @tc.name testDeepcopy0066
     * @tc.desc Verify deepcopy with Int.MAX_VALUE as depth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Simple066 = new Simple066()
      obj.val = 1
      let result = deepcopy(obj, 2147483647)
      expect(result!.val).assertEqual(1)
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_6700
     * @tc.name testDeepcopy0067
     * @tc.desc Verify depth limit effect on nested objects in Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Item067[] = [new Item067()]
      arr[0].val = "test"
      let result = deepcopy(arr, 0)
      expect(result!.length).assertEqual(1)
      expect(result![0].val).assertEqual("test")
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_6800
     * @tc.name testDeepcopy0068
     * @tc.desc Verify depth limit effect on nested values in Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, Val068> = new Map<string, Val068>()
      let v: Val068 = new Val068()
      v.name = "inner"
      map.set("key", v)
      let result = deepcopy(map, 0)
      let copiedValue = result!.get("key")
      expect(copiedValue!.name).assertEqual("inner")
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_6900
     * @tc.name testDeepcopy0069
     * @tc.desc Verify depth limit effect on nested elements in Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<Elem069> = new Set<Elem069>()
      let e: Elem069 = new Elem069()
      e.id = 1
      set.add(e)
      let result = deepcopy(set, 0)
      let copiedItems = Array.from(result!)
      expect(copiedItems.length).assertEqual(1)
      expect(copiedItems[0].id).assertEqual(1)
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_7000
     * @tc.name testDeepcopy0070
     * @tc.desc Verify deepcopy handles self-referencing objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Node070 = new Node070()
      n.val = 1
      n.next = n
      let result = deepcopy(n)
      expect(result!.val).assertEqual(1)
      expect(result!.next === result).assertTrue()
      expect(result === n).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_7100
     * @tc.name testDeepcopy0071
     * @tc.desc Verify deepcopy handles bidirectional references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: NodeA071 = new NodeA071()
      let b: NodeB071 = new NodeB071()
      a.b = b
      b.a = a
      let copyA = deepcopy(a)
      expect(copyA!.b!.a === copyA).assertTrue()
      expect(copyA === a).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_7200
     * @tc.name testDeepcopy0072
     * @tc.desc Verify deepcopy handles multi-node circular references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n1: ListNode072 = new ListNode072()
      let n2: ListNode072 = new ListNode072()
      let n3: ListNode072 = new ListNode072()
      n1.val = 1; n1.next = n2
      n2.val = 2; n2.next = n3
      n3.val = 3; n3.next = n1
      let result = deepcopy(n1)
      expect(result!.val).assertEqual(1)
      expect(result!.next!.val).assertEqual(2)
      expect(result!.next!.next!.val).assertEqual(3)
      expect(result!.next!.next!.next === result).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_7300
     * @tc.name testDeepcopy0073
     * @tc.desc Verify deepcopy handles circular references in Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let h: Holder073 = new Holder073()
      h.arr.push(h)
      let result = deepcopy(h)
      expect(result!.arr[0] === result).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_7400
     * @tc.name testDeepcopy0074
     * @tc.desc Verify deepcopy handles circular references in Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let w: Wrapper074 = new Wrapper074()
      w.map.set("self", w)
      let result = deepcopy(w)
      expect(result!.map.get("self") === result).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_7500
     * @tc.name testDeepcopy0075
     * @tc.desc Verify deepcopy of complex object with mixed type properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Complex075 = new Complex075()
      c.name = "test"
      c.items = [1, 2, 3]
      c.tags = new Set<string>(["a", "b"])
      c.meta.set("key", "val")
      let result = deepcopy(c)
      expect(result!.name).assertEqual("test")
      expect(result!.items.join(",")).assertEqual("1,2,3")
      expect(result!.items === c.items).assertFalse()
      expect(result!.tags === c.tags).assertFalse()
      expect(result!.meta === c.meta).assertFalse()
      expect(result!.created === c.created).assertFalse()
      expect(result!.handler === c.handler).assertTrue()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_7600
     * @tc.name testDeepcopy0076
     * @tc.desc Verify deepcopy of deeply nested mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: Outer076 = new Outer076()
      o.middle.inner.arr = ["a", "b"]
      o.middle.map.set("k", 1)
      let result = deepcopy(o)
      expect(result!.middle.inner.arr.join(",")).assertEqual("a,b")
      expect(result!.middle.inner.arr === o.middle.inner.arr).assertFalse()
      expect(result!.middle.map === o.middle.map).assertFalse()
      expect(result!.date === o.date).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_7700
     * @tc.name testDeepcopy0077
     * @tc.desc Verify deepcopy returns equal content but different reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Data077 = new Data077()
      d.value = 100
      let result = deepcopy(d)
      expect(result!.value).assertEqual(100)
      expect(result === d).assertFalse()
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_7800
     * @tc.name testDeepcopy0078
     * @tc.desc Verify modifying source does not affect deepcopy result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Container078 = new Container078()
      c.part.label = "original"
      let copy: Container078 = deepcopy(c) as Container078
      c.part.label = "modified"
      expect(c.part.label).assertEqual("modified")
      expect(copy.part.label).assertEqual("original")
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_7900
     * @tc.name testDeepcopy0079
     * @tc.desc Verify array elements are independent after deepcopy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Item079[] = [new Item079()]
      arr[0].val = 10
      let copy = deepcopy(arr)
      arr[0].val = 20
      expect(copy![0].val).assertEqual(10)
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_8000
     * @tc.name testDeepcopy0080
     * @tc.desc Verify Map entries are independent after deepcopy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, number[]> = new Map<string, number[]>()
      map.set("a", [1, 2, 3])
      let copy = deepcopy(map)
      map.get("a")!.push(4)
      expect(copy!.get("a")!.join(",")).assertEqual("1,2,3")
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_8100
     * @tc.name testDeepcopy0081
     * @tc.desc Verify Set elements are independent after deepcopy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<number[]> = new Set<number[]>()
      set.add([1, 2])
      let copy = deepcopy(set)
      let origArr = Array.from(set)[0]
      origArr.push(3)
      let copyArr = Array.from(copy!)[0]
      expect(copyArr.join(",")).assertEqual("1,2")
    })

    /**
     * @tc.number DPCPY_SPEC_ITEM_CHK_8400
     * @tc.name testDeepcopy0084
     * @tc.desc Verify deepcopy of string returns identical reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDeepcopy0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "immutable"
      let result = deepcopy(s)
      expect(result === s).assertTrue()
    })


  })
}
