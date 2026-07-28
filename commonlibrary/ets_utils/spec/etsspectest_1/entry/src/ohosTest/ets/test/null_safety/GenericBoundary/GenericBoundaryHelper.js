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

/*
 * JavaScript helper for GenericBoundary tests
 * P0.5: obj[key()] ??= rhs() — 需要 getter/setter/key/RHS 计数
 */

let _getterCount = 0
let _setterCount = 0
let _keyCount = 0
let _rhsCount = 0

function keyFn() { _keyCount++; return 'x' }
function rhsFn() { _rhsCount++; return 42 }

const _target = {
  _val: null,
  get x() { _getterCount++; return this._val },
  set x(v) { _setterCount++; this._val = v }
}

export function testNullishAssignLhsNull() {
  _getterCount = 0; _setterCount = 0; _keyCount = 0; _rhsCount = 0
  _target._val = null
  _target[keyFn()] ??= rhsFn()
  return {
    value: _target._val,
    keyCount: _keyCount,
    getterCount: _getterCount,
    setterCount: _setterCount,
    rhsCount: _rhsCount
  }
}

export function testNullishAssignLhsNonNull() {
  _getterCount = 0; _setterCount = 0; _keyCount = 0; _rhsCount = 0
  _target._val = 10
  _target[keyFn()] ??= rhsFn()
  return {
    value: _target._val,
    keyCount: _keyCount,
    getterCount: _getterCount,
    setterCount: _setterCount,
    rhsCount: _rhsCount
  }
}
