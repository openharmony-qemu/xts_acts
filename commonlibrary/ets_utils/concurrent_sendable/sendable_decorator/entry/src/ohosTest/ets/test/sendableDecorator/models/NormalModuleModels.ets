/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { collections } from '@kit.ArkTS';

@Sendable
export class LogDecoratorSendableClass {
  public value: number = 0;
  public logs: collections.Array<string> = new collections.Array<string>();
  
  setValue(val: number): void {
    this.logs.push('setValue:' + val.toString());
    this.value = val;
  }
  
  getValue(): number {
    this.logs.push('getValue');
    return this.value;
  }
  
  async asyncMethod(): Promise<number> {
    this.logs.push('asyncMethod');
    return this.value * 2;
  }
}

@Sendable
export class CounterDecoratorSendableClass {
  public count: number = 0;
  public callCount: number = 0;
  public lastMethod: string = '';
  
  increment(): void {
    this.callCount++;
    this.lastMethod = 'increment';
    this.count++;
  }
  
  decrement(): void {
    this.callCount++;
    this.lastMethod = 'decrement';
    this.count--;
  }
  
  getCount(): number {
    this.callCount++;
    this.lastMethod = 'getCount';
    return this.count;
  }
}

@Sendable
export class PerformanceDecoratorSendableClass {
  public data: number = 0;
  public totalCalls: number = 0;
  public lastDuration: number = 0;
  public durations: collections.Array<number> = new collections.Array<number>();
  
  processData(input: number): number {
    this.totalCalls++;
    const start = Date.now();
    const result = input * 2;
    const end = Date.now();
    this.lastDuration = end - start;
    this.durations.push(this.lastDuration);
    return result;
  }
  
  async processDataAsync(input: number): Promise<number> {
    this.totalCalls++;
    const start = Date.now();
    const result = input * 3;
    const end = Date.now();
    this.lastDuration = end - start;
    this.durations.push(this.lastDuration);
    return result;
  }
}

@Sendable
export class MultiDecoratorBasicSendableClass {
  public value: number = 0;
  public callCounter: number = 0;
  public logRecords: collections.Array<string> = new collections.Array<string>();
  
  setValue(val: number): void {
    this.callCounter++;
    this.logRecords.push('setValue:' + val.toString());
    this.value = val;
  }
  
  getValue(): number {
    this.callCounter++;
    this.logRecords.push('getValue');
    return this.value;
  }
  
  getDecoratedValue(): number {
    this.callCounter++;
    this.logRecords.push('getDecoratedValue');
    return this.value * 10;
  }
}

@Sendable
export class InheritanceBaseSendableClass {
  public baseValue: number = 0;
  public baseLogs: collections.Array<string> = new collections.Array<string>();
  
  setBaseValue(val: number): void {
    this.baseLogs.push('setBaseValue:' + val.toString());
    this.baseValue = val;
  }
  
  getBaseValue(): number {
    this.baseLogs.push('getBaseValue');
    return this.baseValue;
  }
}

@Sendable
export class InheritanceDerivedSendableClass extends InheritanceBaseSendableClass {
  public derivedValue: number = 0;
  public derivedLogs: collections.Array<string> = new collections.Array<string>();
  
  getTotalValue(): number {
    this.derivedLogs.push('getTotalValue');
    return this.baseValue + this.derivedValue;
  }
}

@Sendable
export class SendableWithLogDecorator {
  public value: number = 0;
  public logs: collections.Array<string> = new collections.Array<string>();
  
  setValue(val: number): void {
    this.logs.push('setValue:' + val.toString());
    this.value = val;
  }
  
  getValue(): number {
    this.logs.push('getValue');
    return this.value;
  }
  
  increment(): number {
    this.logs.push('increment');
    this.value++;
    return this.value;
  }
  
  decrement(): number {
    this.logs.push('decrement');
    this.value--;
    return this.value;
  }
}

@Sendable
export class SendableWithCounterDecorator {
  public value: number = 0;
  public callCount: number = 0;
  public lastMethod: string = '';
  
  setValue(val: number): void {
    this.callCount++;
    this.lastMethod = 'setValue';
    this.value = val;
  }
  
  getValue(): number {
    this.callCount++;
    this.lastMethod = 'getValue';
    return this.value;
  }
  
  increment(): number {
    this.callCount++;
    this.lastMethod = 'increment';
    this.value++;
    return this.value;
  }
  
