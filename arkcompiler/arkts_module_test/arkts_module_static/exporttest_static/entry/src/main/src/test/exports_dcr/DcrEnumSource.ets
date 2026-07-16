'use static'
/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the License);
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an AS IS BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

export enum DcrStatus {
  Active = 'ACTIVE',
  Inactive = 'INACTIVE',
  Pending = 'PENDING'
}

export const DCR_CONST_VALUE: int = 100

export class DcrExportedClass {
  public readonly name: string = 'DcrExportedClass'
  public value: int = 0
  constructor(v?: int) {
    if (v !== undefined) {
      this.value = v
    }
  }
}

export interface DcrExportedInterface {
  status: string
  value: number
}
