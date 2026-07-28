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

export function nullPlusOne() {
  return null + 1
}

export function onePlusNull() {
  return 1 + null
}

export function stringPlusNull() {
  return 'x' + null
}

export function nullPlusString() {
  return null + 'x'
}

export function getNullUserData() {
  return null
}

export function combineWithNull(a) {
  function combine(a, b = 'default') { return a + b }
  return combine(a, null)
}

export function lengthOf(val) {
  if (val === null) { return -1 }
  return val.length
}

export function nullMinusOne() {
  return null - 1
}

export function nullTimesTwo() {
  return null * 2
}

export function nullLessThanOne() {
  return null < 1
}

export function nullGreaterEqualZero() {
  return null >= 0
}