  decrement(): number {
    this.callCount++;
    this.lastMethod = 'decrement';
    this.value--;
    return this.value;
  }
}

@Sendable
export class SendableWithPerformanceDecorator {
  public value: number = 0;
  public callCount: number = 0;
  public durations: collections.Array<number> = new collections.Array<number>();
  public lastDuration: number = 0;
  
  compute(multiplier: number): number {
    this.callCount++;
    const start = Date.now();
    const result = this.value * multiplier;
    const end = Date.now();
    this.lastDuration = end - start;
    this.durations.push(this.lastDuration);
    return result;
  }
  
  async computeAsync(multiplier: number): Promise<number> {
    this.callCount++;
    const start = Date.now();
    const result = this.value * multiplier;
    const end = Date.now();
    this.lastDuration = end - start;
    this.durations.push(this.lastDuration);
    return result;
  }
}

export class UserData {
  public id: number = 0;
  public name: string = '';
  public email: string = '';
  public _entityId: number = 0;
  public _tableName: string = '';
  public _persisted: boolean = false;
}

export class LogDataItem {
  public id: number = 0;
  public value: number = 0;
  public logMessage: string = '';
  public _logLevel: string = '';
  public _logTimestamp: number = 0;
  public _logMessage: string = '';
}

export class MonitoredTask {
  public id: number = 0;
  public data: string = '';
  public startTime: number = 0;
  public _monitorEnabled: boolean = false;
  public _callCount: number = 0;
  public _executionTime: number = 0;
}

export class CachedConfig {
  public key: string = '';
  public value: string = '';
  public _cacheKey: string = '';
  public _cacheHitCount: number = 0;
  public _cacheUpdateTime: number = 0;
}

export class DatabaseConnection {
  public connectionId: number = 0;
  public status: string = '';
  public _entityId: number = 0;
  public _tableName: string = '';
  public _logLevel: string = '';
  public _logMessage: string = '';
}

export class EventItem {
  public eventType: string = '';
  public data: string = '';
  public persisted: boolean = false;
  public _entityId: number = 0;
  public _tableName: string = '';
  public _logLevel: string = '';
  public _logMessage: string = '';
}

export class RequestItem {
  public requestId: number = 0;
  public data: string = '';
  public accepted: boolean = false;
  public _cacheKey: string = '';
  public _cacheHitCount: number = 0;
  public _monitorEnabled: boolean = false;
  public _callCount: number = 0;
}

export class ResponseItem {
  public requestId: number = 0;
  public result: string = '';
  public success: boolean = false;
  public _monitorEnabled: boolean = false;
  public _callCount: number = 0;
  public _executionTime: number = 0;
  public _cacheKey: string = '';
  public _cacheHitCount: number = 0;
}

@Sendable
export class ClassDecoratorSendableClass {
  public static instanceCount: number = 0;
  public value: number = 0;
  public decoratorApplied: boolean = true;
  public callLogs: collections.Array<string> = new collections.Array<string>();
  
  constructor() {
    ClassDecoratorSendableClass.instanceCount++;
  }
  
  setValue(val: number): void {
    this.callLogs.push('setValue:' + val.toString());
    this.value = val;
  }
  
  getValue(): number {
    this.callLogs.push('getValue');
    return this.value;
  }
}

@Sendable
export class PropertyDecoratorSendableClass {
  public counter: number = 0;
  public multiplier: number = 1;
  public accessorLogs: collections.Array<string> = new collections.Array<string>();
  
  set counterValue(val: number) {
    this.accessorLogs.push('counter:set:' + val.toString());
    this.counter = val * this.multiplier;
  }
  
  get counterValue(): number {
    this.accessorLogs.push('counter:get');
    return this.counter;
  }
}

@Sendable
export class MethodDecoratorSendableClass {
  public value: number = 0;
  public totalCalls: number = 0;
  public addCalls: number = 0;
  public mulCalls: number = 0;
  public methodLogs: collections.Array<string> = new collections.Array<string>();
  
  add(a: number, b: number): number {
    this.totalCalls++;
    this.addCalls++;
    this.methodLogs.push('add:' + a.toString() + ',' + b.toString());
    return a + b + this.value;
  }
  
  multiply(a: number, b: number): number {
    this.totalCalls++;
    this.mulCalls++;
    this.methodLogs.push('multiply:' + a.toString() + ',' + b.toString());
    return a * b + this.value;
  }
}

