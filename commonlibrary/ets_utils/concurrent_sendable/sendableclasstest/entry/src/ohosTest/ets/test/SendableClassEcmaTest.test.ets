/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { collections, lang } from '@kit.ArkTS';

@Sendable
class AllEmpty {
}

@Sendable
class AllAddress {
  public city: string
  constructor(city: string) {
    this.city = city
  }
}

interface AllNamed {
  name: string
  getName(): string
}

interface AllStore<T> {
  getValue(): T
}

@Sendable
abstract class AllEntity {
  public readonly id: number
  constructor(id: number) {
    this.id = id
  }
  public abstract label(): string
  public idText(): string {
    return "id"
  }
}

@Sendable
class AllPerson extends AllEntity implements AllNamed {
  public static count: number = 0
  public static readonly KIND: string = "person"
  public name: string
  protected level: number = 1
  private secret: string = "hidden"
  public address: AllAddress
  public score: number = 1

  constructor(id: number, name: string, address: AllAddress) {
    super(id)
    this.name = name
    this.address = address
    AllPerson.count = AllPerson.count + 1
  }

  public label(): string {
    return this.name
  }

  public getName(): string {
    return this.name
  }

  public reveal(): string {
    return this.secret
  }

  public addScore(delta: number): AllPerson {
    this.score = this.score + delta
    return this
  }

  public levelValue(): number {
    return this.level
  }

  public static create(name: string): AllPerson {
    return new AllPerson(1, name, new AllAddress("shenzhen"))
  }
}

@Sendable
class AllEmployee extends AllPerson {
  public title: string
  constructor(name: string, title: string) {
    super(2, name, new AllAddress("beijing"))
    this.title = title
  }
  public label(): string {
    return this.name + ":" + this.title
  }
}

@Sendable
class AllManager extends AllEmployee {
  public teamSize: number
  constructor(name: string, size: number) {
    super(name, "manager")
    this.teamSize = size
  }
}

@Sendable
class AllBox<T> implements AllStore<T> {
  public value: T
  constructor(value: T) {
    this.value = value
  }
  public getValue(): T {
    return this.value
  }
}

@Sendable
class AllNumberBox extends AllBox<number> {
  constructor(value: number) {
    super(value)
  }
}

@Sendable
class AllOrder {
  public owner: AllPerson
  public amount: number
  constructor(owner: AllPerson, amount: number) {
    this.owner = owner
    this.amount = amount
  }
}

@Sendable
class BasicEmpty {
}

@Sendable
class BasicPoint {
  public x: number
  public y: number
  constructor(x: number, y: number) {
    this.x = x
    this.y = y
  }
}

@Sendable
class BasicUser {
  public name: string
  public age: number
  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
  public rename(name: string): void {
    this.name = name
  }
}

@Sendable
class CtorEmpty {
  public value: number = 0
  constructor() {
  }
}

@Sendable
class CtorPoint {
  public x: number
  public y: number
  public readonly id: number

  constructor(x: number, y: number, id: number) {
    this.x = x
    this.y = y
    this.id = id
  }

  public sum(): number {
    return this.x + this.y
  }
}

@Sendable
class CtorBase {
  public baseValue: number
  constructor(value: number) {
    this.baseValue = value
  }
}

@Sendable
class CtorDerived extends CtorBase {
  public ownValue: number
  constructor(baseValue: number, ownValue: number) {
    super(baseValue)
    this.ownValue = ownValue
  }
}

@Sendable
class CtorLevelThree extends CtorDerived {
  public name: string
  constructor(name: string) {
    super(1, 2)
    this.name = name
  }
}

@Sendable
class CtorFactory {
  public value: number
  constructor(value: number) {
    this.value = value
  }
  public static create(value: number): CtorFactory {
    return new CtorFactory(value)
  }
}

@Sendable
class CtorCombined {
  public prefix: string = "item"
  public text: string
  constructor(id: number) {
    this.text = this.prefix + id.toString()
  }
}

@Sendable
class FieldAddress {
  public city: string
  constructor(city: string) {
    this.city = city
  }
}

@Sendable
class FieldProfile {
  public age: number = 18
  public name: string = "user"
  public active: boolean = true
  public address: FieldAddress
  public scores: collections.Array<number> = collections.Array.from([1, 2, 3])
  public first: number = 1
  public second: number = this.first + 1

  constructor(address: FieldAddress) {
    this.address = address
  }

  public updateName(name: string): void {
    this.name = name
  }

  public addScore(score: number): void {
    this.scores.push(score)
  }
}

@Sendable
class FieldBase {
  public inheritedValue: number = 10
  public label: string = "base"
}

@Sendable
class FieldDerived extends FieldBase {
  public derivedValue: number = 20
  public label: string = "derived"
}

@Sendable
class FieldUser {
  public address: FieldAddress
  constructor(address: FieldAddress) {
    this.address = address
  }
}

interface MethodReadable {
  readLabel(): string
}

@Sendable
class MethodResult implements MethodReadable {
  public label: string
  constructor(label: string) {
    this.label = label
  }
  public readLabel(): string {
    return this.label
  }
}

@Sendable
class MethodCounter {
  public value: number = 0

  public reset(): void {
    this.value = 0
  }

  public addOne(): number {
    this.value = this.value + 1
    return this.value
  }

  public add(value: number): number {
    this.value = this.value + value
    return this.value
  }

  public addTwo(a: number, b: number): number {
    return a + b
  }

  public isPositive(): boolean {
    return this.value > 0
  }

  public makeResult(label: string): MethodResult {
    return new MethodResult(label)
  }

  public makeReadable(label: string): MethodReadable {
    return new MethodResult(label)
  }

  public callAnother(): number {
    return this.addTwo(this.value, 2)
  }
}

@Sendable
class MethodBase {
  public describe(): string {
    return "base"
  }
}

@Sendable
class MethodDerived extends MethodBase {
  public describe(): string {
    return "derived"
  }
}

@Sendable
class StaticReadonlyCounter {
  public static count: number = 0
  public static readonly VERSION: string = "1.0"
  public readonly id: number
  public name: string

  constructor(id: number, name: string) {
    this.id = id
    this.name = name
    StaticReadonlyCounter.count = StaticReadonlyCounter.count + 1
  }

  public static create(name: string): StaticReadonlyCounter {
    return new StaticReadonlyCounter(StaticReadonlyCounter.count + 1, name)
  }

  public static currentCount(): number {
    return StaticReadonlyCounter.count
  }
}

@Sendable
class StaticReadonlyBase {
  public static typeName: string = "base"
  public static readType(): string {
    return StaticReadonlyBase.typeName
  }
}

@Sendable
class StaticReadonlyDerived extends StaticReadonlyBase {
  public static derivedType(): string {
    return StaticReadonlyDerived.readType()
  }
}

@Sendable
class StaticReadonlyOwner {
  public readonly label: string = "owner"
}

@Sendable
class InheritBase {
  public value: number
  protected code: string = "base-code"

  constructor(value: number) {
    this.value = value
  }

  public describe(): string {
    return "base"
  }

  public double(): number {
    return this.value * 2
  }

  protected readCode(): string {
    return this.code
  }

  public static kind(): string {
    return "inherit-base"
  }
}

@Sendable
class InheritDerived extends InheritBase {
  public name: string
  constructor(value: number, name: string) {
    super(value)
    this.name = name
  }

