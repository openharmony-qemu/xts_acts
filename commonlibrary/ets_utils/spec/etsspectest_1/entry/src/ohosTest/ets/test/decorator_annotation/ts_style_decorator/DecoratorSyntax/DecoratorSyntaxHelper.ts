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

interface Decorated {
  decorated: boolean
}

interface FactoryDecorated {
  factoryDecorated: boolean
}

interface FactoryArg {
  factoryArg: string | number
}

interface FactoryArgs {
  factoryArgs: string
}

interface FactoryAnyArg {
  factoryAnyArg: Object
}

interface PropertyDecoratorCall {
  target: Object
  propertyKey: string
}

const propertyDecoratorCalls: PropertyDecoratorCall[] = []

export function classDecorator(target: Function): void {
  Object.defineProperty(target.prototype, 'decorated', { value: true })
}

export function propertyDecorator(target: Object, propertyKey: string, descriptor?: PropertyDescriptor): void {
  propertyDecoratorCalls.push({ target, propertyKey })
  Object.defineProperty(target, propertyKey, { value: 42, writable: true })
}

export function getPropertyDecoratorCallCount(): number {
  return propertyDecoratorCalls.length
}

export function verifyPropertyDecoratorCalledOnClass(constructor: Function, propertyKey: string): boolean {
  const proto: Object = constructor.prototype
  return propertyDecoratorCalls.some(call => call.target === proto && call.propertyKey === propertyKey)
}

export function resetPropertyDecoratorCalls(): void {
  propertyDecoratorCalls.length = 0
}

export function methodDecorator(target: Object, propertyKey: string, descriptor: PropertyDescriptor): void {
  const original = descriptor.value as (...args: Object[]) => string
  descriptor.value = function(this: Object, ...args: Object[]): string {
    return original.apply(this, args) + ' decorated'
  }
}

export function decoratorFactory(): (target: Function) => void {
  return (target: Function): void => {
    Object.defineProperty(target.prototype, 'factoryDecorated', { value: true })
  }
}

export function decoratorFactoryWithArg(arg: string | number): (target: Function) => void {
  return (target: Function): void => {
    Object.defineProperty(target.prototype, 'factoryArg', { value: arg })
  }
}

export function decoratorFactoryWithMultiArgs(
  arg1: string | number,
  arg2: string | number
): (target: Function) => void {
  return (target: Function): void => {
    Object.defineProperty(target.prototype, 'factoryArgs', { value: `${arg1}-${arg2}` })
  }
}

export function decoratorFactoryWithAnyArg(arg: Object): (target: Function) => void {
  return (target: Function): void => {
    Object.defineProperty(target.prototype, 'factoryAnyArg', { value: arg })
  }
}

export function namedFunction(): string {
  return 'normal'
}

export function getDecorated(obj: Object): boolean {
  const marker = obj as Decorated
  return marker.decorated === true
}

export function getFactoryDecorated(obj: Object): boolean {
  const marker = obj as FactoryDecorated
  return marker.factoryDecorated === true
}

export function getFactoryArg(obj: Object): string | number {
  const marker = obj as FactoryArg
  return marker.factoryArg
}

export function getFactoryArgs(obj: Object): string {
  const marker = obj as FactoryArgs
  return marker.factoryArgs
}

export function getFactoryAnyArg(obj: Object): Object {
  const marker = obj as FactoryAnyArg
  return marker.factoryAnyArg
}

export function getFactoryAnyArgAsFunction(obj: Object): Function {
  const marker = obj as FactoryAnyArg
  return marker.factoryAnyArg as Function
}

@classDecorator
export class ExportedClassWithDecorator {
  public value: number = 11
}

@classDecorator
export default class DefaultExportedClassWithDecorator {
  public value: number = 12
}
