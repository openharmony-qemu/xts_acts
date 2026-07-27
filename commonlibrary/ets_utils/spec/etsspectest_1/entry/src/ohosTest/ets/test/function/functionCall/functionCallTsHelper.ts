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
 * TypeScript helper for function call tests
 * ECMA-262 §13.3.6.2 EvaluateCall, §20.2.4 Function.prototype methods
 * ArkTS limitations: no func expressions, no untyped obj literals,
 * no standalone this, no nested funcs, no any/unknown, no call/apply/bind
 */

export function testMethodCallThis(): number {
  let calculator = {
    value: 10,
    getValue: function(): number { return this.value }
  }
  return calculator.getValue()
}

export function testCallChangeThis(): string {
  let obj = { value: "from-obj" }
  function getValue(this: any): string {
    return this.value
  }
  return getValue.call(obj)
}

export function testApplyPassArgs(): number {
  function sum(a: number, b: number): number {
    return a + b
  }
  return sum.apply(null, [3, 4])
}

export function testBindFixedThis(): string {
  let obj = { label: "bound" }
  function getLabel(this: any): string {
    return this.label
  }
  let bound = getLabel.bind(obj)
  return bound()
}

export function testBindPartialArgs(): number {
  function addFn(a: number, b: number): number {
    return a + b
  }
  let add5 = addFn.bind(null, 5)
  return add5(3)
}

export function testExtractMethodThis(): (() => number | undefined) | undefined {
  let obj = {
    value: 42,
    method: function(): number { return this.value }
  }
  let fn = obj.method
  return fn
}
