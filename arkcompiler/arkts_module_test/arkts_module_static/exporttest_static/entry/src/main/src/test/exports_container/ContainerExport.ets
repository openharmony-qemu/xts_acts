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

export let fixedArr: FixedArray<int> = [1, 2, 3] as FixedArray<int>

export let charValue: char = c'a'

export class SetHolder {
  public set: Set<string>
  constructor() {
    this.set = new Set<string>()
    this.set.add('key1')
  }
  has(key: string): boolean {
    return this.set.has(key)
  }
}

export type FuncType = (x: int) => int

export type NumOrNull = number | null
