/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// === RT-OBJ-01/02: object identity & property value ===
interface Simple {
  x: number
  label: string
}

export function testIdentityAndValue(): string {
  let raw = { x: 10, label: "hello" }
  let annotated: Simple = raw
  // identity preserved: annotated === raw
  if (annotated !== raw) { return "identity-fail" }
  // property value preserved
  if (annotated.x !== 10) { return "x-fail" }
  if (annotated.label !== "hello") { return "label-fail" }
  return "ok"
}

// === RT-OBJ-04: optional property omitted ===
interface WithOptional {
  required: string
  optional?: string
}

export function testOptionalOmitted(): string {
  let obj: WithOptional = { required: "req" }
  // key should NOT exist on object
  if ("optional" in obj) { return "optional-exists" }
  if (obj.required !== "req") { return "required-fail" }
  return "ok"
}

// === RT-CALL-01: method call with receiver ===
interface HasMethod {
  value: number
  getValue(): number
}

export function testMethodReceiver(): string {
  let obj: HasMethod = {
    value: 42,
    getValue(): number {
      return this.value
    }
  }
  let result = obj.getValue()
  if (result !== 42) { return "receiver-fail" }
  return "ok"
}

// === class implements (prototype + instanceof + multi-interface) ===
interface Drawable {
  draw(): string
}

class Shape implements Drawable {
  draw(): string {
    return "shape-draw"
  }
  extra(): string {
    return "extra"
  }
}

interface ILeft { left(): string }
interface IRight { right(): string }

class BothImpl implements ILeft, IRight {
  left(): string { return "left" }
  right(): string { return "right" }
}

export function testClassImpl(): string {
  let s = new Shape()
  if (!(s instanceof Shape)) { return "instanceof-fail" }
  if (s.draw() !== "shape-draw") { return "draw-fail" }
  if (s.extra() !== "extra") { return "extra-fail" }

  let b = new BothImpl()
  if (b.left() !== "left") { return "left-fail" }
  if (b.right() !== "right") { return "right-fail" }
  return "ok"
}

// === IF-EXT-001/003 + IF-MULTEXT-001: interface extends (single, multi-level & multi-base) ===
interface IA { getA(): string }
interface IB extends IA { getB(): string }
interface IC extends IB { getC(): string }
interface IX { getX(): string }
interface IY { getY(): string }
interface IZ extends IX, IY { getZ(): string }

export function testInterfaceExtendsAll(): string {
  let single: IC = {
    getA(): string { return "A" },
    getB(): string { return "B" },
    getC(): string { return "C" }
  }
  if (single.getA() !== "A" || single.getB() !== "B" || single.getC() !== "C") { return "single-fail" }

  let multi: IZ = {
    getX(): string { return "X" },
    getY(): string { return "Y" },
    getZ(): string { return "Z" }
  }
  if (multi.getX() !== "X" || multi.getY() !== "Y" || multi.getZ() !== "Z") { return "multi-fail" }

  return "ok"
}

interface Point {
  x: number
  y: number
}

interface HasRequired {
  id: number
}

interface Mutable {
  value: number
}

interface Deletable {
  name: string
}

export function testObjectModel(): string {
  // structural assign + read
  let raw = { x: 3, y: 4 }
  let p: Point = raw
  if (p.x !== 3 || p.y !== 4) { return "read-fail" }

  // missing property â†?undefined
  let obj: HasRequired = { id: 1 }
  let val = (obj as any).nonexistent
  if (val !== undefined) { return "undefined-fail" }

  // write then read
  let m: Mutable = { value: 10 }
  m.value = 20
  if (m.value !== 20) { return "write-fail" }

  // delete then in check
  let d: Deletable = { name: "del" }
  delete (d as any).name
  if ("name" in d) { return "delete-fail" }

  return "ok"
}

// === #1: Interface as array type ===
interface IPoint {
  x: number
  y: number
}

export function testInterfaceArray(): string {
  let arr: IPoint[] = [{ x: 1, y: 2 }, { x: 3, y: 4 }]
  if (arr.length !== 2) { return "length-fail" }
  if (arr[0].x !== 1 || arr[0].y !== 2) { return "first-fail" }
  arr[1].x = 5
  if (arr[1].x !== 5) { return "write-fail" }
  return "ok"
}

// === #2: Interface as function param/return ===
interface IResult {
  value: number
  label: string
}

export function testInterfaceFnParamReturn(): string {
  function process(obj: IResult): IResult {
    return { value: obj.value * 2, label: obj.label + "-processed" }
  }
  let input: IResult = { value: 10, label: "test" }
  let output = process(input)
  if (output.value !== 20) { return "value-fail" }
  if (output.label !== "test-processed") { return "label-fail" }
  return "ok"
}

// === #3: Nested interface ===
interface Inner {
  id: number
}
interface Outer {
  inner: Inner
  name: string
}

export function testNestedInterface(): string {
  let obj: Outer = { inner: { id: 42 }, name: "outer" }
  if (obj.inner.id !== 42) { return "nested-fail" }
  if (obj.name !== "outer") { return "name-fail" }
  obj.inner.id = 99
  if (obj.inner.id !== 99) { return "nested-write-fail" }
  return "ok"
}

// === #5: Interface call signature ===
interface Stringifier {
  (x: number): string
}

export function testCallSignature(): string {
  let fn: Stringifier = function(x: number): string { return String(x) }
  let result = fn(42)
  if (result !== "42") { return "call-fail" }
  return "ok"
}

// === #6: Interface construct signature ===
interface PointCtor {
  new (x: number, y: number): IPoint
}

export function testConstructSignature(): string {
  let Ctor: PointCtor = class {
    x: number
    y: number
    constructor(x: number, y: number) {
      this.x = x
      this.y = y
    }
  }
  let p = new Ctor(1, 2)
  if (p.x !== 1 || p.y !== 2) { return "construct-fail" }
  return "ok"
}

// === #7: Interface readonly (erasure â€?not frozen) ===
interface ReadonlyPoint {
  readonly x: number
  readonly y: number
}

export function testInterfaceReadonly(): string {
  let obj: ReadonlyPoint = { x: 10, y: 20 }
  ;(obj as any).x = 30
  if ((obj as any).x !== 30) { return "readonly-erasure-fail" }
  return "ok"
}

// === #8: Interface extends class ===
class BaseClass {
  baseMethod(): string { return "base" }
}
interface Extended extends BaseClass {
  extra(): string
}

export function testInterfaceExtendsClass(): string {
  let obj: Extended = {
    baseMethod(): string { return "base" },
    extra(): string { return "extra" }
  }
  if (obj.baseMethod() !== "base") { return "base-fail" }
  if (obj.extra() !== "extra") { return "extra-fail" }
  return "ok"
}

// === #9: Interface union type ===
interface Cat { kind: "cat"; meow(): string }
interface Dog { kind: "dog"; bark(): string }

type Animal = Cat | Dog

export function testInterfaceUnion(): string {
  let cat: Animal = { kind: "cat", meow(): string { return "meow" } }
  if (cat.kind !== "cat") { return "discriminant-fail" }
  if ((cat as Cat).meow() !== "meow") { return "meow-fail" }

  let dog: Animal = { kind: "dog", bark(): string { return "woof" } }
  if (dog.kind !== "dog") { return "kind-fail" }
  if ((dog as Dog).bark() !== "woof") { return "bark-fail" }
  return "ok"
}