  public describe(): string {
    return super.describe() + "-derived"
  }

  public readProtected(): string {
    return this.readCode()
  }

  public ownMethod(): string {
    return this.name
  }
}

@Sendable
class InheritLevelThree extends InheritDerived {
  constructor() {
    super(5, "level-three")
  }
}

@Sendable
class InheritStaticDerived extends InheritBase {
}

interface IaNamed {
  name: string
  getName(): string
}

interface IaIdentified {
  id: number
}

interface IaWorker {
  work(): string
}

@Sendable
class IaBaseWorker {
  public work(): string {
    return "base-work"
  }
}

@Sendable
class IaUser implements IaNamed, IaIdentified {
  public id: number
  public name: string
  constructor(id: number, name: string) {
    this.id = id
    this.name = name
  }
  public getName(): string {
    return this.name
  }
}

@Sendable
class IaInheritedWorker extends IaBaseWorker implements IaWorker {
}

@Sendable
abstract class IaAbstractAnimal {
  public name: string
  constructor(name: string) {
    this.name = name
  }
  public abstract sound(): string
  public describe(): string {
    return this.name + ":" + this.sound()
  }
}

@Sendable
class IaDog extends IaAbstractAnimal {
  public sound(): string {
    return "bark"
  }
}

@Sendable
abstract class IaAbstractService implements IaWorker {
  public abstract work(): string
  public serviceName(): string {
    return "service"
  }
}

@Sendable
class IaConcreteService extends IaAbstractService {
  public work(): string {
    return "done"
  }
}

interface GenStore<T> {
  getValue(): T
}

interface GenNamed {
  name: string
}

@Sendable
class GenBox<T> implements GenStore<T> {
  public value: T
  constructor(value: T) {
    this.value = value
  }
  public getValue(): T {
    return this.value
  }
  public setValue(value: T): void {
    this.value = value
  }
}

@Sendable
class GenPair<K, V> {
  public key: K
  public value: V
  constructor(key: K, value: V) {
    this.key = key
    this.value = value
  }
}

@Sendable
class GenArrayBox<T> {
  public values: collections.Array<T>
  constructor(values: collections.Array<T>) {
    this.values = values
  }
  public first(): T {
    return this.values[0]
  }
}

@Sendable
class GenNamedUser implements GenNamed {
  public name: string
  constructor(name: string) {
    this.name = name
  }
}

@Sendable
class GenNamedBox<T extends GenNamed> {
  public value: T
  constructor(value: T) {
    this.value = value
  }
  public getName(): string {
    return this.value.name
  }
}

@Sendable
class GenNumberBox extends GenBox<number> {
  constructor(value: number) {
    super(value)
  }
}

@Sendable
class GenForwardBox<T> extends GenBox<T> {
  constructor(value: T) {
    super(value)
  }
}

@Sendable
class GenMethodBox<T> {
  public value: T
  constructor(value: T) {
    this.value = value
  }
  public wrap<U>(extra: U): GenPair<T, U> {
    return new GenPair<T, U>(this.value, extra)
  }
}

@Sendable
class VisibilityAccount {
  public owner: string
  private balance: number
  protected level: number

  constructor(owner: string, balance: number) {
    this.owner = owner
    this.balance = balance
    this.level = 1
  }

  public deposit(value: number): void {
    this.addBalance(value)
  }

  public currentBalance(): number {
    return this.balance
  }

  private addBalance(value: number): void {
    this.balance = this.balance + value
  }

  protected readLevel(): number {
    return this.level
  }
}

@Sendable
class VisibilityVipAccount extends VisibilityAccount {
  public bonus(): number {
    return this.level + this.readLevel()
  }
}

@Sendable
class ThisBase {
  public value: number
  constructor(value: number) {
    this.value = value
  }
  public add(value: number): ThisBase {
    this.value = this.value + value
    return this
  }
  public read(): number {
    return this.value
  }
  public describe(): string {
    return "base"
  }
}

@Sendable
class ThisDerived extends ThisBase {
  public name: string
  constructor(value: number, name: string) {
    super(value)
    this.name = name
  }
  public describe(): string {
    return super.describe() + ":" + this.name
  }
  public addDerived(value: number): ThisDerived {
    this.value = this.value + value
    return this
  }
  public static create(name: string): ThisDerived {
    return new ThisDerived(1, name)
  }
}

@Sendable
class ThisHolder {
  public count: number
  constructor(count: number) {
    this.count = count
  }
}

function runFieldInheritPass001(): number {
  let d: FieldInheritPass001Derived = new FieldInheritPass001Derived()
  return d.field
}

function runFieldInheritPass002(): string {
  let d: FieldInheritPass002Derived = new FieldInheritPass002Derived()
  return d.field
}

@Sendable
class FieldInheritPass001Base {
  field: number = 1
}

@Sendable
class FieldInheritPass001Derived extends FieldInheritPass001Base {
  override field: number = 2
}

@Sendable
class FieldInheritPass002Base {
  field: string = 'base'
}

@Sendable
class FieldInheritPass002Derived extends FieldInheritPass002Base {
  field: string = 'derived'
}

@Sendable
class FieldInheritPass003Base {
  protected field: number = 3
}

@Sendable
class FieldInheritPass003Derived extends FieldInheritPass003Base {
  protected override field: number = 4

  getField(): number {
    return this.field
  }
}

@Sendable
class FieldInheritPass004Base {
  field: string | number = 1
}

@Sendable
class FieldInheritPass004Derived extends FieldInheritPass004Base {
  override field: string | number

  constructor() {
    super()
    this.field = 'derived'
  }
}

@Sendable
class FieldInheritPass005Base {
  field: number = 5
}

interface FieldInheritPass005Interface extends lang.ISendable {
  field: number
}

@Sendable
class FieldInheritPass005Derived extends FieldInheritPass005Base implements FieldInheritPass005Interface {
  override field: number = 6
}

interface FieldInheritPass006Interface extends lang.ISendable {
  field: string
}

@Sendable
class FieldInheritPass006Base implements FieldInheritPass006Interface {
  field: string = 'base'
}

@Sendable
class FieldInheritPass006Derived extends FieldInheritPass006Base {
}

@Sendable
class FieldInheritPass007Base {
  field: number = 7
}

@Sendable
class FieldInheritPass007Derived extends FieldInheritPass007Base {
  override field: number = 8
}

@Sendable
class FieldInheritPass008Base<T extends lang.ISendable> {
  field: T | null = null

  constructor(value: T) {
    this.field = value
  }
}

@Sendable
class FieldInheritPass008Derived<U extends lang.ISendable> extends FieldInheritPass008Base<U> {
  override field: U | null = null

  constructor(value: U) {
    super(value)
    this.field = value
  }
}

@Sendable
class FieldInheritPass009Base {
  field: number = 9
}

@Sendable
class FieldInheritPass009Derived extends FieldInheritPass009Base {
  override field: number = 10
}

@Sendable
class FieldInheritPass010Base {
  field: number | string = 10
}

@Sendable
class FieldInheritPass010Derived extends FieldInheritPass010Base {
  override field: number | string = 'ten'
}

@Sendable
class FieldInheritPass011Root {
  field: number = 11
}

