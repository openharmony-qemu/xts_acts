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

interface Named {
  getName(): string
}

interface HasAge {
  age: number
}

interface Extended extends Named, HasAge {
  getLabel(): string
}

export function testMethodShorthand(): string {
  let obj: Named = {
    getName(): string {
      return "shorthand"
    }
  }
  return obj.getName()
}

export function testNestedLiteral(): string {
  let obj: Extended = {
    getName(): string {
      return "nested-name"
    },
    age: 25,
    getLabel(): string {
      return "nested-label"
    }
  }
  return obj.getName() + "|" + String(obj.age) + "|" + obj.getLabel()
}
