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
 * JavaScript helper for OptionalChaining tests
 * ECMA-262 OptionalChain §13.3.9
 * ArkTS: no null assignment narrowing, no indexed access on nullable, no nested functions, no inline obj types
 */

export function getNullBoxValue() {
  let obj = null
  return obj?.value
}

export function getNullGreeterGreet() {
  let g = null
  return g?.greet()
}

export function getNullArrayFirst() {
  let a = null
  return a?.[0]
}

export function getNullComputedProp() {
  let obj = null
  return obj?.['prop']
}

export function getNullOptionalCall() {
  let fn = null
  return fn?.()
}

export function getNullPropWithCoalescing() {
  let obj = null
  return obj?.x ?? 42
}

let computedKeyCallCount = 0

export function getNullComputedPropWithCounter() {
  computedKeyCallCount = 0
  let obj = null
  let result = obj?.[computedKeyCallCount++]
  return { result, count: computedKeyCallCount }
}

export function getNonNullComputedPropWithCounter() {
  computedKeyCallCount = 0
  let obj = [42]
  let result = obj?.[computedKeyCallCount++]
  return { result, count: computedKeyCallCount }
}

let optionalCallArgCount = 0

export function getNullOptionalCallWithCounter() {
  optionalCallArgCount = 0
  let fn = null
  let result = fn?.(optionalCallArgCount++)
  return { result, count: optionalCallArgCount }
}

export function getNonNullOptionalCallWithCounter() {
  optionalCallArgCount = 0
  function fn(x) { return x }
  let result = fn?.(optionalCallArgCount++)
  return { result, count: optionalCallArgCount }
}

let keyFnCount = 0

function keyFn() { keyFnCount++; return 'x' }

export function getKeyedValueOnNull() {
  keyFnCount = 0
  let obj = null
  let result = obj?.[keyFn()]
  return { result, count: keyFnCount }
}

export function getKeyedValueOnNonNull() {
  keyFnCount = 0
  let obj = { x: 42 }
  let result = obj?.[keyFn()]
  return { result, count: keyFnCount }
}

export function getMidNullValue() {
  class MidNull { next = null }
  let a = new MidNull()
  return a?.next?.x
}

export function getGetterNullValue() {
  class GetterNull { get child() { return null } }
  let g = new GetterNull()
  return g?.child?.value
}



let shortCircuitCallCount = 0

export function getShortCircuitResult() {
  shortCircuitCallCount = 0
  let obj = null
  // chain members should NOT be evaluated when base is null
  let result = obj?.nested?.[shortCircuitCallCount++]
  return { result, count: shortCircuitCallCount }
}

export function getNonShortCircuitResult() {
  shortCircuitCallCount = 0
  let obj = { nested: [99] }
  // chain members SHOULD be evaluated when base is non-null
  let result = obj?.nested?.[shortCircuitCallCount++]
  return { result, count: shortCircuitCallCount }
}