@Sendable
class FieldInheritPass011Middle extends FieldInheritPass011Root {
  override field: number = 12
}

@Sendable
class FieldInheritPass011Leaf extends FieldInheritPass011Middle {
  override field: number = 13
}

interface FieldInheritPass012I1 extends lang.ISendable {
  field: number;
}

interface FieldInheritPass012I2 extends lang.ISendable {
  field: number;
}

@Sendable
class FieldInheritPass012Class implements FieldInheritPass012I1, FieldInheritPass012I2 {
  field: number = 12
}

interface FieldInheritPass013Interface extends lang.ISendable {
  field: number
}

@Sendable
class FieldInheritPass013Class implements FieldInheritPass013Interface {
  field: number = 13
}

interface FieldInheritPass014Interface extends lang.ISendable {
  field: number
}

@Sendable
class FieldInheritPass014Class implements FieldInheritPass014Interface {
  field: number = 14
}

interface FieldInheritPass015Interface extends lang.ISendable {
  field: number
}

@Sendable
class FieldInheritPass015Class implements FieldInheritPass015Interface {
  field: number = 15
}

interface FieldInheritPass016Interface extends lang.ISendable {
  field: number
}

@Sendable
class FieldInheritPass016Class implements FieldInheritPass016Interface {
  field: number = 0
}

interface FieldInheritPass017Interface extends lang.ISendable {
  field: number
}

@Sendable
class FieldInheritPass017Class implements FieldInheritPass017Interface {
  field: number = 17
}

interface FieldInheritPass018Interface extends lang.ISendable {
  field: number
}

@Sendable
class FieldInheritPass018Class implements FieldInheritPass018Interface {
  field: number = 18
}

@Sendable
class FieldInheritPass020Base {
  field: string | null = null
}

@Sendable
class FieldInheritPass020Derived extends FieldInheritPass020Base {
  override field: string | null = 'twenty'
}

@Sendable
class FieldInheritPass021Base {
  field: FieldInheritPass021Box<string> = new FieldInheritPass021Box<string>('base')
}

@Sendable
class FieldInheritPass021Box<T extends lang.ISendable> {
  value: T

  constructor(value: T) {
    this.value = value
  }
}

@Sendable
class FieldInheritPass021Derived extends FieldInheritPass021Base {
  override field: FieldInheritPass021Box<string> = new FieldInheritPass021Box<string>('derived')
}

@Sendable
class FieldInheritPass022Base {
  field: collections.Array<string> = new collections.Array<string>('base')
}

@Sendable
class FieldInheritPass022Derived extends FieldInheritPass022Base {
  override field: collections.Array<string> = new collections.Array<string>('derived')
}

@Sendable
class FieldInheritPass023Base {
  field: collections.Array<number | string> = new collections.Array<number | string>(23, 'base')
}

@Sendable
class FieldInheritPass023Derived extends FieldInheritPass023Base {
  override field: collections.Array<number | string> = new collections.Array<number | string>(24, 'derived')
}

@Sendable
class FieldInheritPass026Base {
  static field: number = 26
}

@Sendable
class FieldInheritPass026Derived extends FieldInheritPass026Base {
  field: number = 27
}

@Sendable
class FieldInheritPass027Base {
  field: number = 27
}

@Sendable
class FieldInheritPass027Derived extends FieldInheritPass027Base {
  static field: number = 28
}

interface FieldInheritPass028BaseInterface extends lang.ISendable {
  field: number;
}

@Sendable
class FieldInheritPass028Child implements FieldInheritPass028BaseInterface {
  field: number = 123
}

@Sendable
class FieldInheritRt001Base {
  field: string | number = 5
}

@Sendable
class FieldInheritRt001Derived extends FieldInheritRt001Base {
  override field: string | number = 'abc'
}

@Sendable
class FieldInheritRt002Base {
  field: string = 'base'
}

@Sendable
class FieldInheritRt002Derived extends FieldInheritRt002Base {
  override field: string = 'derived'
}

interface FieldInheritRt003Interface extends lang.ISendable {
  field: string
}

@Sendable
class FieldInheritRt003Base implements FieldInheritRt003Interface {
  field: string = 'base'
}

@Sendable
class FieldInheritRt003Derived extends FieldInheritRt003Base {
  override field: string = 'derived'
}

@Sendable
class FieldInheritRt004Base {
  field: number = FieldInheritRt004Trace.add('B')
}

@Sendable
class FieldInheritRt004Derived extends FieldInheritRt004Base {
  override field: number = FieldInheritRt004Trace.add('D') + 1
}

@Sendable
class FieldInheritRt004Trace {
  static value: string = ''

  static add(value: string): number {
    FieldInheritRt004Trace.value += value
    return 1
  }
}

interface FieldInheritRt005Interface extends lang.ISendable {
  field: string
}

@Sendable
class FieldInheritRt005Base implements FieldInheritRt005Interface {
  field: string = 'base'
}

@Sendable
class FieldInheritRt005Derived extends FieldInheritRt005Base {
  override field: string = 'derived'
}

@Sendable
class FieldInheritRt006Root {
  field: string = 'root'
}

@Sendable
class FieldInheritRt006Middle extends FieldInheritRt006Root {
}

@Sendable
class FieldInheritRt006Leaf extends FieldInheritRt006Middle {
  override field: string = 'leaf'
}

@Sendable
class OverrideFieldPass001Base {
  field: number = 1
}

@Sendable
class OverrideFieldPass001Derived extends OverrideFieldPass001Base {
  override field: number = 2
}

@Sendable
class OverrideFieldPass002Base {
  field: number = 1
}

@Sendable
class OverrideFieldPass002Derived extends OverrideFieldPass002Base {
  field: number = 2
}

@Sendable
class OverrideFieldPass003Base {
  protected field: number = 3

  getField(): number {
    return this.field
  }
}

@Sendable
class OverrideFieldPass003Derived extends OverrideFieldPass003Base {
  protected override field: number = 30
}

@Sendable
class OverrideFieldPass004Base {
  field: number = 4
}

@Sendable
class OverrideFieldPass004Derived extends OverrideFieldPass004Base {
  override field: number

  constructor() {
    super()
    this.field = 40
  }
}

@Sendable
class OverrideFieldPass005Base {
  field: number = 5
}

@Sendable
class OverrideFieldPass005Mid extends OverrideFieldPass005Base {
  override field: number = 50
}

@Sendable
class OverrideFieldPass005Derived extends OverrideFieldPass005Mid {
  override field: number = 500
}

@Sendable
class OverrideFieldPass006Base {
  field: string = '6'
}

interface OverrideFieldPass006I extends lang.ISendable {
  field: string
}

@Sendable
class OverrideFieldPass006Derived extends OverrideFieldPass006Base implements OverrideFieldPass006I {
  override field: string = 'six'
}

@Sendable
class OverrideFieldRuntime001Base {
  field: string | number = 1
}

interface OverrideFieldRuntime001I extends lang.ISendable {
  field: string | number
}

@Sendable
class OverrideFieldRuntime001Derived extends OverrideFieldRuntime001Base implements OverrideFieldRuntime001I {
  override field: string | number = 'derived'
}

@Sendable
class OverrideFieldRuntime002Base {
  field: string | number = 2
}

interface OverrideFieldRuntime002I extends lang.ISendable {
  field: string | number
}

