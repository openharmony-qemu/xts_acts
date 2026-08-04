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

export const importedString: string = 'imported_value'
export const importedConst: string = 'imported_const_value'
export const importedNumber: number = 42
export const importedBoolean: boolean = true

let importedFactoryNoParamsLog: string = ''
let importedFactorySingleParamLog: string = ''
let importedFactoryMultiParamLog: string = ''
let importedFactoryReturnDecoLog: string = ''
let importedFactoryClosureLog: string = ''
let importedNumberParamLog: string = ''
let importedStringParamLog: string = ''
let importedBooleanParamLog: string = ''
let importedClassParamLog: string = ''
let importedFunctionParamLog: string = ''
let importedConstParamLog: string = ''

export class ImportedClass {
  public name: string
  constructor(name: string) {
    this.name = name
  }
}

export function importedFunction(): string {
  return 'imported_function_result'
}

export function importedFactoryNoParams(): (target: object) => void {
  return (target: object): void => {
    importedFactoryNoParamsLog = 'factory_no_params:decorator_applied'
  }
}

export function importedFactorySingleParam(param: string): (target: object) => void {
  importedFactorySingleParamLog = 'factory_single_param:' + param
  return (target: object): void => {
    importedFactorySingleParamLog += ':decorator_applied'
  }
}

export function importedFactoryMultiParam(a: string, b: number): (target: object) => void {
  importedFactoryMultiParamLog = 'factory_multi_param:' + a + ':' + b.toString()
  return (target: object): void => {
    importedFactoryMultiParamLog += ':decorator_applied'
  }
}

export function importedFactoryReturnDeco(): (target: object) => void {
  importedFactoryReturnDecoLog = 'factory_return_deco'
  return (target: object): void => {
    importedFactoryReturnDecoLog += ':decorator_applied'
  }
}

export function importedFactoryClosure(value: string): (target: object) => void {
  importedFactoryClosureLog = 'factory_closure:' + value
  return (target: object): void => {
    importedFactoryClosureLog += ':decorator_applied'
  }
}

export function importedNumberParamFactory(value: number): (target: object) => void {
  return (target: object): void => {
    importedNumberParamLog = 'imported_number:' + value.toString()
  }
}

export function importedStringParamFactory(value: string): (target: object) => void {
  return (target: object): void => {
    importedStringParamLog = 'imported_string:' + value
  }
}

export function importedBooleanParamFactory(value: boolean): (target: object) => void {
  return (target: object): void => {
    importedBooleanParamLog = 'imported_boolean:' + value.toString()
  }
}

export function importedClassParamFactory(value: ImportedClass): (target: object) => void {
  return (target: object): void => {
    importedClassParamLog = 'imported_class:' + value.name
  }
}

export function importedFunctionParamFactory(callback: () => string): (target: object) => void {
  return (target: object): void => {
    importedFunctionParamLog = 'imported_function:' + callback()
  }
}

export function importedConstParamFactory(value: string): (target: object) => void {
  return (target: object): void => {
    importedConstParamLog = 'imported_const:' + value
  }
}

export function verifyRefImportedString(): string {
  return importedStringParamLog
}

export function verifyRefImportedNumber(): number {
  if (importedNumberParamLog == 'imported_number:42') {
    return importedNumber
  }
  return -1
}

export function verifyRefImportedBoolean(): boolean {
  return importedBooleanParamLog == 'imported_boolean:true'
}

export function verifyCreateImportedClass(): string {
  return importedClassParamLog
}

export function verifyCallImportedFunction(): string {
  return importedFunctionParamLog
}

export function verifyRefImportedConst(): string {
  return importedConstParamLog
}

export function verifyImportedFactoryNoParams(): string {
  return importedFactoryNoParamsLog
}

export function verifyImportedFactorySingleParam(): string {
  return importedFactorySingleParamLog
}

export function verifyImportedFactoryMultiParam(): string {
  return importedFactoryMultiParamLog
}

export function verifyImportedFactoryReturnDeco(): string {
  return importedFactoryReturnDecoLog
}

export function verifyImportedFactoryClosure(): string {
  return importedFactoryClosureLog
}
