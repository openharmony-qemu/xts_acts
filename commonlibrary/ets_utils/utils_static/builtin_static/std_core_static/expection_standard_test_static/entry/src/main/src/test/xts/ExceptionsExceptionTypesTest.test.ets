'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

function getData(key: string): string {
  throw new NoDataError('Could not find data for key: ' + key);
}

function getFirstItem(arr: string[]): string {
  if (arr.length === 0) {
    throw new NoDataError('Array is empty, no data available');
  }
  return arr[0];
}

function findUser(id: int): void {
  throw new NoDataError('User not found', { cause: new Error('ID: ' + id.toString()) });
}

function setAge(age: int): void {
  if (age < 0 || age > 150) {
    throw new ArgumentOutOfRangeError('Age must be between 0-150, current: ' + age.toString());
  }
}

function safeGetAt(arr: string[], index: int): string {
  if (index < 0 || index >= arr.length) {
    throw new ArgumentOutOfRangeError('Index out of bounds: ' + index.toString() + ', array length: ' + arr.length.toString());
  }
  return arr[index];
}

function setPercentage(value: int): void {
  if (value < 0 || value > 100) {
    throw new ArgumentOutOfRangeError('Percentage must be between 0-100, current: ' + value.toString());
  }
}

class Connection {
  private connected: boolean = false;

  public connect(): void {
    this.connected = true;
  }

  public send(data: string): void {
    if (!this.connected) {
      throw new IllegalStateError('Connection not established, cannot send data');
    }
  }
}

class FileStream {
  private closed: boolean = false;

  public close(): void {
    this.closed = true;
  }

  public read(): string {
    if (this.closed) {
      throw new IllegalStateError('File stream closed, cannot read');
    }
    return 'data';
  }
}

class StateMachine {
  private state: string = 'IDLE';

  public start(): void {
    if (this.state !== 'IDLE') {
      throw new IllegalStateError('Can only start from IDLE state, current: ' + this.state);
    }
    this.state = 'RUNNING';
  }
}

class ReadOnlyCollection {
  private items: string[] = ['a', 'b'];

  public add(item: string): void {
    throw new UnsupportedOperationError('Read-only collection does not support add: ' + item);
  }
}

class ImmutableConfig {
  private value: string;

  constructor(value: string) {
    this.value = value;
  }

  public setValue(newValue: string): void {
    throw new UnsupportedOperationError('Immutable config cannot be modified: ' + this.value + ':' + newValue);
  }
}

function useHardwareFeature(): void {
  throw new UnsupportedOperationError('Current platform does not support this hardware feature', { cause: new Error('Platform does not support GPU feature') });
}

function withSideEffect<T>(sideEffect: () => void, result: T): T {
  sideEffect();
  return result;
}

function processName(name: string | undefined): string {
  if (name === undefined) {
    throw new IllegalArgumentError('name parameter cannot be undefined');
  }
  return name;
}

function setEmail(email: string): void {
  if (email.indexOf('@') < 0) {
    throw new IllegalArgumentError('Email format is incorrect: ' + email);
  }
}

function setRequiredField(value: string): void {
  if (value.length === 0) {
    throw new IllegalArgumentError('Required field cannot be empty');
  }
}

function validateExactString(value: string): int {
  if (value !== '123') {
    throw new IllegalArgumentError('expected exact string 123, got: ' + value);
  }
  return 123;
}

function riskyOperation(): void {
  throw new RuntimeError('Runtime operation failed');
}

function throwRuntimeWithCause(): void {
  const rootCause: Error = new Error('root cause');
  throw new RuntimeError('wrapper', { cause: rootCause });
}

function wrapError(): void {
  try {
    throw new IllegalArgumentError('bottom layer error');
  } catch (e) {
    throw new RuntimeError('operation execution failed', { cause: e });
  }
}

function divide(a: float, b: float): float {
  if (isNaN(a) || isNaN(b) || !isFinite(a) || !isFinite(b)) {
    throw new IllegalArgumentError('values must be finite numbers');
  }
  if (b === 0) {
    throw new RuntimeError('Divisor cannot be zero');
  }
  return a / b;
}

function allocateMemory(size: int): void {
  if (size > 1024 * 1024) {
    throw new RuntimeError('Insufficient memory, requested: ' + size.toString() + ' bytes');
  }
}

class Validator {
  public validate(value: int): void {
    if (value < 0) {
      throw new IllegalArgumentError('negative: ' + value.toString());
    }
  }
}

class CustomNoDataError extends Error {
  constructor(msg: string) {
    super(msg);
    this.name = 'CustomNoDataError';
  }
}

class CustomRuntimeError extends Error {
  public errorCode: int;
  constructor(msg: string, errorCode: int) {
    super(msg);
    this.name = 'CustomRuntimeError';
    this.errorCode = errorCode;
  }
}

class DetailedArgumentError extends Error {
  public paramName: string;
  constructor(msg: string, paramName: string) {
    super(msg);
    this.name = 'DetailedArgumentError';
    this.paramName = paramName;
  }
}

class FileProcessor {
  private data: string[] = ['a', 'b', 'c'];
  private opened: boolean = true;

  public getItem(index: int): string {
    if (!this.opened) {
      throw new IllegalStateError('FileProcessor is closed');
    }
    if (index < 0 || index >= this.data.length) {
      throw new ArgumentOutOfRangeError('index: ' + index.toString() + ', length: ' + this.data.length.toString());
    }
    return this.data[index];
  }

  public close(): void {
    this.opened = false;
  }

  public processAll(): string[] {
    if (!this.opened) {
      throw new IllegalStateError('FileProcessor is closed');
    }
    this.data = this.data.map((item: string): string => {
      return item.toUpperCase();
    });
    return this.data;
  }
}

class RangeValidator {
  public checkValue(value: int, min: int, max: int): void {
    if (value < 0) {
      throw new IllegalArgumentError('negative value: ' + value.toString());
    }
    if (value < min || value > max) {
      throw new ArgumentOutOfRangeError(
        'value: ' + value.toString() + ', range: [' + min.toString() + ', ' + max.toString() + ']'
      );
