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

/*
 * Sendable装饰器模型类
 * 从TS风格装饰器示例中提取，并为每个class添加@Sendable装饰器
 */

// ==================== 类装饰器 ====================
function print(msg: string) {
  console.log(msg)
}

function classDecBasic(target: Object): void {
  print("class decorator basic")
}

@Sendable
@classDecBasic
export class SendableClassDecoratorBasic {
  value: number = 1
}

function classDecFactory(name: string) {
  return (target: Object): void => {
    print("class factory: " + name)
  }
}

@Sendable
@classDecFactory("Demo")
export class SendableClassDecoratorFactory {
  value: number = 2
}

function classDecConstructor(target: Object): void {
  print("class decorator with constructor")
}

@Sendable
@classDecConstructor
export class SendableClassDecoratorConstructor {
  value: number

  constructor(value: number) {
    this.value = value
  }
}

function classDecA(target: Object): void {
  print("A")
}

function classDecB(target: Object): void {
  print("B")
}

@Sendable
@classDecA
@classDecB
export class SendableMultipleClassDecorators {
  value: number = 3
}

// ==================== 属性装饰器 ====================

function propDecBasic(target: Object, key: string): void {
  print("decorate property: " + key)
}

@Sendable
export class SendablePropertyDecoratorBasic {
  @propDecBasic
  value: number = 1
}

function propDecStatic(target: Object, key: string): void {
  print("decorate static property: " + key)
}

@Sendable
export class SendableStaticPropertyDecorator {
  @propDecStatic
  static value: number = 2
}

function propDecFactory(name: string) {
  return (target: Object, key: string): void => {
    print(name + ":" + key)
  }
}

@Sendable
export class SendablePropertyDecoratorFactory {
  @propDecFactory("field")
  value: number = 3
}

function propDecA(target: Object, key: string): void {
  print("A:" + key)
}

function propDecB(target: Object, key: string): void {
  print("B:" + key)
}

@Sendable
export class SendableMultiplePropertyDecorators {
  @propDecA
  @propDecB
  value: number = 6
}

function propDecFieldInit(target: Object, key: string): void {
  print("decorate " + key)
}

@Sendable
export class SendablePropertyDecoratorFieldInit {
  @propDecFieldInit
  value: number = 10 + 5
}

function getName(): string {
  return "demo"
}

function propDecFactoryMultiParam(name: string) {
  return (target: Object, key: string): void => {
    print(name + ":" + key)
  }
}

@Sendable
export class SendablePropertyDecoratorFactoryParam {
  @propDecFactoryMultiParam("literal")
  a: number = 1
  @propDecFactoryMultiParam(getName())
  b: number = 2
  @propDecFactoryMultiParam(((): string => {
    return "iife"
  })())
  c: number = 3
}

// ==================== 方法装饰器 ====================

function methodDecBasic(target: Object, key: string): void {
  print("decorate method: " + key)
}

@Sendable
export class SendableMethodDecoratorBasic {
  @methodDecBasic
  add(a: number, b: number): number {
    return a + b
  }
}

function methodDecStatic(target: Object, key: string): void {
  print("decorate static method: " + key)
}

@Sendable
export class SendableStaticMethodDecorator {
  @methodDecStatic
  static version(): number {
    return 1
  }
}

function methodDecFactory(name: string) {
  return (target: Object, key: string): void => {
    print(name + ":" + key)
  }
}

@Sendable
export class SendableMethodDecoratorFactory {
  @methodDecFactory("method")
  value(): number {
    return 3
  }
}

function methodDecInherit(target: Object, key: string): void {
  print("decorate " + key)
}

@Sendable
export class SendableMethodDecoratorBase {
  @methodDecInherit
  value(): number {
    return 5
  }
}

@Sendable
export class SendableMethodDecoratorDerived extends SendableMethodDecoratorBase {}

function methodDecA(target: Object, key: string): void {
  print("A:" + key)
}

function methodDecB(target: Object, key: string): void {
  print("B:" + key)
}

@Sendable
export class SendableMultipleMethodDecorators {
  @methodDecA
  @methodDecB
  value(): number {
    return 4
  }
}

// ==================== 装饰器工厂 ====================

function decFactoryNoParam() {
  return (target: Object, key: string): void => {
    print("decorate " + key)
  }
}

@Sendable
export class SendableDecoratorFactoryNoParam {
  @decFactoryNoParam()
  value: number = 1
}

function decFactorySingleParam(name: string) {
  return (target: Object, key: string): void => {
    print(name + ":" + key)
  }
}

@Sendable
export class SendableDecoratorFactorySingleParam {
  @decFactorySingleParam("one")
  value: number = 2
}

function decFactoryMultiParam(name: string, id: number, enabled: boolean) {
  return (target: Object, key: string): void => {
    if (enabled) {
      print(name + id.toString() + key)
    }
  }
}

@Sendable
export class SendableDecoratorFactoryMultiParam {
  @decFactoryMultiParam("multi", 3, true)
  value: number = 3
}

function prefix(): string {
  return "nested"
}

function nameOf(v: string): string {
  return v + "Name"
}

function decFactoryNested(name: string) {
  return (target: Object, key: string): void => {
    print(name + ":" + key)
  }
}

@Sendable
export class SendableDecoratorFactoryNested {
  @decFactoryNested(nameOf(prefix()))
  value: number = 6
}

function decFactoryIIFE(name: string) {
  return (target: Object, key: string): void => {
    print(name + ":" + key)
  }
}

