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

export class DecoratorRecorder {
  private keys: string[] = []
  private kinds: string[] = []
  private args: string[] = []
  private order: string[] = []
  private called: boolean = false

  recordKey(key: string): void {
    this.keys.push(key)
  }

  recordKind(kind: string): void {
    this.kinds.push(kind)
  }

  recordArg(arg: string): void {
    this.args.push(arg)
  }

  recordOrder(label: string): void {
    this.order.push(label)
  }

  markCalled(): void {
    this.called = true
  }

  lastKey(): string {
    return this.keys.length > 0 ? this.keys[this.keys.length - 1] : ''
  }

  keysList(): string[] {
    return this.keys
  }

  kindsList(): string[] {
    return this.kinds
  }

  argsList(): string[] {
    return this.args
  }

  orderList(): string[] {
    return this.order
  }

  wasCalled(): boolean {
    return this.called
  }

  reset(): void {
    this.keys = []
    this.kinds = []
    this.args = []
    this.order = []
    this.called = false
  }
}

export function targetKind(target: Object): string {
  return typeof target === 'function' ? 'static' : 'instance'
}

export function recorderHas(rec: DecoratorRecorder, key: string): boolean {
  return rec.keysList().indexOf(key) >= 0
}

const producerRec: DecoratorRecorder = new DecoratorRecorder()

const moduleInitRec: DecoratorRecorder = new DecoratorRecorder()

export function resetProducerRecorder(): void {
  producerRec.reset()
}

export function producerArgs(): string[] {
  return producerRec.argsList()
}

export function producerWasCalled(): boolean {
  return producerRec.wasCalled()
}

export function producerLastKey(): string {
  return producerRec.lastKey()
}

export function moduleInitWasCalled(): boolean {
  return moduleInitRec.wasCalled()
}

export function moduleInitHasKey(key: string): boolean {
  return recorderHas(moduleInitRec, key)
}

class InitFlags {
  exportClassDecoratorRan: boolean = false
  defaultExportDecoratorRan: boolean = false
}

export const initFlags: InitFlags = new InitFlags()

export function importedCapture(target: Object, key: string): void {
  producerRec.recordKey(key)
  producerRec.recordKind(targetKind(target))
  producerRec.markCalled()
}

export function importedFactory(label: string): (target: Object, key: string) => void {
  return (target: Object, key: string): void => {
    producerRec.recordArg(label)
    producerRec.recordKey(key)
    producerRec.markCalled()
  }
}

export function markExportClassField(target: Object, key: string): void {
  initFlags.exportClassDecoratorRan = true
  producerRec.recordKey(key)
  producerRec.recordKind(targetKind(target))
  producerRec.markCalled()
  moduleInitRec.recordKey(key)
  moduleInitRec.markCalled()
}

export function markDefaultExportTag(target: Object, key: string): void {
  initFlags.defaultExportDecoratorRan = true
  producerRec.recordKey(key)
  producerRec.recordKind(targetKind(target))
  producerRec.markCalled()
  moduleInitRec.recordKey(key)
  moduleInitRec.markCalled()
}

export const importedBinding: string = 'IMPORTED_BINDING'

export const moduleVar: string = 'MODULE_VAR'

export class ExportedDecorated {
  @markExportClassField field: string = 'exported'
}

export default class DefaultExportDecorated {
  @markDefaultExportTag tag: number = 42
}


