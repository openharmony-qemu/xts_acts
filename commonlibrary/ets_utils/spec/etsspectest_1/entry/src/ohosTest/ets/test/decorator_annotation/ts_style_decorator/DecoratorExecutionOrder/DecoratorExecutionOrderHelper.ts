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

let executionLog: string[] = []

export function getExecutionLog(): string[] {
  return [...executionLog]
}

export function identifierDecorator(target: object): void {
  executionLog.push('identifierDecorator')
}

export function decoratorFunction(target: object): void {
  executionLog.push('decoratorFunction')
}

export function decoratorFactory(): (target: object) => void {
  executionLog.push('factory')
  return function (target: object): void {
    executionLog.push('factoryReturnedDecorator')
  }
}

export function createDecorator(value: string): (target: object) => void {
  return function (target: object): void {
    executionLog.push(value)
  }
}

export function paramEvaluatedFirst(): (target: object) => void {
  executionLog.push('paramEvaluatedFirst')
  return function (target: object): void {
    executionLog.push('paramDecorator')
  }
}

export let paramCounter: number = 0
export function sideEffectParam(): (target: object) => void {
  paramCounter++
  executionLog.push('sideEffectParam')
  return function (target: object): void {
    executionLog.push('sideEffectDecorator')
  }
}

export let onceCounter: number = 0
export function onceDecorator(target: object): void {
  onceCounter++
  executionLog.push('onceDecorator')
}

export let repeatCounter: number = 0
export function repeatDecorator(target: object): void {
  repeatCounter++
  executionLog.push('repeatDecorator')
}

export function verifyDecorator(target: object): void {
  executionLog.push('verifyDecorator')
}

export function classDeco1(target: object): void {
  executionLog.push('classDeco1')
}
export function classDeco2(target: object): void {
  executionLog.push('classDeco2')
}

export function classDeco3(target: object): void {
  executionLog.push('classDeco3')
}

export function propDeco1(target: object, propKey: string): void {
  executionLog.push('propDeco1')
}
export function propDeco2(target: object, propKey: string): void {
  executionLog.push('propDeco2')
}

export function propDeco3(target: object, propKey: string): void {
  executionLog.push('propDeco3')
}

export function methodDeco1(target: object, methodKey: string, descriptor: PropertyDescriptor): void {
  executionLog.push('methodDeco1')
}
export function methodDeco2(target: object, methodKey: string, descriptor: PropertyDescriptor): void {
  executionLog.push('methodDeco2')
}

export function methodDeco3(target: object, methodKey: string, descriptor: PropertyDescriptor): void {
  executionLog.push('methodDeco3')
}

export function identifierDeco(target: object): void {
  executionLog.push('identifierDeco')
}
export function factoryDeco(): (target: object) => void {
  executionLog.push('factoryDecoEval')
  return function (target: object): void {
    executionLog.push('factoryDecoCall')
  }
}

export function factoryDeco2(): (target: object) => void {
  executionLog.push('factoryDeco2Eval')
  return function (target: object): void {
    executionLog.push('factoryDeco2Call')
  }
}
export function identifierDeco2(target: object): void {
  executionLog.push('identifierDeco2')
}

export let factoryParamCounter: number = 0
export function multiParamFactory(): (target: object) => void {
  factoryParamCounter++
  executionLog.push('multiParamFactoryEval')
  return function (target: object): void {
    executionLog.push('multiParamFactoryCall')
  }
}

export function callDeco1(target: object): void {
  executionLog.push('callDeco1')
}
export function callDeco2(target: object): void {
  executionLog.push('callDeco2')
}

export function commentDeco1(target: object): void {
  executionLog.push('commentDeco1')
}
export function commentDeco2(target: object): void {
  executionLog.push('commentDeco2')
}

export function leftToRightEval(): string {
  executionLog.push('leftToRightEval')
  return 'leftToRight'
}
export function leftToRightDeco(value: string): (target: object) => void {
  return function (target: object): void {
    executionLog.push(value)
  }
}

