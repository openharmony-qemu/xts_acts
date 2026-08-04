/*
 * TypeScript helper for generic type inference tests
 * ArkTS does not support generic type parameter inference
 * Use this helper to test type inference behavior
 */

export function testSingleParamInferenceNumber(): number {

  function identity<T>(value: T): T {
    return value
  }

  return identity(42)
}

export function testSingleParamInferenceString(): string {
  function identity<T>(value: T): T {
    return value
  }

  return identity('hello')
}

export function testMultiParamInferenceKey(): string {
  class Pair<K, V> {
    key: K
    value: V

    constructor(key: K, value: V) {
      this.key = key
      this.value = value
    }
  }

  function makePair<K, V>(key: K, value: V): Pair<K, V> {
    return new Pair(key, value)
  }

  return makePair('age', 30).key
}

export function testMultiParamInferenceValue(): number {
  class Pair<K, V> {
    key: K
    value: V

    constructor(key: K, value: V) {
      this.key = key
      this.value = value
    }
  }

  function makePair<K, V>(key: K, value: V): Pair<K, V> {
    return new Pair(key, value)
  }

  return makePair('age', 30).value
}

export function testConstructorInferenceExplicit(): number {
  class Box<T> {
    value: T

    constructor(value: T) {
      this.value = value
    }
  }

  let box: Box<number> = new Box(42)
  return box.value
}

export function testConstructorInferenceInferred(): number {
  class Box<T> {
    value: T

    constructor(value: T) {
      this.value = value
    }
  }

  let box = new Box(42)
  return box.value
}

export function testMethodInference(): string {
  class Service {
    echo<T>(value: T): T {
      return value
    }
  }

  let service = new Service()
  return service.echo('test')
}

export function testLiteralWideningNumber(): number {
  function identity<T>(value: T): T {
    return value
  }

  let widened: number = identity(42)
  return widened
}

export function testLiteralWideningString(): string {
  function identity<T>(value: T): T {
    return value
  }

  let widened: string = identity('literal')
  return widened
}

export function testArrayElementInferenceNumber(): number {

  function first<T>(arr: T[]): T {
    return arr[0]
  }

  return first([1, 2, 3])
}

export function testArrayElementInferenceString(): string {

  function first<T>(arr: T[]): T {
    return arr[0]
  }

  return first(['a', 'b', 'c'])
}

export function testNestedInference(): number {
  class Box<T> {
    value: T

    constructor(value: T) {
      this.value = value
    }
  }

  function unwrap<T>(box: Box<T>): T {
    return box.value
  }

  let box = new Box(42)
  return unwrap(box)
}

export function testCallbackContextualInferenceString(): string {

  function apply<T, R>(v: T, fn: (x: T) => R): R {
    return fn(v)
  }

  return apply(42, (x) => x.toString())
}

export function testCallbackContextualInferenceNumber(): number {

  function apply<T, R>(v: T, fn: (x: T) => R): R {
    return fn(v)
  }

  return apply(10, (x) => x * 2)
}

export function testConstraintSubtypeInferenceId(): number {
  interface HasId {
    id: number
  }

  class EntityWithName implements HasId {
    id: number
    name: string

    constructor(id: number, name: string) {
      this.id = id
      this.name = name
    }
  }

  function getId<T extends HasId>(v: T): number {
    return v.id
  }

  return getId(new EntityWithName(1, 'test'))
}

export function testConstraintSubtypeInferenceName(): string {
  interface HasId {
    id: number
  }

  class EntityWithName implements HasId {
    id: number
    name: string

    constructor(id: number, name: string) {
      this.id = id
      this.name = name
    }
  }

  function process<T extends HasId>(v: T): T {
    return v
  }

  let entity = process(new EntityWithName(1, 'test'))
  return entity.name
}

export function testConflictingCandidateInferenceNumber(): number {

  function pick<T>(a: T, b: T): T {
    return a
  }

  return pick(42, 1)
}

export function testConflictingCandidateInferenceString(): string {

  function pick<T>(a: T, b: T): T {
    return a
  }

  return pick('a', 'b')
}

export function testExplicitVsInferenceNumber(): number {

  function identity<T>(value: T): T {
    return value
  }

  return identity<number>(42)
}

export function testExplicitVsInferenceString(): string {

  function identity<T>(value: T): T {
    return value
  }

  return identity<string>('hello')
}