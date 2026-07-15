/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export const reExportConstValue: number = 42

export class ReExportClass {
  public readonly name: string = 'ReExportClass'
  public value: string = ''
  constructor(value: string) {
    this.value = value
  }
}

export function reExportFunction(a: number, b: number): number {
  return a + b
}

export type ReExportType = number | string

class ReExportDefaultClass {
  public readonly name: string = 'ReExportDefaultClass'
  public value: string = ''
  constructor(value: string) {
    this.value = value
  }
}
export default ReExportDefaultClass