@Sendable
class OverrideFieldRuntime002Derived extends OverrideFieldRuntime002Base implements OverrideFieldRuntime002I {
  override field: string | number = 'initial'
}

@Sendable
class OverrideFieldRuntime003Base {
  field: number = OverrideFieldRuntime003Base.initBase()

  static initBase(): number {
    OverrideFieldRuntime003Trace.value += 'B'
    return 3
  }
}

@Sendable
class OverrideFieldRuntime003Derived extends OverrideFieldRuntime003Base {
  override field: number = OverrideFieldRuntime003Derived.initDerived()

  static initDerived(): number {
    OverrideFieldRuntime003Trace.value += 'D'
    return 30
  }
}

@Sendable
class OverrideFieldRuntime003Trace {
  static value: string = ''
}

@Sendable
class StaticPass001Base {
  static foo(): number {
    return 1
  }
}

@Sendable
class StaticPass001Child extends StaticPass001Base {
}

@Sendable
class StaticPass002Base {
  static value: number = 2
}

@Sendable
class StaticPass002Child extends StaticPass002Base {
}

@Sendable
class StaticPass003Base {
  private static raw: number = 3

  static get value(): number {
    return StaticPass003Base.raw
  }
}

@Sendable
class StaticPass003Child extends StaticPass003Base {
}

@Sendable
class StaticPass004Base {
  static foo(p?: string): number {
    return 1
  }
}

@Sendable
class StaticPass004Child extends StaticPass004Base {
  static foo(p?: string): number {
    if (p !== undefined) {
      return 2
    }
    return 1
  }
}

@Sendable
class StaticPass005Base {
  static foo(p?: string): number {
    return 1
  }
}

@Sendable
class StaticPass005Child extends StaticPass005Base {
  static foo(p?: string): number {
    if (p !== undefined) {
      return p.length
    }
    return 1
  }
}

@Sendable
class StaticPass006Root {
  static foo(): number {
    return 6
  }
}

@Sendable
class StaticPass006Mid extends StaticPass006Root {
}

@Sendable
class StaticPass006Leaf extends StaticPass006Mid {
}

@Sendable
class StaticPass007Base {
  static foo(): number {
    return 7
  }
}

@Sendable
class StaticPass007Child extends StaticPass007Base {
  callBase(): number {
    return StaticPass007Base.foo()
  }
}

@Sendable
class StaticPass008Base {
  static foo(): number {
    return 8
  }
}

@Sendable
class StaticPass008Child extends StaticPass008Base {
  static callBase(): number {
    return StaticPass008Base.foo()
  }
}


@Sendable
class StaticRt002Base {
  static foo(p?: string): number {
    return 1
  }
}

@Sendable
class StaticRt002Child extends StaticRt002Base {
  static foo(p?: string): number {
    if (p !== undefined) {
      return 2
    }
    return 1
  }
}

@Sendable
class StaticRt003Base {
  static foo(): number {
    return 1
  }
}

@Sendable
class StaticRt003Child extends StaticRt003Base {
  static callBase(): number {
    return StaticRt003Base.foo()
  }
}

@Sendable
class StaticRt004Root {
  static foo(): number {
    return 1
  }
}

@Sendable
class StaticRt004Mid extends StaticRt004Root {
}

