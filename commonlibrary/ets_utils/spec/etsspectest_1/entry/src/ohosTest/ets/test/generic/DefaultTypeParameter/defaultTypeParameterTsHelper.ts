/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Default Type Parameter (.ts helper)
 * Only keep syntax here that ArkTS static compiler cannot accept.
 * Re-verify each export on TypeScript Playground before device runs.
 */

export interface Box<T = string> {
  value: T
}

/** GTP-DE-001 / DE-004: function default type parameter */
export function wrapWithDefault<T = string>(value: T): Box<T> {
  return { value: value }
}

/** GTP-DE-001 / DE-009 helper: empty array with default T=string */
export function makeEmpty<T = string>(): T[] {
  return []
}

/**
 * GTP-DE-009: inference vs default.
 * With value -> infer; without value -> default string fallback.
 */
export function echoOrDefault<T = string>(value?: T): T {
  if (value !== undefined) {
    return value
  }
  return 'fallback' as T
}

/** GTP-DE-005: trailing optional type parameter U = string */
export function pairOmitTail<T, U = string>(first: T, second?: U): string {
  let tail: U
  if (second !== undefined) {
    tail = second
  } else {
    tail = ('tail' as U)
  }
  return `${first}:${tail}`
}

/**
 * GTP-DE-003 / DE-004: class default type parameter.
 */
export class MyBox<T = number> {
  public value: T

  public constructor(value: T) {
    this.value = value
  }
}

export function buildBoxDefault(): MyBox {
  return new MyBox(7)
}

export function buildBoxExplicit(): MyBox<string> {
  return new MyBox<string>('explicit')
}

/** GTP-DE-007: default type satisfies class constraint */
export class IdHolderImpl {
  public id: number

  public constructor(id: number = 0) {
    this.id = id
  }
}

export function readDefaultConstrained<T extends IdHolderImpl = IdHolderImpl>(value?: T): number {
  if (value !== undefined) {
    return value.id
  }
  return new IdHolderImpl(0).id
}
