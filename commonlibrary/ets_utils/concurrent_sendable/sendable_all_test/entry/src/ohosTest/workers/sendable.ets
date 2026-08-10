import { collections, lang, ArkTSUtils } from '@kit.ArkTS'

@Sendable
export class BooleanSendable {
  public boolValue_: boolean = false
}

@Sendable
export class EventQueueItem implements lang.ISendable {
  public type_: string = ''
  public data_: string = ''
  public priority_: number = 0

  constructor(type: string, data: string, priority: number) {
    this.type_ = type
    this.data_ = data
    this.priority_ = priority
  }
}

@Sendable
export class NumberSendable {
  public numValue_: number = 0
}

@Sendable
export class StringSendable {
  public strValue_: string = ''
}

@Sendable
export class BigIntSendable {
  public bigIntValue_: bigint = 0n
}

@Sendable
export class MixedTypeSendable {
  public boolVal_: boolean = false
  public numVal_: number = 0
  public strVal_: string = ''
}

@Sendable
export class LogEntry implements lang.ISendable {
  public level_: number
  public message_: string
  public timestamp_: number

  constructor(level: number, message: string, timestamp: number) {
    this.level_ = level
    this.message_ = message
    this.timestamp_ = timestamp
  }
}

@Sendable
export class Request implements lang.ISendable {
  public id_: number
  public type_: string
  public payload_: string
  public requestId_: number = 0

  constructor(id: number, type: string, payload: string) {
    this.id_ = id
    this.type_ = type
    this.payload_ = payload
    this.requestId_ = id
  }
}

@Sendable
export class ValidSendableClass implements lang.ISendable {
  public value_: number = 0
}

@Sendable
export class EmptySendableClass implements lang.ISendable {
}

@Sendable
export class SinglePropSendableClass implements lang.ISendable {
  public count_: number = 0
}

@Sendable
export class MultiPropSendableClass implements lang.ISendable {
  public num_: number = 0
  public str_: string = ''
  public bool_: boolean = false
}

@Sendable
export class InnerSendableClass implements lang.ISendable {
  public count_: number = 0
}

@Sendable
export class NestedSendableClass implements lang.ISendable {
  public inner_: InnerSendableClass = new InnerSendableClass()
}

@Sendable
export class MethodSendableClass implements lang.ISendable {
  public value_: number = 0

  setValue(val: number): void {
    this.value_ = val
  }

  getValue(): number {
    return this.value_
  }
}

@Sendable
export class ChildSendableClass implements lang.ISendable {
  public baseValue_: number = 10
  public childValue_: number = 20
}

@Sendable
export class GrandChildSendableClass implements lang.ISendable {
  public baseValue_: number = 10
  public childValue_: number = 20
  public grandChildValue_: number = 30
}

@Sendable
export function sendableNoParamFunc(): number {
  return 42
}

@Sendable
export function sendableSingleParamFunc(val: number): number {
  return val * 2
}

@Sendable
export function sendableMultiParamFunc(num: number, str: string): string {
  return `${str}_${num}`
}

@Sendable
export function sendableReturnClassFunc(): SinglePropSendableClass {
  let cls: SinglePropSendableClass = new SinglePropSendableClass()
  cls.count_ = 100
  return cls
}

@Sendable
export class NestedSharedCounter implements lang.ISendable {
  public count_: number = 0
}

@Sendable
export class SharedSingleton implements lang.ISendable {
  public value_: number = 0

  setValue(val: number): void {
    this.value_ = val
  }

  getValue(): number {
    return this.value_
  }
}

@Sendable
export class SendableCounter implements lang.ISendable {
  public count_: number = 0
}

@Sendable
export class SharedCounter implements lang.ISendable {
  public count_: number = 0
}

@Sendable
export class SharedArrayContainer implements lang.ISendable {
  public arrayCount_: number = 0
}

@Sendable
export class SharedConfigForWorker implements lang.ISendable {
  public configMap_: collections.Map<string, string>
  public version_: number = 1

  constructor(map: collections.Map<string, string>) {
    this.configMap_ = map
  }

  set(key: string, value: string): void {
    this.configMap_.set(key, value)
  }

  get(key: string): string | undefined {
    return this.configMap_.get(key)
  }

  getVersion(): number {
    return this.version_
  }
}

@Sendable
export class WorkerConfigData implements lang.ISendable {
  public action_: string = ''
  public key_: string = ''
  public value_: string = ''
  public version_: number = 0
  public config_: SharedConfigForWorker | null = null
}

@Sendable
export class WorkerConfigResponse implements lang.ISendable {
  public ok_: boolean = false
  public key_: string = ''
  public value_: string = ''
  public version_: number = 0
  public found_: boolean = false
  public error_: string = ''
}

@Sendable
export class SharedWorkerData implements lang.ISendable {
  public lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
  public name_: string = ''
  public value_: number = 0

  constructor(lock: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock
  }

  async setName(name: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.name_ = name
    })
  }

  async increment(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.value_++
    })
  }

  async getValue(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.value_)
  }
}
