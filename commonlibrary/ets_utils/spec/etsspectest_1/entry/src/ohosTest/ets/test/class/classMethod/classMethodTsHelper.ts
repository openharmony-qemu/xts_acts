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

export function getBigintMethodResult(): string {

  function getBigint(): any {
    return 100n
  }

  let v: any = getBigint()
  return v.toString()
}

/*
 * Computed method name test
 * Computed property names and `as any` are not supported in ArkTS
 */
const methodPrefix: string = "get"
const methodSuffix: string = "Name"

class ComputedMethodClass {
  [methodPrefix + methodSuffix](): string {
    return "computed-method"
  }

  ["calc" + "Area"](w: number, h: number): number {
    return w * h
  }
}

export function testComputedMethodString(): string {
  let obj = new ComputedMethodClass()
  return obj["calc" + "Area"](3, 4).toString()
}

export function testComputedMethodCall(): string {
  let obj = new ComputedMethodClass()
  return obj["get" + "Name"]()
}

/*
 * Generator method test â€?generators not supported in ArkTS
 */
class NumberGen {
  * countUp(limit: number): IterableIterator<number> {
    for (let i: number = 1; i <= limit; i++) {
      yield i
    }
  }
}

export function testGeneratorValues(): string {
  let gen = new NumberGen()
  let iter = gen.countUp(3)
  let result: string = ""
  let next = iter.next()
  while (!next.done) {
    result = result + String(next.value)
    next = iter.next()
  }
  return result
}

/*
 * Static method with computed property name
 * Computed property names not supported in ArkTS
 */
class StaticComputedMethod {
  static ["get" + "Status"](): string {
    return "active"
  }

  static ["calc" + "Value"](n: number): number {
    return n * 2
  }
}

export function testStaticComputedGetStatus(): string {
  return (StaticComputedMethod as any)["get" + "Status"]()
}

export function testStaticComputedCalcValue(): number {
  return (StaticComputedMethod as any)["calc" + "Value"](3)
}

/*
 * Async generator method â€?not supported in ArkTS
 */
class AsyncNumberGen {
  async * countUp(limit: number): AsyncIterableIterator<number> {
    for (let i: number = 1; i <= limit; i++) {
      yield i
    }
  }
}

export async function testAsyncGeneratorValues(): Promise<string> {
  let gen = new AsyncNumberGen()
  let iter = gen.countUp(3)
  let result: string = ""
  for await (let n of iter) {
    result = result + String(n)
  }
  return result
}
