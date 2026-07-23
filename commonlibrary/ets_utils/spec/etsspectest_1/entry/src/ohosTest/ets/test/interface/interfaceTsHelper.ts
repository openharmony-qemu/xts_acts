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

export interface IdentityAndValueResult {
  identity: boolean
  x: number
  label: string
}

export function testIdentityAndValue(): IdentityAndValueResult {
  let raw = { x: 10, label: "hello" }
  let annotated: Simple = raw
  return { identity: annotated === raw, x: annotated.x, label: annotated.label }
}

// === RT-OBJ-04: optional property omitted ===
interface WithOptional {
  required: string
  optional?: string
}

export interface OptionalOmittedResult {
  hasOptional: boolean
  requiredValue: string
}

export function testOptionalOmitted(): OptionalOmittedResult {
  let obj: WithOptional = { required: "req" }
  return { hasOptional: "optional" in obj, requiredValue: obj.required }
}

// === RT-CALL-01: method call with receiver ===
interface HasMethod {
  value: number
  getValue(): number
}

export interface MethodReceiverResult {
  result: number
}

export function testMethodReceiver(): MethodReceiverResult {
  let obj: HasMethod = {
    value: 42,
    getValue(): number {
      return this.value
    }
  }
  return { result: obj.getValue() }
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

export interface ClassImplResult {
  shapeInstanceof: boolean
  shapeDraw: string
  shapeExtra: string
  bothLeft: string
  bothRight: string
}

export function testClassImpl(): ClassImplResult {
  let s = new Shape()
  let d: Drawable = s
  let b = new BothImpl()
  let leftIf: ILeft = b
  let rightIf: IRight = b
  return {
    shapeInstanceof: s instanceof Shape,
    shapeDraw: d.draw(),
    shapeExtra: s.extra(),
    bothLeft: leftIf.left(),
    bothRight: rightIf.right()
  }
}

// === IF-EXT-001/003 + IF-MULTEXT-001: interface extends (single, multi-level & multi-base) ===
interface IA { getA(): string }
interface IB extends IA { getB(): string }
interface IC extends IB { getC(): string }
interface IX { getX(): string }
interface IY { getY(): string }
interface IZ extends IX, IY { getZ(): string }

export interface ExtendsAllResult {
  singleA: string
  singleB: string
  singleC: string
  multiX: string
  multiY: string
  multiZ: string
}

export function testInterfaceExtendsAll(): ExtendsAllResult {
  let single: IC = {
    getA(): string { return "A" },
    getB(): string { return "B" },
    getC(): string { return "C" }
  }
  let multi: IZ = {
    getX(): string { return "X" },
    getY(): string { return "Y" },
    getZ(): string { return "Z" }
  }
  return {
    singleA: single.getA(),
    singleB: single.getB(),
    singleC: single.getC(),
    multiX: multi.getX(),
    multiY: multi.getY(),
    multiZ: multi.getZ()
  }
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

export interface ObjectModelResult {
  readX: number
  readY: number
  missing: any
  afterWrite: number
  hasDeleted: boolean
}

export function testObjectModel(): ObjectModelResult {
  let raw = { x: 3, y: 4 }
  let p: Point = raw

  let obj: HasRequired = { id: 1 }
  let missing = (obj as any).nonexistent

  let m: Mutable = { value: 10 }
  m.value = 20

  let d: Deletable = { name: "del" }
  delete (d as any).name

  return {
    readX: p.x,
    readY: p.y,
    missing: missing,
    afterWrite: m.value,
    hasDeleted: "name" in d
  }
}

// === #1: Interface as array type ===
interface IPoint {
  x: number
  y: number
}

export interface ArrayResult {
  length: number
  firstX: number
  firstY: number
  afterWrite: number
}

export function testInterfaceArray(): ArrayResult {
  let arr: IPoint[] = [{ x: 1, y: 2 }, { x: 3, y: 4 }]
  arr[1].x = 5
  return {
    length: arr.length,
    firstX: arr[0].x,
    firstY: arr[0].y,
    afterWrite: arr[1].x
  }
}

// === #2: Interface as function param/return ===
interface IResult {
  value: number
  label: string
}

export interface FnParamReturnResult {
  outputValue: number
  outputLabel: string
}

export function testInterfaceFnParamReturn(): FnParamReturnResult {
  function process(obj: IResult): IResult {
    return { value: obj.value * 2, label: obj.label + "-processed" }
  }
  let input: IResult = { value: 10, label: "test" }
  let output = process(input)
  return { outputValue: output.value, outputLabel: output.label }
}

// === #3: Nested interface ===
interface Inner {
  id: number
}
interface Outer {
  inner: Inner
  name: string
}

export interface NestedResult {
  initialId: number
  name: string
  afterWrite: number
}

export function testNestedInterface(): NestedResult {
  let obj: Outer = { inner: { id: 42 }, name: "outer" }
  obj.inner.id = 99
  return { initialId: 42, name: obj.name, afterWrite: obj.inner.id }
}

// === #5: Interface call signature -- TS-only: ArkTS does not support call signatures ===
interface Stringifier {
  (x: number): string
}

export interface CallSignatureResult {
  result: string
}

export function testCallSignature(): CallSignatureResult {
  let fn: Stringifier = function(x: number): string { return String(x) }
  return { result: fn(42) }
}

// === #6: Interface construct signature -- TS-only: ArkTS does not support construct signatures ===
interface PointCtor {
  new (x: number, y: number): IPoint
}

export interface ConstructSignatureResult {
  x: number
  y: number
}

export function testConstructSignature(): ConstructSignatureResult {
  let Ctor: PointCtor = class {
    x: number
    y: number
    constructor(x: number, y: number) {
      this.x = x
      this.y = y
    }
  }
  let p = new Ctor(1, 2)
  return { x: p.x, y: p.y }
}

// === #7: Interface readonly (erasure -- not frozen)
interface ReadonlyPoint {
  readonly x: number
  readonly y: number
}

export interface ReadonlyResult {
  afterWrite: number
}

export function testInterfaceReadonly(): ReadonlyResult {
  let obj: ReadonlyPoint = { x: 10, y: 20 }
  ;(obj as any).x = 30
  return { afterWrite: (obj as any).x }
}

// === #8: Interface extends class ===
class BaseClass {
  baseMethod(): string { return "base" }
}
interface Extended extends BaseClass {
  extra(): string
}

export interface ExtendsClassResult {
  baseResult: string
  extraResult: string
}

export function testInterfaceExtendsClass(): ExtendsClassResult {
  let obj: Extended = {
    baseMethod(): string { return "base" },
    extra(): string { return "extra" }
  }
  return { baseResult: obj.baseMethod(), extraResult: obj.extra() }
}

// === #9: Interface union type ===
interface Cat { kind: "cat"; meow(): string }
interface Dog { kind: "dog"; bark(): string }

type Animal = Cat | Dog

export interface UnionResult {
  catKind: string
  catMeow: string
  dogKind: string
  dogBark: string
}

export function testInterfaceUnion(): UnionResult {
  let cat: Animal = { kind: "cat", meow(): string { return "meow" } }
  let dog: Animal = { kind: "dog", bark(): string { return "woof" } }
  return {
    catKind: cat.kind,
    catMeow: (cat as Cat).meow(),
    dogKind: dog.kind,
    dogBark: (dog as Dog).bark()
  }
}
