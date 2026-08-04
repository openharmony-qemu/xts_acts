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

export const importedFactoryName: string = 'importedValue'
export const importedFactorySeed: number = 39
export const importedModuleBinding: string = 'moduleBinding'
export const importedLoweringName: string = 'loweringImport'

let importedFactoryKey: string = ''
let importedReturnedKey: string = ''
let importedCaptureKey: string = ''
let importedModuleSideEffectCount: number = 0
let importedModuleInitializerKey: string = ''
let namedExportDecorated: boolean = false
let defaultExportDecorated: boolean = false

export function importedPropertyFactory(expectedKey: string): (target: Object, key: string) => void {
  return (target: Object, key: string): void => {
    if (key === expectedKey) {
      importedFactoryKey = key
    }
  }
}

function createImportedReturnedDecorator(): (target: Object, key: string) => void {
  return (target: Object, key: string): void => {
    importedReturnedKey = key
  }
}

export const importedReturnedDecorator: (target: Object, key: string) => void =
  createImportedReturnedDecorator()

export function importedClosureFactory(): (target: Object, key: string) => void {
  const captured: string = importedModuleBinding
  return (target: Object, key: string): void => {
    importedCaptureKey = captured + ':' + key
  }
}

export function importedSideEffectFactory(expectedKey: string): (target: Object, key: string) => void {
  importedModuleSideEffectCount++
  return (target: Object, key: string): void => {
    if (key === expectedKey) {
      importedModuleInitializerKey = key
    }
  }
}

export function importedLocalInitializerFactory(expectedKey: string): (target: Object, key: string) => void {
  return (target: Object, key: string): void => {
    if (key === expectedKey) {
      importedModuleInitializerKey = key
    }
  }
}

function namedExportClassFactory(): (target: Object) => void {
  return (target: Object): void => {
    namedExportDecorated = true
  }
}

function defaultExportClassFactory(): (target: Object) => void {
  return (target: Object): void => {
    defaultExportDecorated = true
  }
}

@namedExportClassFactory()
export class DecoratorFactoryNamedExportClass {
  public value: number = 97
}

@defaultExportClassFactory()
class DecoratorFactoryDefaultExportClass {
  public value: number = 98
}

export default DecoratorFactoryDefaultExportClass

export function readImportedFactoryKey(): string {
  return importedFactoryKey
}

export function readImportedReturnedKey(): string {
  return importedReturnedKey
}

export function readImportedCaptureKey(): string {
  return importedCaptureKey
}

export function readImportedModuleSideEffectCount(): number {
  return importedModuleSideEffectCount
}

export function readImportedModuleInitializerKey(): string {
  return importedModuleInitializerKey
}

export function readNamedExportDecorated(): boolean {
  return namedExportDecorated
}

export function readDefaultExportDecorated(): boolean {
  return defaultExportDecorated
}

export function readImportedModuleInitOrder(): string {
  return 'moduleReady:' + importedFactoryName
}
