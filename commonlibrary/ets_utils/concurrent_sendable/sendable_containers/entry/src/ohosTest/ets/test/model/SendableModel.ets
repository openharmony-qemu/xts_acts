
import { collections } from '@kit.ArkTS';


export function gc(){
  if (globalThis.ArkTools?.forceFullGC) {
    globalThis.ArkTools.forceFullGC();
  }
}
@Sendable
export class SendableSharedCounter {
  public counter: number;
  public operationCount: number;
  public errorCount: number;
  public lastValue: number;

  constructor() {
    this.counter = 0;
    this.operationCount = 0;
    this.errorCount = 0;
    this.lastValue = 0;
  }
}

@Sendable
export class SendableSharedArray {
  public array: collections.Array<SendableSharedCounter>;
  public addCount: number;
  public removeCount: number;
  public errorCount: number;

  constructor() {
    this.array = new collections.Array<SendableSharedCounter>();
    this.addCount = 0;
    this.removeCount = 0;
    this.errorCount = 0;
  }
}

@Sendable
export class SendableClass {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

@Sendable
export class SendableSharedMap {
  public map: collections.Map<number, SendableClass>;
  public setCount: number;
  public deleteCount: number;
  public errorCount: number;

  constructor() {
    this.map = new collections.Map<number, SendableClass>();
    this.setCount = 0;
    this.deleteCount = 0;
    this.errorCount = 0;
  }
}

@Concurrent
export function testErrorHandling(c: SendableSharedCounter): void {
  try {
    c.counter = c.counter + 1;
    if (c.counter > 500) {
      throw new Error('Test error');
    }
  } catch (e) {
    c.errorCount = c.errorCount + 1;
    console.info('testErrorHandling caught error: ' + e);
  }
}

@Concurrent
export function longRunningTask(c: SendableSharedCounter): void {
  for (let i = 0; i < 100; i++) {
    try {
      c.counter = c.counter + 1;
      c.operationCount = c.operationCount + 1;
    } catch (e) {
      c.errorCount = c.errorCount + 1;
    }
  }
}