@Sendable
class StaticRt004Leaf extends StaticRt004Mid {
  static callRoot(): number {
    return StaticRt004Root.foo()
  }
}
export default function SendableClassEcmaTest() {
  describe('SendableClassEcmaTest', () => {
    beforeAll(() => {
      console.info('SendableClassDynTest beforeAll called');
    });

    afterAll(() => {
      console.info('SendableClassDynTest afterAll called');
    });

    beforeEach(() => {
      console.info('SendableClassDynTest beforeEach called');
    });

    afterEach(() => {
      console.info('SendableClassDynTest afterEach called');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_SIMPLE_TESTS_00100
     * @tc.name testSimpleSendableClasses
     * @tc.desc Test scenario for simple Sendable class declarations and instantiations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSimpleSendableClasses', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let empty: AllEmpty = new AllEmpty()
      expect(empty instanceof AllEmpty).assertTrue()

      let address: AllAddress = new AllAddress("hangzhou")
      expect(address.city).assertEqual("hangzhou")

      let numberBox: AllBox<number> = new AllBox<number>(1)
      expect(numberBox.getValue()).assertEqual(1)

      let store: AllStore<number> = new AllNumberBox(10)
      expect(store.getValue()).assertEqual(10)

      let basicEmpty: BasicEmpty = new BasicEmpty()
      expect(basicEmpty instanceof BasicEmpty).assertTrue()

      let ctorEmpty: CtorEmpty = new CtorEmpty()
      expect(ctorEmpty.value).assertEqual(0)

      let ctorBase: CtorBase = new CtorBase(5)
      expect(ctorBase.baseValue).assertEqual(5)

      let ctorDerived: CtorDerived = new CtorDerived(3, 4)
      expect(ctorDerived.baseValue + ctorDerived.ownValue).assertEqual(7)

      let ctorLevelThree: CtorLevelThree = new CtorLevelThree("third")
      expect(ctorLevelThree.name).assertEqual("third")

      let factory: CtorFactory = CtorFactory.create(8)
      expect(factory.value).assertEqual(8)

      let fieldAddress: FieldAddress = new FieldAddress("shanghai")
      expect(fieldAddress.city).assertEqual("shanghai")

      let methodResult: MethodResult = new MethodResult("test")
      expect(methodResult.readLabel()).assertEqual("test")

      let methodBase: MethodBase = new MethodBase()
      expect(methodBase.describe()).assertEqual("base")

      let methodDerived: MethodBase = new MethodDerived()
      expect(methodDerived.describe()).assertEqual("derived")

      expect(StaticReadonlyBase.readType()).assertEqual("base")

      expect(StaticReadonlyDerived.derivedType()).assertEqual("base")

      let staticOwner: StaticReadonlyOwner = new StaticReadonlyOwner()
      expect(staticOwner.label).assertEqual("owner")

      let inheritLevelThree: InheritLevelThree = new InheritLevelThree()
      expect(inheritLevelThree.describe()).assertEqual("base-derived")

      expect(InheritStaticDerived.kind()).assertEqual("inherit-base")

      let iaBaseWorker: IaBaseWorker = new IaBaseWorker()
      expect(iaBaseWorker.work()).assertEqual("base-work")

      let iaInheritedWorker: IaWorker = new IaInheritedWorker()
      expect(iaInheritedWorker.work()).assertEqual("base-work")

      let genArrayBox: GenArrayBox<number> = new GenArrayBox<number>(collections.Array.from([3, 4]))
      expect(genArrayBox.first()).assertEqual(3)

      let genNamedUser: GenNamedUser = new GenNamedUser("alice")
      expect(genNamedUser.name).assertEqual("alice")

      let genNamedBox: GenNamedBox<GenNamedUser> = new GenNamedBox<GenNamedUser>(new GenNamedUser("alice"))
      expect(genNamedBox.getName()).assertEqual("alice")

      let genNumberBox: GenNumberBox = new GenNumberBox(7)
      expect(genNumberBox.getValue()).assertEqual(7)

      let genForwardBox: GenForwardBox<string> = new GenForwardBox<string>("forward")
      expect(genForwardBox.getValue()).assertEqual("forward")

      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_ENTITY_00100
     * @tc.name testAllEntityAbstractClass
     * @tc.desc Test scenario for abstract Sendable class with readonly field and abstract method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAllEntityAbstractClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let person: AllPerson = new AllPerson(1, "alice", new AllAddress("hangzhou"))
      expect(person instanceof AllEntity).assertTrue()
      expect(person.id).assertEqual(1)
      expect(person.idText()).assertEqual("id")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_PERSON_00100
     * @tc.name testAllPersonClass
     * @tc.desc Test scenario for Sendable class extends abstract class implements interface with static members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAllPersonClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let person: AllPerson = new AllPerson(1, "alice", new AllAddress("hangzhou"))
      expect(person.getName()).assertEqual("alice")
      expect(person.reveal()).assertEqual("hidden")
      expect(person.addScore(4).score).assertEqual(5)
      expect(person.address.city).assertEqual("hangzhou")
      expect(AllPerson.KIND).assertEqual("person")
      expect(AllPerson.count >= 1).assertTrue()
      expect(usePerson(person)).assertEqual("alice")
      expect(createByClassValue("dave").name).assertEqual("dave")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_EMPLOYEE_00100
     * @tc.name testAllEmployeeClass
     * @tc.desc Test scenario for Sendable class extends parent class with method override
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAllEmployeeClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let employee: AllPerson = new AllEmployee("bob", "engineer")
      expect(employee.label()).assertEqual("bob:engineer")
      expect(employee instanceof AllPerson).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_MANAGER_00100
     * @tc.name testAllManagerClass
     * @tc.desc Test scenario for multi-level inheritance Sendable class with additional fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAllManagerClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let manager: AllManager = new AllManager("carol", 6)
      expect(manager instanceof AllEmployee).assertTrue()
      expect(manager.teamSize).assertEqual(6)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_ORDER_00100
     * @tc.name testAllOrderClass
     * @tc.desc Test scenario for Sendable class with composition of another Sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAllOrderClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let person: AllPerson = new AllPerson(1, "alice", new AllAddress("hangzhou"))
      let order: AllOrder = new AllOrder(person, 20)
      expect(order.amount).assertEqual(20)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_POINT_00100
     * @tc.name testBasicPointClass
     * @tc.desc Test scenario for Sendable class with constructor parameters and field initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testBasicPointClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let point: BasicPoint = new BasicPoint(1, 2)
      expect(point.x + point.y).assertEqual(3)
      let defaultPoint: BasicPoint = makeDefaultPoint()
      expect(defaultPoint.x).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_USER_00100
     * @tc.name testBasicUserClass
     * @tc.desc Test scenario for Sendable class with methods and instance independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testBasicUserClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let typedUser: BasicUser = new BasicUser("alice", 20)
      expect(readUserName(typedUser)).assertEqual("alice")
      let returnedUser: BasicUser = createUser("bob")
      expect(returnedUser.name).assertEqual("bob")
      let first: BasicUser = new BasicUser("first", 1)
      let second: BasicUser = new BasicUser("second", 2)
      first.rename("changed")
      expect(first.name).assertEqual("changed")
      expect(second.name).assertEqual("second")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_CTOR_POINT_00100
     * @tc.name testCtorPointClass
     * @tc.desc Test scenario for Sendable class constructor with multiple parameters and readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCtorPointClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let point: CtorPoint = new CtorPoint(1, 2, 100)
      expect(point.sum()).assertEqual(3)
      expect(point.id).assertEqual(100)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_CTOR_COMBINED_00100
     * @tc.name testCtorCombinedClass
     * @tc.desc Test scenario for Sendable class with field initializer and constructor combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCtorCombinedClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let combined: CtorCombined = new CtorCombined(9)
      expect(combined.text).assertEqual("item9")
      expect(combined instanceof CtorCombined).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_PROFILE_00100
     * @tc.name testFieldProfileClass
     * @tc.desc Test scenario for Sendable class with various field types and update methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFieldProfileClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let profile: FieldProfile = new FieldProfile(new FieldAddress("shanghai"))
      expect(profile.age).assertEqual(18)
      expect(profile.name).assertEqual("user")
      expect(profile.active).assertTrue()
      expect(profile.address.city).assertEqual("shanghai")
      expect(profile.scores.length).assertEqual(3)
      expect(profile.second).assertEqual(2)
      profile.age = 21
      profile.updateName("alice")
      profile.addScore(4)
      expect(profile.age).assertEqual(21)
      expect(profile.name).assertEqual("alice")
      expect(profile.scores.length).assertEqual(4)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_BASE_00100
     * @tc.name testFieldBaseClass
     * @tc.desc Test scenario for Sendable base class field initializers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFieldBaseClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let base: FieldBase = new FieldBase()
      expect(base.inheritedValue).assertEqual(10)
      expect(base.label).assertEqual("base")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_DERIVED_00100
     * @tc.name testFieldDerivedClass
     * @tc.desc Test scenario for Sendable derived class field shadowing and inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFieldDerivedClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let derived: FieldDerived = new FieldDerived()
      expect(derived.inheritedValue).assertEqual(10)
      expect(derived.derivedValue).assertEqual(20)
      expect(derived.label).assertEqual("derived")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_USER_00100
     * @tc.name testFieldUserClass
     * @tc.desc Test scenario for Sendable class with composition field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFieldUserClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let user: FieldUser = new FieldUser(new FieldAddress("nanjing"))
      expect(user.address.city).assertEqual("nanjing")
      expect(user.address instanceof FieldAddress).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_METHOD_COUNTER_00100
     * @tc.name testMethodCounterClass
     * @tc.desc Test scenario for Sendable class with various method signatures and return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMethodCounterClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let counter: MethodCounter = new MethodCounter()
      counter.reset()
      expect(counter.addOne()).assertEqual(1)
      expect(counter.add(4)).assertEqual(5)
      expect(counter.addTwo(1, 2)).assertEqual(3)
      expect(counter.isPositive()).assertTrue()
      expect(counter.callAnother()).assertEqual(7)
      let result: MethodResult = counter.makeResult("ok")
      expect(result.readLabel()).assertEqual("ok")
      let readable: MethodReadable = counter.makeReadable("interface")
      expect(readable.readLabel()).assertEqual("interface")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_STATIC_COUNTER_00100
     * @tc.name testStaticReadonlyCounterClass
     * @tc.desc Test scenario for Sendable class with static and readonly members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticReadonlyCounterClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let before: number = StaticReadonlyCounter.currentCount()
      let first: StaticReadonlyCounter = StaticReadonlyCounter.create("first")
      let second: StaticReadonlyCounter = StaticReadonlyCounter.create("second")
      expect(first.id > 0).assertTrue()
      expect(second.name).assertEqual("second")
      expect(StaticReadonlyCounter.currentCount()).assertEqual(before + 2)
      expect(StaticReadonlyCounter.VERSION).assertEqual("1.0")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_INHERIT_BASE_00100
     * @tc.name testInheritBaseClass
     * @tc.desc Test scenario for Sendable base class with constructor, methods, and static members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testInheritBaseClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let base: InheritBase = new InheritBase(3)
      expect(base.value).assertEqual(3)
      expect(base.double()).assertEqual(6)
      expect(base.describe()).assertEqual("base")
      expect(InheritBase.kind()).assertEqual("inherit-base")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_INHERIT_DERIVED_00100
     * @tc.name testInheritDerivedClass
     * @tc.desc Test scenario for Sendable derived class with super call and protected members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testInheritDerivedClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let derived: InheritDerived = new InheritDerived(3, "child")
      expect(derived.value).assertEqual(3)
      expect(derived.double()).assertEqual(6)
      expect(derived.describe()).assertEqual("base-derived")
      expect(derived.ownMethod()).assertEqual("child")
      expect(derived.readProtected()).assertEqual("base-code")
      let baseRef: InheritBase = derived
      expect(baseRef.describe()).assertEqual("base-derived")
      expect(derived instanceof InheritBase).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_IA_USER_00100
     * @tc.name testIaUserClass
     * @tc.desc Test scenario for Sendable class implements multiple interfaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIaUserClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let user: IaNamed = new IaUser(1, "alice")
      expect(user.getName()).assertEqual("alice")
      let identified: IaIdentified = new IaUser(2, "bob")
      expect(identified.id).assertEqual(2)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_IA_DOG_00100
     * @tc.name testIaDogClass
     * @tc.desc Test scenario for concrete Sendable subclass implements abstract method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIaDogClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let animal: IaAbstractAnimal = new IaDog("dog")
      expect(animal.describe()).assertEqual("dog:bark")
      expect(animal instanceof IaAbstractAnimal).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_IA_CONCRETESERVICE_00100
     * @tc.name testIaConcreteServiceClass
     * @tc.desc Test scenario for concrete Sendable class extends abstract class implementing interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIaConcreteServiceClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let service: IaAbstractService = new IaConcreteService()
      expect(service.work()).assertEqual("done")
      expect(service.serviceName()).assertEqual("service")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_GEN_BOX_00100
     * @tc.name testGenBoxGenericClass
     * @tc.desc Test scenario for generic Sendable class with get/set methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenBoxGenericClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let numberBox: GenBox<number> = new GenBox<number>(1)
      expect(numberBox.getValue()).assertEqual(1)
      numberBox.setValue(2)
      expect(numberBox.value).assertEqual(2)
      let store: GenStore<string> = new GenBox<string>("stored")
      expect(store.getValue()).assertEqual("stored")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_GEN_PAIR_00100
     * @tc.name testGenPairGenericClass
     * @tc.desc Test scenario for Sendable generic class with multiple type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenPairGenericClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let pair: GenPair<string, number> = new GenPair<string, number>("age", 18)
      expect(pair.key).assertEqual("age")
      expect(pair.value).assertEqual(18)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_GEN_METHODBOX_00100
     * @tc.name testGenMethodBoxGenericClass
     * @tc.desc Test scenario for Sendable generic class with generic method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenMethodBoxGenericClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let methodBox: GenMethodBox<number> = new GenMethodBox<number>(5)
      let wrapped: GenPair<number, string> = methodBox.wrap<string>("five")
      expect(wrapped.key).assertEqual(5)
      expect(wrapped.value).assertEqual("five")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_VISIBILITY_ACCOUNT_00100
     * @tc.name testVisibilityAccountClass
     * @tc.desc Test scenario for Sendable class with public/private/protected visibility modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testVisibilityAccountClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let account: VisibilityAccount = new VisibilityAccount("alice", 100)
      expect(account.owner).assertEqual("alice")
      account.deposit(20)
      expect(account.currentBalance()).assertEqual(120)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_VISIBILITY_VIP_00100
     * @tc.name testVisibilityVipAccountClass
     * @tc.desc Test scenario for Sendable derived class accesses protected members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testVisibilityVipAccountClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let vip: VisibilityVipAccount = new VisibilityVipAccount("bob", 200)
      expect(vip.bonus()).assertEqual(2)
      expect(vip instanceof VisibilityAccount).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_THIS_BASE_00100
     * @tc.name testThisBaseClass
     * @tc.desc Test scenario for Sendable class method returns this for chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testThisBaseClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let base: ThisBase = new ThisBase(1)
      base.add(2)
      expect(base.read()).assertEqual(3)
      expect(base.add(1) === base).assertTrue()
      expect(base.describe()).assertEqual("base")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_THIS_DERIVED_00100
     * @tc.name testThisDerivedClass
     * @tc.desc Test scenario for Sendable derived class with super, this, and static factory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testThisDerivedClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let derived: ThisDerived = new ThisDerived(4, "child")
      derived.addDerived(3).addDerived(2)
      expect(derived.read()).assertEqual(9)
      expect(derived.describe()).assertEqual("base:child")
      let baseRef: ThisBase = derived
      expect(baseRef.describe()).assertEqual("base:child")
      expect(derived instanceof ThisDerived).assertTrue()
      expect(derived instanceof ThisBase).assertTrue()
      let created: ThisDerived = ThisDerived.create("static")
      expect(created.name).assertEqual("static")
      let fromValue: ThisDerived = acceptClassValue("value")
      expect(fromValue.name).assertEqual("value")
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_THIS_HOLDER_00100
     * @tc.name testThisHolderClass
     * @tc.desc Test scenario for Sendable class instance field independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testThisHolderClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      let first: ThisHolder = new ThisHolder(1)
      let second: ThisHolder = new ThisHolder(2)
      first.count = 10
      expect(first.count).assertEqual(10)
      expect(second.count).assertEqual(2)
      done()
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_00100
     * @tc.name testfieldInheritPass001PublicSameTypeExplicitOverride
     * @tc.desc Test scenario for fieldInheritPass001PublicSameTypeExplicitOverride
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass001PublicSameTypeExplicitOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let d: FieldInheritPass001Derived = new FieldInheritPass001Derived()
        expect(runFieldInheritPass001()).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_00200
     * @tc.name testfieldInheritPass002PublicSameTypeImplicitOverride
     * @tc.desc Test scenario for fieldInheritPass002PublicSameTypeImplicitOverride
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass002PublicSameTypeImplicitOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let d: FieldInheritPass002Derived = new FieldInheritPass002Derived()
        expect(runFieldInheritPass002()).assertEqual('derived');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_00300
     * @tc.name testfieldInheritPass003ProtectedSameModifier
     * @tc.desc Test scenario for fieldInheritPass003ProtectedSameModifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass003ProtectedSameModifier', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        expect(new FieldInheritPass003Derived().getField()).assertEqual(4);
        expect(new FieldInheritPass004Derived().field).assertEqual('derived');
        done();
      });


    it('testfieldInheritPass005InterfacePropertySameField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let pass005Value: FieldInheritPass005Interface = new FieldInheritPass005Derived()
        expect(pass005Value.field).assertEqual(6);
        let pass006Value: FieldInheritPass006Interface = new FieldInheritPass006Derived()
        expect(pass006Value.field).assertEqual('base');
        expect(new FieldInheritPass007Derived().field).assertEqual(8);
        done();
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_00800
     * @tc.name testfieldInheritPass008GenericSameSubstitution
     * @tc.desc Test scenario for fieldInheritPass008GenericSameSubstitution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass008GenericSameSubstitution', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let pass008Value: FieldInheritPass008Derived<string> = new FieldInheritPass008Derived<string>('generic')
        expect(pass008Value.field).assertEqual('generic');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_01000
     * @tc.name testfieldInheritPass010UnionExactSameType
     * @tc.desc Test scenario for fieldInheritPass010UnionExactSameType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass010UnionExactSameType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        expect(new FieldInheritPass009Derived().field).assertEqual(10);
        expect(new FieldInheritPass010Derived().field).assertEqual('ten');
        expect(new FieldInheritPass011Leaf().field).assertEqual(13);
        expect(new FieldInheritPass012Class().field).assertEqual(12);
        done();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_01300
     * @tc.name testfieldInheritPass013ReadonlyInterfaceWritableField
     * @tc.desc Test scenario for fieldInheritPass013ReadonlyInterfaceWritableField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass013ReadonlyInterfaceWritableField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let pass013Class: FieldInheritPass013Class = new FieldInheritPass013Class()
        let pass013Interface: FieldInheritPass013Interface = pass013Class
        expect(pass013Interface.field).assertEqual(13);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_01400
     * @tc.name testfieldInheritPass014ReadonlyInterfaceReadonlyField
     * @tc.desc Test scenario for fieldInheritPass014ReadonlyInterfaceReadonlyField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass014ReadonlyInterfaceReadonlyField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let pass014Interface: FieldInheritPass014Interface = new FieldInheritPass014Class()
        expect(pass014Interface.field).assertEqual(14);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_01500
     * @tc.name testfieldInheritPass015GetterOnlyInterfaceImplementedByField
     * @tc.desc Test scenario for fieldInheritPass015GetterOnlyInterfaceImplementedByField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass015GetterOnlyInterfaceImplementedByField',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
        let pass015Class: FieldInheritPass015Class = new FieldInheritPass015Class()
        let pass015Interface: FieldInheritPass015Interface = pass015Class
        expect(pass015Interface.field).assertEqual(15);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_01600
     * @tc.name testfieldInheritPass016SetterOnlyInterfaceImplementedByField
     * @tc.desc Test scenario for fieldInheritPass016SetterOnlyInterfaceImplementedByField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass016SetterOnlyInterfaceImplementedByField',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
        let pass016Class: FieldInheritPass016Class = new FieldInheritPass016Class()
        let pass016Interface: FieldInheritPass016Interface = pass016Class
        expect(pass016Class.field).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_01700
     * @tc.name testfieldInheritPass017OptionalInterfaceDefaultProperty
     * @tc.desc Test scenario for fieldInheritPass017OptionalInterfaceDefaultProperty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass017OptionalInterfaceDefaultProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let pass017Value: FieldInheritPass017Interface = new FieldInheritPass017Class()
        expect(pass017Value.field).assertEqual(17);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_01800
     * @tc.name testfieldInheritPass018OptionalInterfaceFieldImplementation
     * @tc.desc Test scenario for fieldInheritPass018OptionalInterfaceFieldImplementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass018OptionalInterfaceFieldImplementation',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
        let pass018Value: FieldInheritPass018Interface = new FieldInheritPass018Class()
        expect(pass018Value.field).assertEqual(18);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_02000
     * @tc.name testfieldInheritPass020NullableExactSameType
     * @tc.desc Test scenario for fieldInheritPass020NullableExactSameType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass020NullableExactSameType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        expect(new FieldInheritPass020Derived().field).assertEqual('twenty');
        expect(new FieldInheritPass021Derived().field.value).assertEqual('derived');
        expect(new FieldInheritPass022Derived().field[0]).assertEqual('derived');
        expect(new FieldInheritPass023Derived().field[1]).assertEqual('derived');
        done();
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_02600
     * @tc.name testfieldInheritPass026StaticBaseInstanceChildSameName
     * @tc.desc Test scenario for fieldInheritPass026StaticBaseInstanceChildSameName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass026StaticBaseInstanceChildSameName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let pass026Value: FieldInheritPass026Derived = new FieldInheritPass026Derived()
        expect(FieldInheritPass026Base.field).assertEqual(26);
        expect(pass026Value.field).assertEqual(27);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_02700
     * @tc.name testfieldInheritPass027InstanceBaseStaticChildSameName
     * @tc.desc Test scenario for fieldInheritPass027InstanceBaseStaticChildSameName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass027InstanceBaseStaticChildSameName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let pass027Value: FieldInheritPass027Base = new FieldInheritPass027Derived()
        expect(pass027Value.field).assertEqual(27);
        expect(FieldInheritPass027Derived.field).assertEqual(28);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_PASS_02800
     * @tc.name testfieldInheritPass028ExportAbstractFieldChildInstance
     * @tc.desc Test scenario for fieldInheritPass028ExportAbstractFieldChildInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritPass028ExportAbstractFieldChildInstance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let child: FieldInheritPass028Child = new FieldInheritPass028Child()
        expect(child.field).assertEqual(123);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_RT_00100
     * @tc.name testfieldInheritRt001BaseAndDerivedReadConsistency
     * @tc.desc Test scenario for fieldInheritRt001BaseAndDerivedReadConsistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritRt001BaseAndDerivedReadConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let rt001Derived: FieldInheritRt001Derived = new FieldInheritRt001Derived()
        let rt001Base: FieldInheritRt001Base = rt001Derived
        expect(rt001Derived.field).assertEqual('abc');
        expect(rt001Base.field).assertEqual('abc');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_RT_00200
     * @tc.name testfieldInheritRt002WriteThroughBaseReference
     * @tc.desc Test scenario for fieldInheritRt002WriteThroughBaseReference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritRt002WriteThroughBaseReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let rt002Derived: FieldInheritRt002Derived = new FieldInheritRt002Derived()
        let rt002Base: FieldInheritRt002Base = rt002Derived
        expect(rt002Base.field).assertEqual('derived');
        expect(rt002Derived.field).assertEqual('derived');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_RT_00300
     * @tc.name testfieldInheritRt003InterfaceReferenceConsistency
     * @tc.desc Test scenario for fieldInheritRt003InterfaceReferenceConsistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritRt003InterfaceReferenceConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let rt003Derived: FieldInheritRt003Derived = new FieldInheritRt003Derived()
        let rt003Interface: FieldInheritRt003Interface = rt003Derived
        expect(rt003Derived.field).assertEqual('derived');
        expect(rt003Interface.field).assertEqual('derived');
        expect(rt003Derived.field).assertEqual('derived');
        expect(rt003Interface.field).assertEqual('derived');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_RT_00400
     * @tc.name testfieldInheritRt004InitializerOrderFinalValue
     * @tc.desc Test scenario for fieldInheritRt004InitializerOrderFinalValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritRt004InitializerOrderFinalValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let rt004Value: FieldInheritRt004Derived = new FieldInheritRt004Derived()
        expect(FieldInheritRt004Trace.value).assertEqual('BD');
        expect(rt004Value.field).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_RT_00500
     * @tc.name testfieldInheritRt005CastReferenceConsistency
     * @tc.desc Test scenario for fieldInheritRt005CastReferenceConsistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritRt005CastReferenceConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let rt005Base: FieldInheritRt005Base = new FieldInheritRt005Derived()
        let rt005Derived: FieldInheritRt005Derived = rt005Base as FieldInheritRt005Derived
        let rt005Interface: FieldInheritRt005Interface = rt005Derived
        expect(rt005Base.field).assertEqual('derived');
        expect(rt005Derived.field).assertEqual('derived');
        expect(rt005Interface.field).assertEqual('derived');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_FIELD_INHERIT_RT_00600
     * @tc.name testfieldInheritRt006GrandchildOverridesRootField
     * @tc.desc Test scenario for fieldInheritRt006GrandchildOverridesRootField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testfieldInheritRt006GrandchildOverridesRootField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let rt006Leaf: FieldInheritRt006Leaf = new FieldInheritRt006Leaf()
        let rt006Root: FieldInheritRt006Root = rt006Leaf
        expect(rt006Leaf.field).assertEqual('leaf');
        expect(rt006Root.field).assertEqual('leaf');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_OVERRIDE_FIELD_PASS_00100
     * @tc.name testoverrideFieldPass001PublicSameTypeExplicit
     * @tc.desc Test scenario for overrideFieldPass001PublicSameTypeExplicit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testoverrideFieldPass001PublicSameTypeExplicit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let d: OverrideFieldPass001Derived = new OverrideFieldPass001Derived()
        let b: OverrideFieldPass001Base = d
        expect(d.field).assertEqual(2);
        expect(b.field).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_OVERRIDE_FIELD_PASS_00200
     * @tc.name testoverrideFieldPass002PublicSameTypeImplicit
     * @tc.desc Test scenario for overrideFieldPass002PublicSameTypeImplicit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testoverrideFieldPass002PublicSameTypeImplicit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let d: OverrideFieldPass002Derived = new OverrideFieldPass002Derived()
        expect(d.field).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_OVERRIDE_FIELD_PASS_00300
     * @tc.name testoverrideFieldPass003ProtectedSameModifier
     * @tc.desc Test scenario for overrideFieldPass003ProtectedSameModifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testoverrideFieldPass003ProtectedSameModifier', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let d: OverrideFieldPass003Derived = new OverrideFieldPass003Derived()
        expect(d.getField()).assertEqual(30);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_OVERRIDE_FIELD_PASS_00400
     * @tc.name testoverrideFieldPass004ConstructorInitialization
     * @tc.desc Test scenario for overrideFieldPass004ConstructorInitialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testoverrideFieldPass004ConstructorInitialization', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let d: OverrideFieldPass004Derived = new OverrideFieldPass004Derived()
        expect(d.field).assertEqual(40);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_OVERRIDE_FIELD_PASS_00500
     * @tc.name testoverrideFieldPass005MultilevelOverride
     * @tc.desc Test scenario for overrideFieldPass005MultilevelOverride
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testoverrideFieldPass005MultilevelOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let d: OverrideFieldPass005Derived = new OverrideFieldPass005Derived()
        let b: OverrideFieldPass005Base = d
        expect(d.field).assertEqual(500);
        expect(b.field).assertEqual(500);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_OVERRIDE_FIELD_PASS_00600
     * @tc.name testoverrideFieldPass006InterfacePropertySameField
     * @tc.desc Test scenario for overrideFieldPass006InterfacePropertySameField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testoverrideFieldPass006InterfacePropertySameField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let d: OverrideFieldPass006Derived = new OverrideFieldPass006Derived()
        let b: OverrideFieldPass006Base = d
        let i: OverrideFieldPass006I = d
        expect(d.field as string).assertEqual('six');
        expect(b.field as string).assertEqual('six');
        expect(i.field as string).assertEqual('six');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_OVERRIDE_FIELD_RT_00100
     * @tc.name testoverrideFieldRuntime001ReferenceConsistency
     * @tc.desc Test scenario for overrideFieldRuntime001ReferenceConsistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testoverrideFieldRuntime001ReferenceConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let d: OverrideFieldRuntime001Derived = new OverrideFieldRuntime001Derived()
        let b: OverrideFieldRuntime001Base = d
        let i: OverrideFieldRuntime001I = d
        expect(d.field as string).assertEqual('derived');
        expect(b.field as string).assertEqual('derived');
        expect(i.field as string).assertEqual('derived');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_OVERRIDE_FIELD_RT_00200
     * @tc.name testoverrideFieldRuntime002WriteThroughBaseReference
     * @tc.desc Test scenario for overrideFieldRuntime002WriteThroughBaseReference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testoverrideFieldRuntime002WriteThroughBaseReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let d: OverrideFieldRuntime002Derived = new OverrideFieldRuntime002Derived()
        let b: OverrideFieldRuntime002Base = d
        let i: OverrideFieldRuntime002I = d
        expect(i.field as string).assertEqual('initial');
        expect(d.field as string).assertEqual('initial');
        expect(b.field as string).assertEqual('initial');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_OVERRIDE_FIELD_RT_00300
     * @tc.name testoverrideFieldRuntime003InitializerOrder
     * @tc.desc Test scenario for overrideFieldRuntime003InitializerOrder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testoverrideFieldRuntime003InitializerOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        let d: OverrideFieldRuntime003Derived = new OverrideFieldRuntime003Derived()
        expect(OverrideFieldRuntime003Trace.value).assertEqual('BD');
        expect(d.field).assertEqual(30);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_STATIC_INHERIT_PASS_00100
     * @tc.name teststaticPass001BaseStaticMethodAccess
     * @tc.desc Test scenario for staticPass001BaseStaticMethodAccess
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('teststaticPass001BaseStaticMethodAccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        expect(StaticPass001Base.foo()).assertEqual(1);
        expect(StaticPass002Base.value == 2).assertTrue();
        expect(StaticPass003Base.value == 3).assertTrue();
        expect(StaticPass004Base.foo()).assertEqual(1);
        expect(StaticPass004Child.foo("x")).assertEqual(2);
        expect(StaticPass005Child.foo("abc")).assertEqual(3);
        expect(StaticPass006Root.foo()).assertEqual(6);
        let c = new StaticPass007Child()
        expect(c.callBase()).assertEqual(7);
        expect(StaticPass008Child.callBase()).assertEqual(8);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENABLECLASS_STATIC_INHERIT_RT_00100
     * @tc.name teststaticRt001BaseStaticMethodAccess
     * @tc.desc Test scenario for staticRt001BaseStaticMethodAccess
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('teststaticRt001BaseStaticMethodAccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        expect(StaticRt002Child.foo()).assertEqual(1);
        expect(StaticRt002Child.foo('')).assertEqual(2);
        expect(StaticRt003Child.foo()).assertEqual(1);
        expect(StaticRt003Child.callBase()).assertEqual(1);
        expect(StaticRt004Leaf.callRoot()).assertEqual(1);
        expect(StaticPass006Leaf.foo()).assertEqual(6);
        expect(StaticPass001Child.foo()).assertEqual(1);
        expect(StaticPass002Child.value).assertEqual(2);
        done();
      });
  })
}

function usePerson(person: AllPerson): string {
  return person.getName()
}

function createByClassValue(name: string): AllPerson {
  return AllPerson.create(name)
}

function readUserName(user: BasicUser): string {
  return user.name
}

function createUser(name: string): BasicUser {
  return new BasicUser(name, 18)
}

function makeDefaultPoint(): BasicPoint {
  return new BasicPoint(0, 0)
}

function acceptClassValue(name: string): ThisDerived {
  return ThisDerived.create(name)
}