export let paramEvalCounter: number = 0
export function firstParamEval(): number {
  paramEvalCounter++
  executionLog.push('firstParamEval')
  return 1
}
export function secondParamEval(): number {
  paramEvalCounter++
  executionLog.push('secondParamEval')
  return 2
}
export function multiParamDeco(a: number, b: number): (target: object) => void {
  return function (target: object): void {
    executionLog.push(`multiParamDeco_${a}_${b}`)
  }
}

export function paramIIFE(): number {
  return (function (): number {
    executionLog.push('paramIIFE')
    return 42
  })()
}
export function IIFEDeco(value: number): (target: object) => void {
  return function (target: object): void {
    executionLog.push(`IIFEDeco_${value}`)
  }
}

function innerCall(): string {
  executionLog.push('innerCall')
  return 'nested'
}
export function outerCall(): string {
  executionLog.push('outerCall')
  return innerCall()
}
export function nestedCallDeco(value: string): (target: object) => void {
  return function (target: object): void {
    executionLog.push(`nestedCallDeco_${value}`)
  }
}

export function arrowNotExecuted(fn: () => void): (target: object) => void {
  executionLog.push('arrowNotExecuted')
  return function (target: object): void {
    executionLog.push('arrowDeco')
  }
}

export function normalFuncNotExecuted(fn: () => void): (target: object) => void {
  executionLog.push('normalFuncNotExecuted')
  return function (target: object): void {
    executionLog.push('normalFuncDeco')
  }
}

export let normalFuncSideEffect: number = 0
export function normalFuncForDecorator(): void {
  normalFuncSideEffect++
}

export let factoryBodyCounter: number = 0
export function factoryBodyDeco(): (target: object) => void {
  factoryBodyCounter++
  executionLog.push('factoryBodyEval')
  return function (target: object): void {
    executionLog.push('factoryBodyCall')
  }
}

export let returnedCounter: number = 0
export function returnedSideEffectDeco(): (target: object) => void {
  executionLog.push('returnedSideEffectEval')
  return function (target: object): void {
    returnedCounter++
    executionLog.push('returnedSideEffectCall')
  }
}

export let factoryOrderBodyCounter: number = 0
export let factoryOrderReturnedCounter: number = 0
export function factoryOrderDeco(): (target: object) => void {
  factoryOrderBodyCounter++
  executionLog.push('factoryOrderEval')
  return function (target: object): void {
    factoryOrderReturnedCounter++
    executionLog.push('factoryOrderCall')
  }
}

export function factoryA(): (target: object) => void {
  executionLog.push('factoryA_Eval')
  return function (target: object): void {
    executionLog.push('factoryA_Call')
  }
}
export function factoryB(): (target: object) => void {
  executionLog.push('factoryB_Eval')
  return function (target: object): void {
    executionLog.push('factoryB_Call')
  }
}

function innerFactory(): (target: object) => void {
  executionLog.push('innerFactoryEval')
  return function (target: object): void {
    executionLog.push('innerFactoryCall')
  }
}
export function outerFactory(): (target: object) => void {
  executionLog.push('outerFactoryEval')
  return innerFactory()
}

function returnDecorator(): (target: object) => void {
  executionLog.push('returnDecoratorEval')
  return function (target: object): void {
    executionLog.push('returnDecoratorCall')
  }
}
export function returnInner(): (target: object) => void {
  executionLog.push('returnInnerEval')
  return returnDecorator()
}

export function classNoCtorDeco(target: object): void {
  executionLog.push('classNoCtorDeco')
}

export function propNoInitDeco(target: object, propKey: string): void {
  executionLog.push('propNoInitDeco')
}

export function methodNoBodyDeco(target: object, methodKey: string, descriptor: PropertyDescriptor): void {
  executionLog.push('methodNoBodyDeco')
}

export function resetAll(): void {
  executionLog = []
  paramCounter = 0
  onceCounter = 0
  repeatCounter = 0
  factoryParamCounter = 0
  paramEvalCounter = 0
  factoryBodyCounter = 0
  returnedCounter = 0
  factoryOrderBodyCounter = 0
  factoryOrderReturnedCounter = 0
  normalFuncSideEffect = 0
}