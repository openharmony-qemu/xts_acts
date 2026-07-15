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

class BaseWithRequiredParam {
  value: number

  constructor(v: number) {
    this.value = v
  }
}

class ChildNoCtorDefault extends BaseWithRequiredParam {
}

export function testDefaultDerivedCtorPassthrough(): number {
  let obj = new ChildNoCtorDefault(42)
  return obj.value
}

/*
 * ECMA-262 §10.2.2 [[Construct]] + SuperCall: new.target propagates through inheritance chain
 * new.target always points to the constructor directly invoked by new, even inside super()
 */

class NewTargetBase {
  captured: any

  constructor() {
    this.captured = new.target
  }
}

class NewTargetChild extends NewTargetBase {
  constructor() {
    super()
  }
}

export function testNewTargetPropagation(): string {
  let obj = new NewTargetChild()
  if (obj.captured === NewTargetChild) {
    return 'child'
  }
  return 'base'
}