@Sendable
export class SendableDecoratorFactoryIIFE {
  @decFactoryIIFE(((): string => {
    return "iife"
  })())
  value: number = 4
}

function decFactoryArrow(cb: () => string) {
  let name: string = cb()
  return (target: Object, key: string): void => {
    print(name + ":" + key)
  }
}

@Sendable
export class SendableDecoratorFactoryArrow {
  @decFactoryArrow((): string => "arrow")
  value: number = 5
}

// ==================== 执行顺序 ====================

let count: number = 0

function classDecOrder(target: Object): void {
  count++
}

function propDecOrder(target: Object, key: string): void {
  count++
}

function methodDecOrder(target: Object, key: string): void {
  count++
}

@Sendable
@classDecOrder
export class SendableDecoratorOrderMixed {
  @propDecOrder
  value: number = 4

  @methodDecOrder
  getValue(): number {
    return this.value
  }
}

let order: string = ""

function propDecOrderA(target: Object, key: string): void {
  order += "A"
}

function propDecOrderB(target: Object, key: string): void {
  order += "B"
}

@Sendable
export class SendableDecoratorOrderMultiple {
  @propDecOrderA
  @propDecOrderB
  value: number = 2
}

function factoryOrder(name: string) {
  order += "F" + name
  return (target: Object, key: string): void => {
    order += "D" + name
  }
}

@Sendable
export class SendableDecoratorOrderFactory {
  @factoryOrder("A")
  @factoryOrder("B")
  value: number = 3
}

function decFactoryBefore() {
  order += "F"
  return (target: Object, key: string): void => {
    order += "D"
  }
}

@Sendable
export class SendableDecoratorOrderBefore {
  @decFactoryBefore()
  value: number = 1
}

// ==================== 类特性组合 ====================

function propDecInherit(target: Object, key: string): void {
  print(key)
}

@Sendable
export class SendablePropertyDecoratorInheritBase {
  @propDecInherit
  value: number = 6
}

@Sendable
export class SendablePropertyDecoratorInheritDerived extends SendablePropertyDecoratorInheritBase {}

function methodDecInheritCombo(target: Object, key: string): void {
  print(key)
}

@Sendable
export class SendableMethodDecoratorInheritBase {
  @methodDecInheritCombo
  value(): number {
    return 7
  }
}

@Sendable
export class SendableMethodDecoratorInheritDerived extends SendableMethodDecoratorInheritBase {}

function classDecCombo(target: Object): void {
  print("class")
}

@Sendable
@classDecCombo
export class SendableClassDecoratorCombo {
  value: number

  constructor(value: number) {
    this.value = value
  }
}

function propDecFieldInitCombo(target: Object, key: string): void {
  print(key)
}

@Sendable
export class SendableFieldInitDecoratorCombo {
  @propDecFieldInitCombo
  value: number = 2 + 3
}

function methodDecStaticCombo(target: Object, key: string): void {
  print("static method " + key)
}

@Sendable
export class SendableStaticMethodDecoratorCombo {
  @methodDecStaticCombo
  static value(): number {
    return 2
  }
}

function propDecStaticCombo(target: Object, key: string): void {
  print("static prop " + key)
}

@Sendable
export class SendableStaticPropertyDecoratorCombo {
  @propDecStaticCombo
  static value: number = 1
}

function propDecReadonly(target: Object, key: string): void {
  print("readonly " + key)
}

@Sendable
export class SendableReadonlyPropertyDecorator {
  @propDecReadonly
  readonly value: number = 3
}

// ==================== 装饰器目标总览 ====================

function classDecOverview(target: Object): void {
  print("class decorator")
}

function propDecOverview(target: Object, key: string): void {
  print("property decorator: " + key)
}

function methodDecOverview(target: Object, key: string): void {
  print("method decorator: " + key)
}

function factoryDecOverview(name: string) {
  return (target: Object, key: string): void => {
    print("factory decorator: " + name + ", key=" + key)
  }
}

@Sendable
@classDecOverview
export class SendableDecoratorOverview {
  @propDecOverview
  value: number = 1

  @methodDecOverview
  getValue(): number {
    return this.value
  }

  @factoryDecOverview("factory")
  other: number = 2
}

// ==================== Sendable特有场景 ====================

function decoratorFactorySendable() {
  return (target: Object, key: string): void => {
    print(key)
  }
}

@Sendable
export class SendablePropertyDecoratorFactorySendable {
  constructor() {
    "use sendable"
  }

  @decoratorFactorySendable()
  prop: string = "222"
}

function propDecSendableBasic(target: Object, key: string): void {
  print(key)
}

@Sendable
export class SendablePropertyDecoratorBasicSendable {
  constructor() {
    "use sendable"
  }

  @propDecSendableBasic
  prop: string = "111"
}

let localVar: string = "local"

function decoratorFactoryLocalBinding(v: string) {
  return (target: Object, key: string): void => {
    print(key + v)
  }
}

@Sendable
export class SendablePropertyDecoratorLocalBinding {
  constructor() {
    "use sendable"
  }

  @decoratorFactoryLocalBinding(((): string => {
    return localVar
  })())
  prop: string = "111"
}

// ==================== 导出类装饰器 ====================

function classDecExport(target: Object): void {
  print("export decorated class")
}

@Sendable
@classDecExport
export class SendableExportedDecoratedClass {
  value: number = 5
}