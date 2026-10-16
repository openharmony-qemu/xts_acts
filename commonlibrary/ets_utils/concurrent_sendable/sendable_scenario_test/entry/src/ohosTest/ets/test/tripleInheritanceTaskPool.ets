import { lang, ArkTSUtils, collections } from '@kit.ArkTS'

export enum SendableConstEnum {
  CONST_ZERO = 0,
  CONST_ONE = 1,
  CONST_TWO = 2,
  OPTION_2 = 2
}

@Sendable
export class TopLevelInstanceClass implements lang.ISendable {
  public value_: number = 100
}

export const topLevelInstance: TopLevelInstanceClass = new TopLevelInstanceClass()

@Sendable
export class SendableFourAttributeClass implements lang.ISendable {
  public myNumber: number = 0
  public myEnum: number = 0
  public myArray: collections.Array<number> = new collections.Array<number>(0)
  public myAsyncLock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
  public myInheritedClass: InheritedSendableClass = new InheritedSendableClass()

  setMyNumber(val: number): void {
    this.myNumber = val
  }

  getMyNumber(): number {
    return this.myNumber
  }

  setMyEnum(val?: number): void {
    if (val !== undefined) {
      this.myEnum = val
    } else {
      this.myEnum = SendableConstEnum.OPTION_2
    }
  }

  getMyEnum(): number {
    return this.myEnum
  }

  setMyArray(arr: number[]): void {
    this.myArray = new collections.Array<number>(0)
    for (let i = 0; i < arr.length; i++) {
      this.myArray.push(arr[i])
    }
  }

  getMyArray(): collections.Array<number> {
    return this.myArray
  }

  setMyAsyncLock(name: string): void {
    this.myAsyncLock = new ArkTSUtils.locks.AsyncLock()
  }

  getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock
  }

  setMyInheritedClass(cls: InheritedSendableClass): void {
    this.myInheritedClass = cls
  }

  getMyInheritedClass(): InheritedSendableClass {
    return this.myInheritedClass
  }
}

@Sendable
export class InheritedSendableClass extends SendableFourAttributeClass {
  public inheritedProperty_: string = ''

  setInheritedProperty(val: string): void {
    this.inheritedProperty_ = val
  }

  getInheritedProperty(): string {
    return this.inheritedProperty_
  }
}

@Sendable
export class SendableFiveAttributeInheritClassLevelThree extends InheritedSendableClass {
  public myTopLevelClassInstance: TopLevelInstanceClass = new TopLevelInstanceClass()

  setMyNumber(val: number): void {
    this.myNumber = val + 10
  }

  setMyTopLevelClassInstance(cls: TopLevelInstanceClass): void {
    this.myTopLevelClassInstance = cls
  }

  setMyEnum(val?: number): void {
    if (val !== undefined) {
      this.myEnum = val
    } else {
      this.myEnum = SendableConstEnum.OPTION_2
    }
  }

  setMyArray(arr: number[]): void {
    this.myArray = new collections.Array<number>(0)
    for (let i = 0; i < arr.length; i++) {
      this.myArray.push(arr[i])
    }
  }

  setMyAsyncLock(name: string): void {
    this.myAsyncLock = new ArkTSUtils.locks.AsyncLock()
  }
}

@Sendable
export class FourthLevelSendableClassOver extends SendableFiveAttributeInheritClassLevelThree {
  public name_: string = ''
  public age_: number = 0

  constructor(name: string, age: number) {
    super()
    this.name_ = name
    this.age_ = age
  }

  toString(): string {
    return `Person[name=${this.name_}, age=${this.age_}]`
  }
}
