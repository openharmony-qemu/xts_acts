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
 * TypeScript helper for return type tests
 * ECMA-262 §14.2 — return and throw semantics
 */

export function testNoReturnIsUndefined(): boolean {
  function f(): void {}
  return f() === undefined
}

export function testEarlyExitWithSideEffect(): boolean {
  let sideEffectHappened: boolean = false
  function f(): number {
    return 1
    sideEffectHappened = true
  }
  let result = f()
  return result === 1 && sideEffectHappened === false
}

export function throwWithMessage(): number {
  throw new Error('stop')
}

export function testThrowTypeAndMessage(): boolean {
  try {
    throwWithMessage()
  } catch (e) {
    return e instanceof Error && e.message === 'stop'
  }
  return false
}

export function returnASITest(): undefined {
  return
  5
}

export function* testGeneratorReturn(): IterableIterator<number> {
  yield 1
  yield 2
  return 3
}
