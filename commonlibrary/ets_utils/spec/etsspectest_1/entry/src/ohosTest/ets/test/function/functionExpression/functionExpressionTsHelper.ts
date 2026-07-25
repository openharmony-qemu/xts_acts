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
 * TypeScript helper for function expression tests
 * ECMA-262 §15.2.3 FunctionExpression
 * ArkTS does not support function expressions, object literals, or standalone this.
 */

export function testExpressionCallback(): number {
  function apply(value: number, fn: (x: number) => number): number {
    return fn(value)
  }
  return apply(6, function(x: number): number { return x * x })
}

export function testExpressionAssign(): number {
  let fn = function(a: number, b: number): number {
    return a + b
  }
  return fn(2, 3)
}

export let anonymousFunc: () => void = function(): void {}

export function testNamedRecursive(): number {
  let fact = function factorial(n: number): number {
    if (n <= 1) return 1
    return n * factorial(n - 1)
  }
  return fact(5)
}

export let calculator: { multiply: (a: number, b: number) => number } = {
  multiply: function(a: number, b: number): number {
    return a * b
  }
}

export function testIIFEResult(): number {
  return (function(a: number, b: number): number {
    return a + b
  })(10, 20)
}

function thrower(): number {
  throw new Error('eval fail')
}

export function testEvalThrow(): boolean {
  let f = function(x: number = thrower()): number {
    return x
  }
  let threw: boolean = false
  try {
    f()
  } catch (e) {
    threw = e instanceof Error && e.message === 'eval fail'
  }
  return threw
}

export let objWithThis: { value: number; getValue: () => number } = {
  value: 42,
  getValue: function(): number { return this.value }
}