@Sendable
export class MultiDecoratorSendableClass {
  public data: number = 0;
  public decoratedData: number = 0;
  public callCount: number = 0;
  public logRecords: collections.Array<string> = new collections.Array<string>();
  public perfMetrics: collections.Array<number> = new collections.Array<number>();
  
  setData(val: number): void {
    this.callCount++;
    this.logRecords.push('setData:' + val.toString());
    this.data = val;
    this.decoratedData = val * 10;
  }
  
  getData(): number {
    this.callCount++;
    this.logRecords.push('getData');
    return this.data;
  }
  
  getDecoratedData(): number {
    this.callCount++;
    this.logRecords.push('getDecoratedData');
    return this.decoratedData;
  }
}

@Sendable
export class DatabaseDecoratorSendableClass {
  public entityId: number = 0;
  public tableName: string = '';
  public persisted: boolean = false;
  public dataFields: collections.Array<string> = new collections.Array<string>();
  public dbLogs: collections.Array<string> = new collections.Array<string>();
  
  save(): void {
    this.dbLogs.push('save');
    this.persisted = true;
  }
  
  load(): void {
    this.dbLogs.push('load');
  }
  
  delete(): void {
    this.dbLogs.push('delete');
    this.persisted = false;
  }
}

@Sendable
export class CrossThreadSendableClass {
  public threadId: number = 0;
  public sharedValue: number = 0;
  public threadLogs: collections.Array<string> = new collections.Array<string>();
  
  setThreadId(id: number): void {
    this.threadLogs.push('setThreadId:' + id.toString());
    this.threadId = id;
  }
  
  updateSharedValue(val: number): void {
    this.threadLogs.push('updateSharedValue:' + val.toString());
    this.sharedValue = val;
  }
}

@Sendable
export class RuntimeConstraintSendableClass {
  public maxValue: number = 1000;
  public minValue: number = 0;
  public currentValue: number = 0;
  public constraintLogs: collections.Array<string> = new collections.Array<string>();
  
  setValue(val: number): boolean {
    if (val >= this.minValue && val <= this.maxValue) {
      this.currentValue = val;
      this.constraintLogs.push('setValue:valid:' + val.toString());
      return true;
    } else {
      this.constraintLogs.push('setValue:invalid:' + val.toString());
      return false;
    }
  }
}

@Sendable
export class TaskPoolDecoratorSendableClass {
  public taskCount: number = 0;
  public completedTasks: number = 0;
  public taskLogs: collections.Array<string> = new collections.Array<string>();
  
  executeTask(taskId: number): void {
    this.taskCount++;
    this.taskLogs.push('executeTask:' + taskId.toString());
  }
  
  completeTask(taskId: number): void {
    this.completedTasks++;
    this.taskLogs.push('completeTask:' + taskId.toString());
  }
}

@Sendable
export class CombinedDecoratorSendableClass {
  public value: number = 0;
  public combinedLogs: collections.Array<string> = new collections.Array<string>();
  public combinedCount: number = 0;
  
  setValue(val: number): void {
    this.combinedCount++;
    this.combinedLogs.push('setValue:' + val.toString());
    this.value = val;
  }
  
  getValue(): number {
    this.combinedCount++;
    this.combinedLogs.push('getValue');
    return this.value;
  }
}

@Sendable
export class PropertyWithMethodDecoratorSendableClass {
  public propValue: number = 0;
  public methodValue: number = 0;
  public propMethodLogs: collections.Array<string> = new collections.Array<string>();
  
  setPropValue(val: number): void {
    this.propMethodLogs.push('setPropValue:' + val.toString());
    this.propValue = val;
  }
  
  getMethodValue(): number {
    this.propMethodLogs.push('getMethodValue');
    return this.methodValue + this.propValue;
  }
}

@Sendable
export class MultipleMethodDecoratorsSendableClass {
  public value: number = 0;
  public multiMethodLogs: collections.Array<string> = new collections.Array<string>();
  public multiMethodCount: number = 0;
  
  methodA(a: number): number {
    this.multiMethodCount++;
    this.multiMethodLogs.push('methodA:' + a.toString());
    return this.value + a;
  }
  
  methodB(b: number): number {
    this.multiMethodCount++;
    this.multiMethodLogs.push('methodB:' + b.toString());
    return this.value * b;
  }
  
  methodC(c: number): number {
    this.multiMethodCount++;
    this.multiMethodLogs.push('methodC:' + c.toString());
    return this.value - c;
  }
}