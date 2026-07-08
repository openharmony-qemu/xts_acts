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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
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
    }
  }
}

class ConfigReader {
  private config: Record<string, string>;

  constructor(config: Record<string, string>) {
    this.config = config;
  }

  public getValue(key: string): string {
    if (key.length === 0) {
      throw new IllegalArgumentError('key must not be empty');
    }
    const value: string | undefined = this.config[key];
    if (value === undefined) {
      throw new NoDataError('config key not found: ' + key);
    }
    return value;
  }
}

class ReadOnlyWrapper {
  private readonly data: string;

  constructor(data: string) {
    this.data = data;
  }

  public getData(): string {
    return this.data;
  }

  public modifyData(newData: string): void {
    throw new UnsupportedOperationError('ReadOnlyWrapper does not support modification');
  }
}

class SafeCalculator {
  public divide(a: float, b: float): float {
    if (isNaN(a) || isNaN(b) || !isFinite(a) || !isFinite(b)) {
      throw new IllegalArgumentError('values must be finite numbers');
    }
    if (b === 0) {
      throw new RuntimeError('division by zero');
    }
    if (a < 0 || b < 0) {
      throw new IllegalArgumentError('negative values not allowed: ' + a.toString() + ', ' + b.toString());
    }
    return a / b;
  }

  public sqrt(value: float): double {
    if (isNaN(value) || !isFinite(value)) {
      throw new IllegalArgumentError('value must be a finite number');
    }
    if (value < 0) {
      throw new RuntimeError('cannot compute sqrt of negative: ' + value.toString());
    }
    return Math.sqrt(value);
  }
}

class CustomBusinessError extends Error {
  public errorCode: int;

  constructor(message: string, options?: ErrorOptions, errorCode?: int) {
    super(message, options);
    this.name = 'CustomBusinessError';
    this.errorCode = errorCode ?? -1;
  }
}

class DetailedBusinessError extends CustomBusinessError {
  public detail: string;

  constructor(message: string, detail: string, options?: ErrorOptions, errorCode?: int) {
    super(message, options, errorCode);
    this.name = 'DetailedBusinessError';
    this.detail = detail;
  }
}

export default function exceptionsExceptionTypesTest(): void {
  describe('exceptionsExceptionTypesTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_0100
     * @tc.name testExceptionsType001
     * @tc.desc Verify message parameter preserves normal, empty, blank, zero-width and special character strings.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new NoDataError('This is a test error message').message).assertEqual('This is a test error message');
      expect(new ArgumentOutOfRangeError('').message).assertEqual('');
      expect(new IllegalStateError(' ').message).assertEqual(' ');
      expect(new RuntimeError('\u200B').message).assertEqual('\u200B');
      const specialMsg: string = '!@#$%^&*()_+-=[]{}|;":,./<>?';
      expect(new UnsupportedOperationError(specialMsg).message).assertEqual(specialMsg);
      expect(new IllegalArgumentError('Illegal argument').message).assertEqual('Illegal argument');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_0200
     * @tc.name testExceptionsType002
     * @tc.desc Verify exception with message containing arithmetic operators + - * / is preserved.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg: string = '100+200-300*400/500';
      const err: RuntimeError = new RuntimeError(msg);
      expect(err.message).assertEqual(msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_0300
     * @tc.name testExceptionsType003
     * @tc.desc Verify exception thrown from class method preserves name and message after catch.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: Validator = new Validator();
      try {
        v.validate(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e.message).assertEqual('negative: -1');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_0400
     * @tc.name testExceptionsType004
     * @tc.desc Verify try-catch inside a for loop with break on caught exception.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      let caughtName: string = '';
      let caughtMsg: string = '';
      for (let i: int = 0; i < 10; i++) {
        try {
          if (i === 5) {
            throw new RuntimeError('found at ' + i.toString());
          }
        } catch (e) {
          expect(e.name).assertEqual('RuntimeError');
          found = true;
          caughtName = e.name;
          caughtMsg = e.message;
          break;
        }
      }
      expect(found).assertTrue();
      expect(caughtName).assertEqual('RuntimeError');
      expect(caughtMsg).assertEqual('found at 5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_0500
     * @tc.name testExceptionsType005
     * @tc.desc Verify catch-all clause catches any standard exception type; none escapes uncaught.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const throwByIndex: (idx: int) => void = (idx: int) => {
        if (idx === 1) {
          throw new NoDataError('no data');
        } else if (idx === 2) {
          throw new ArgumentOutOfRangeError('out of range');
        } else if (idx === 3) {
          throw new IllegalStateError('bad state');
        } else if (idx === 4) {
          throw new UnsupportedOperationError('unsupported');
        } else if (idx === 5) {
          throw new IllegalArgumentError('bad arg');
        }
        throw new RuntimeError('runtime');
      };
      const names: string[] = ['RuntimeError', 'NoDataError', 'ArgumentOutOfRangeError',
        'IllegalStateError', 'UnsupportedOperationError', 'IllegalArgumentError'];
      for (let i: int = 0; i < names.length; i++) {
        try {
          throwByIndex(i);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual(names[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_0600
     * @tc.name testExceptionsType006
     * @tc.desc Verify a thrown exception with cause exposes cause after catch.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        throwRuntimeWithCause();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        const runtimeErr: RuntimeError = e as RuntimeError;
        expect(runtimeErr.name).assertEqual('RuntimeError');
        expect(runtimeErr.cause instanceof Error).assertTrue();
        expect((runtimeErr.cause as Error).message).assertEqual('root cause');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_0700
     * @tc.name testExceptionsType007
     * @tc.desc Verify RuntimeError can be thrown and caught with name and message checks.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        throw new RuntimeError('sample thrown RuntimeError');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        expect(e.message).assertEqual('sample thrown RuntimeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_0800
     * @tc.name testExceptionsType008
     * @tc.desc Verify NoDataError domain scenarios for missing key, empty array and missing user.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        getData('missing_key');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
        expect(e.message).assertEqual('Could not find data for key: missing_key');
      }
      try {
        getFirstItem([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
        expect(e.message).assertEqual('Array is empty, no data available');
      }
      try {
        findUser(999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
        expect(e.message).assertEqual('User not found');
        const dataErr: NoDataError = e as NoDataError;
        expect(dataErr.cause instanceof Error).assertTrue();
        const causeErr: Error = dataErr.cause as Error;
        expect(causeErr.name).assertEqual('Error');
        expect(causeErr.message).assertEqual('ID: 999');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_0900
     * @tc.name testExceptionsType009
     * @tc.desc Verify ArgumentOutOfRangeError domain scenarios for invalid age, index and percentage including closed-interval boundaries [0,150] and [0,100].
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        setAge(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
        expect(e.message).assertEqual('Age must be between 0-150, current: -1');
      }
      try {
        safeGetAt([], 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
        expect(e.message).assertEqual('Index out of bounds: 0, array length: 0');
      }
      try {
        safeGetAt(['a', 'b', 'c'], 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
        expect(e.message).assertEqual('Index out of bounds: 5, array length: 3');
      }
      try {
        safeGetAt(['a', 'b', 'c'], -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
        expect(e.message).assertEqual('Index out of bounds: -1, array length: 3');
      }
      try {
        setPercentage(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
        expect(e.message).assertEqual('Percentage must be between 0-100, current: -1');
      }
      try {
        setPercentage(101);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
        expect(e.message).assertEqual('Percentage must be between 0-100, current: 101');
      }
      try {
        setAge(151);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
        expect(e.message).assertEqual('Age must be between 0-150, current: 151');
      }
      let threw: boolean = false;
      try {
        setAge(0);
        setAge(150);
        setPercentage(0);
        setPercentage(100);
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
        threw = true;
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_1000
     * @tc.name testExceptionsType010
     * @tc.desc Verify IllegalStateError domain scenarios for connection, closed resource and state machine.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new Connection().send('hello');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalStateError');
        expect(e.message).assertEqual('Connection not established, cannot send data');
      }
      const stream: FileStream = new FileStream();
      stream.close();
      try {
        stream.read();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalStateError');
        expect(e.message).assertEqual('File stream closed, cannot read');
      }
      const sm: StateMachine = new StateMachine();
      sm.start();
      try {
        sm.start();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalStateError');
        expect(e.message).assertEqual('Can only start from IDLE state, current: RUNNING');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_1100
     * @tc.name testExceptionsType011
     * @tc.desc Verify UnsupportedOperationError domain scenarios for readonly, immutable and unsupported feature operations.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new ReadOnlyCollection().add('c');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('UnsupportedOperationError');
        expect(e.message).assertEqual('Read-only collection does not support add: c');
      }
      try {
        new ImmutableConfig('default').setValue('modified');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('UnsupportedOperationError');
        expect(e.message).assertEqual('Immutable config cannot be modified: default:modified');
      }
      try {
        useHardwareFeature();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('UnsupportedOperationError');
        const unsupErr: UnsupportedOperationError = e as UnsupportedOperationError;
        expect(unsupErr.cause instanceof Error).assertTrue();
        const causeErr: Error = unsupErr.cause as Error;
        expect(causeErr.name).assertEqual('Error');
        expect(causeErr.message).assertEqual('Platform does not support GPU feature');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_1200
     * @tc.name testExceptionsType012
     * @tc.desc Verify IllegalArgumentError domain scenarios for null, malformed, empty and unparsable parameters.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        processName(undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e.message).assertEqual('name parameter cannot be undefined');
      }
      try {
        setEmail('invalid-email');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e.message).assertEqual('Email format is incorrect: invalid-email');
      }
      try {
        setRequiredField('');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e.message).assertEqual('Required field cannot be empty');
      }
      try {
        validateExactString('abc');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e.message).assertEqual('expected exact string 123, got: abc');
      }
      expect(validateExactString('123')).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_1300
     * @tc.name testExceptionsType013
     * @tc.desc Verify RuntimeError domain scenarios for risky operation, wrapping, division by zero, resource exhaustion and NaN/Infinity rejection by the global divide guard.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        riskyOperation();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        expect(e.message).assertEqual('Runtime operation failed');
      }
      try {
        wrapError();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        const runtimeErr: RuntimeError = e as RuntimeError;
        expect(runtimeErr.cause instanceof Error).assertTrue();
        const causeErr: Error = runtimeErr.cause as Error;
        expect(causeErr.name).assertEqual('IllegalArgumentError');
        expect(causeErr.message).assertEqual('bottom layer error');
      }
      try {
        divide(10, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        expect(e.message).assertEqual('Divisor cannot be zero');
      }
      try {
        divide(Float.NaN, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e instanceof IllegalArgumentError).assertTrue();
        expect(e.message).assertEqual('values must be finite numbers');
      }
      try {
        divide(1, Float.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e instanceof IllegalArgumentError).assertTrue();
        expect(e.message).assertEqual('values must be finite numbers');
      }
      try {
        allocateMemory(2 * 1024 * 1024);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        expect(e.message).assertEqual('Insufficient memory, requested: 2097152 bytes');
      }
      let threw: boolean = false;
      try {
        allocateMemory(1024 * 1024);
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        threw = true;
      }
      expect(threw).assertFalse();
      const quotient: float = divide(10, 2);
      const expectedQuotient: float = 5;
      expect(quotient).assertEqual(expectedQuotient);
      const negativeQuotient: float = divide(-10, 2);
      const expectedNegative: float = -5;
      expect(negativeQuotient).assertEqual(expectedNegative);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_1400
     * @tc.name testExceptionsType014
     * @tc.desc Verify exception with message that is a URL-like string is preserved.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: RuntimeError = new RuntimeError('https://example.com/api/v1/resource?page=1');
      expect(err.message).assertEqual('https://example.com/api/v1/resource?page=1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_1500
     * @tc.name testExceptionsType015
     * @tc.desc Verify repeated creation of RuntimeError instances keeps each message stable.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i: int = 0; i < 100; i++) {
        const err: RuntimeError = new RuntimeError('Stability test number ' + i.toString());
        expect(err.message).assertEqual('Stability test number ' + i.toString());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_1600
     * @tc.name testExceptionsType016
     * @tc.desc Verify toString output and formatted string preserve exception name and message signals.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const runtimeErr: RuntimeError = new RuntimeError('toString test');
      const argErr: IllegalArgumentError = new IllegalArgumentError('serialization test');
      const runtimeStr: string = runtimeErr.toString();
      expect(runtimeStr).assertEqual('RuntimeError: toString test');
      const formatted: string = argErr.name + ': ' + argErr.message;
      expect(formatted).assertEqual('IllegalArgumentError: serialization test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_1700
     * @tc.name testExceptionsType017
     * @tc.desc Verify CustomNoDataError extending Error: name override and throw/catch.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: CustomNoDataError = new CustomNoDataError('custom message');
      expect(err.name).assertEqual('CustomNoDataError');
      expect(err.message).assertEqual('custom message');
      try {
        throw new CustomNoDataError('throw test');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('CustomNoDataError');
        expect(e.message).assertEqual('throw test');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_1800
     * @tc.name testExceptionsType018
     * @tc.desc Verify CustomRuntimeError extending Error with extra property is throwable and catchable.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: CustomRuntimeError = new CustomRuntimeError('fatal', 500);
      expect(err.errorCode).assertEqual(500);
      try {
        throw err;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('CustomRuntimeError');
        const typedErr: CustomRuntimeError = e as CustomRuntimeError;
        expect(typedErr.name).assertEqual('CustomRuntimeError');
        expect(typedErr.message).assertEqual('fatal');
        expect(typedErr.errorCode).assertEqual(500);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_1900
     * @tc.name testExceptionsType019
     * @tc.desc Verify DetailedArgumentError extends Error: extra property, name override, and throw/catch.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: DetailedArgumentError = new DetailedArgumentError('invalid input', 'age');
      expect(err.paramName).assertEqual('age');
      expect(err.name).assertEqual('DetailedArgumentError');
      try {
        throw new DetailedArgumentError('invalid param', 'username');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('DetailedArgumentError');
        const typed: DetailedArgumentError = e as DetailedArgumentError;
        expect(typed.name).assertEqual('DetailedArgumentError');
        expect(typed.message).assertEqual('invalid param');
        expect(typed.paramName).assertEqual('username');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_2000
     * @tc.name testExceptionsType020
     * @tc.desc Verify exception message with leading and trailing spaces is preserved without trimming.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg: string = '  message with spaces  ';
      const err: RuntimeError = new RuntimeError(msg);
      expect(err.message).assertEqual('  message with spaces  ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_2100
     * @tc.name testExceptionsType021
     * @tc.desc Verify FileProcessor throws ArgumentOutOfRangeError when accessing invalid index.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fp: FileProcessor = new FileProcessor();
      try {
        fp.getItem(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
        expect(e instanceof ArgumentOutOfRangeError).assertTrue();
        expect(e.message).assertEqual('index: -1, length: 3');
      }
      try {
        fp.getItem(100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
        expect(e instanceof ArgumentOutOfRangeError).assertTrue();
        expect(e.message).assertEqual('index: 100, length: 3');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_2200
     * @tc.name testExceptionsType022
     * @tc.desc Verify FileProcessor.getItem returns correct data for valid indices.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fp: FileProcessor = new FileProcessor();
      const item0: string = fp.getItem(0);
      expect(item0).assertEqual('a');
      const item2: string = fp.getItem(2);
      expect(item2).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_2300
     * @tc.name testExceptionsType023
     * @tc.desc Verify FileProcessor throws IllegalStateError for all operations after close.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fp: FileProcessor = new FileProcessor();
      fp.close();
      try {
        fp.getItem(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalStateError');
        expect(e instanceof IllegalStateError).assertTrue();
        expect(e.message).assertEqual('FileProcessor is closed');
      }
      try {
        fp.processAll();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalStateError');
        expect(e instanceof IllegalStateError).assertTrue();
        expect(e.message).assertEqual('FileProcessor is closed');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_2400
     * @tc.name testExceptionsType024
     * @tc.desc Verify FileProcessor normal operation succeeds without throwing.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fp: FileProcessor = new FileProcessor();
      const result: string[] = fp.processAll();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('A');
      expect(result[1]).assertEqual('B');
      expect(result[2]).assertEqual('C');
      expect(fp.getItem(0)).assertEqual('A');
      expect(fp.getItem(2)).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_2500
     * @tc.name testExceptionsType025
     * @tc.desc Verify RangeValidator throws ArgumentOutOfRangeError for out-of-range values and IllegalArgumentError for negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rv: RangeValidator = new RangeValidator();
      try {
        rv.checkValue(10, 0, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
        expect(e instanceof ArgumentOutOfRangeError).assertTrue();
        expect(e.message).assertEqual('value: 10, range: [0, 5]');
      }
      try {
        rv.checkValue(-5, 0, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e instanceof IllegalArgumentError).assertTrue();
        expect(e.message).assertEqual('negative value: -5');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_2600
     * @tc.name testExceptionsType026
     * @tc.desc Verify RangeValidator with valid value does not throw.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rv: RangeValidator = new RangeValidator();
      let threw: boolean = false;
      try {
        rv.checkValue(3, 0, 10);
        rv.checkValue(5, 0, 10);
      } catch (e) {
        threw = true;
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_2700
     * @tc.name testExceptionsType027
     * @tc.desc Verify ConfigReader throws IllegalArgumentError for empty key.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const config: Record<string, string> = { 'host': 'localhost', 'port': '8080' };
      const cr: ConfigReader = new ConfigReader(config);
      try {
        cr.getValue('');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e instanceof IllegalArgumentError).assertTrue();
        expect(e.message).assertEqual('key must not be empty');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_2800
     * @tc.name testExceptionsType028
     * @tc.desc Verify ConfigReader throws NoDataError for missing key.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const config: Record<string, string> = { 'host': 'localhost' };
      const cr: ConfigReader = new ConfigReader(config);
      try {
        cr.getValue('missingKey');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
        expect(e instanceof NoDataError).assertTrue();
        expect(e.message).assertEqual('config key not found: missingKey');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_2900
     * @tc.name testExceptionsType029
     * @tc.desc Verify ConfigReader returns correct value for valid key.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const config: Record<string, string> = { 'host': 'localhost', 'port': '8080' };
      const cr: ConfigReader = new ConfigReader(config);
      const value: string = cr.getValue('host');
      expect(value).assertEqual('localhost');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_3000
     * @tc.name testExceptionsType030
     * @tc.desc Verify ReadOnlyWrapper throws UnsupportedOperationError on modify attempt.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const wrapper: ReadOnlyWrapper = new ReadOnlyWrapper('initial data');
      try {
        wrapper.modifyData('new data');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('UnsupportedOperationError');
        expect(e instanceof UnsupportedOperationError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_3100
     * @tc.name testExceptionsType031
     * @tc.desc Verify ReadOnlyWrapper.getData returns the initial data.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const wrapper: ReadOnlyWrapper = new ReadOnlyWrapper('test data');
      const data: string = wrapper.getData();
      expect(data).assertEqual('test data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_3200
     * @tc.name testExceptionsType032
     * @tc.desc Verify SafeCalculator.divide (which rejects negative operands unlike the global divide) throws RuntimeError for division by zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const calc: SafeCalculator = new SafeCalculator();
      try {
        calc.divide(10, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        expect(e instanceof RuntimeError).assertTrue();
        expect(e.message).assertEqual('division by zero');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_3300
     * @tc.name testExceptionsType033
     * @tc.desc Verify SafeCalculator throws IllegalArgumentError for negative operands; on combined (-1, 0) boundary zero-check precedes negative-check and throws RuntimeError.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const calc: SafeCalculator = new SafeCalculator();
      try {
        calc.divide(-1, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e instanceof IllegalArgumentError).assertTrue();
        expect(e.message).assertEqual('negative values not allowed: -1, 5');
      }
      try {
        calc.divide(5, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e instanceof IllegalArgumentError).assertTrue();
        expect(e.message).assertEqual('negative values not allowed: 5, -1');
      }
      try {
        calc.divide(-1, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        expect(e instanceof RuntimeError).assertTrue();
        expect(e.message).assertEqual('division by zero');
      }
      try {
        calc.divide(0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e instanceof IllegalArgumentError).assertTrue();
        expect(e.message).assertEqual('negative values not allowed: 0, -1');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_3400
     * @tc.name testExceptionsType034
     * @tc.desc Verify SafeCalculator.sqrt throws RuntimeError for negative input.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const calc: SafeCalculator = new SafeCalculator();
      try {
        calc.sqrt(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        expect(e instanceof RuntimeError).assertTrue();
        expect(e.message).assertEqual('cannot compute sqrt of negative: -1');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_3500
     * @tc.name testExceptionsType035
     * @tc.desc Verify SafeCalculator normal operation with valid inputs.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const calc: SafeCalculator = new SafeCalculator();
      const result: float = calc.divide(10, 2);
      const expectedDiv: float = 5;
      expect(result).assertEqual(expectedDiv);
      const sqrtResult: double = calc.sqrt(9);
      const expectedSqrt: double = 3;
      expect(sqrtResult).assertEqual(expectedSqrt);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_3600
     * @tc.name testExceptionsType036
     * @tc.desc Verify SafeCalculator.sqrt(0) boundary returns 0 and NaN/Infinity inputs are rejected.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const calc: SafeCalculator = new SafeCalculator();
      const sqrtZero: double = calc.sqrt(0);
      const expectedZero: double = 0;
      expect(sqrtZero).assertEqual(expectedZero);
      try {
        calc.sqrt(Float.NaN);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e instanceof IllegalArgumentError).assertTrue();
        expect(e.message).assertEqual('value must be a finite number');
      }
      try {
        calc.sqrt(Float.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e instanceof IllegalArgumentError).assertTrue();
        expect(e.message).assertEqual('value must be a finite number');
      }
      try {
        calc.divide(Float.NaN, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e instanceof IllegalArgumentError).assertTrue();
        expect(e.message).assertEqual('values must be finite numbers');
      }
      try {
        calc.divide(1, Float.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e instanceof IllegalArgumentError).assertTrue();
        expect(e.message).assertEqual('values must be finite numbers');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_3700
     * @tc.name testExceptionsType037
     * @tc.desc Verify two-layer exception chain with NoDataError wrapping RuntimeException preserves both identities.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const root: Error = new Error('root cause');
      const mid: RuntimeError = new RuntimeError('middle layer', { cause: root });
      const top: NoDataError = new NoDataError('top layer', { cause: mid });
      expect(top.cause).assertEqual(mid);
      expect(top.cause instanceof RuntimeError).assertTrue();
      const midCause: RuntimeError = top.cause as RuntimeError;
      expect(midCause.cause).assertEqual(root);
      expect(midCause.message).assertEqual('middle layer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_3800
     * @tc.name testExceptionsType038
     * @tc.desc Verify JSON stringification of exception name and message fields.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: IllegalArgumentError = new IllegalArgumentError('json test');
      const jsonObj: Record<string, string> = { 'name': err.name, 'message': err.message };
      const json: string = JSON.stringify(jsonObj);
      expect(json).assertEqual('{"name":"IllegalArgumentError","message":"json test"}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_3900
     * @tc.name testExceptionsType039
     * @tc.desc Verify CustomBusinessError extending Error preserves inheritance and extra property.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: CustomBusinessError = new CustomBusinessError('business error', undefined, 4001);
      expect(err.name).assertEqual('CustomBusinessError');
      expect(err.message).assertEqual('business error');
      expect(err.errorCode).assertEqual(4001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_4000
     * @tc.name testExceptionsType040
     * @tc.desc Verify CustomBusinessError can be thrown and caught with correct instanceof.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        throw new CustomBusinessError('throw test', undefined, 5001);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('CustomBusinessError');
        expect(e instanceof CustomBusinessError).assertTrue();
        const typed: CustomBusinessError = e as CustomBusinessError;
        expect(typed.errorCode).assertEqual(5001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_4100
     * @tc.name testExceptionsType041
     * @tc.desc Verify CustomBusinessError with options cause preserves the cause chain.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cause: Error = new Error('underlying error');
      const err: CustomBusinessError = new CustomBusinessError('wrapped', { cause: cause }, 999);
      expect(err.cause).assertEqual(cause);
      expect(err.errorCode).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_4200
     * @tc.name testExceptionsType042
     * @tc.desc Verify DetailedBusinessError extends CustomBusinessError extends Error preserving full chain.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: DetailedBusinessError = new DetailedBusinessError('detailed', 'extra info', undefined, 7001);
      expect(err.detail).assertEqual('extra info');
      expect(err.errorCode).assertEqual(7001);
      expect(err.name).assertEqual('DetailedBusinessError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_4300
     * @tc.name testExceptionsType043
     * @tc.desc Verify DetailedBusinessError can be thrown and caught preserving all custom properties.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        throw new DetailedBusinessError('thrown', 'context', undefined, 8008);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('DetailedBusinessError');
        expect(e instanceof DetailedBusinessError).assertTrue();
        const typed: DetailedBusinessError = e as DetailedBusinessError;
        expect(typed.detail).assertEqual('context');
        expect(typed.errorCode).assertEqual(8008);
        expect(typed.name).assertEqual('DetailedBusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_4400
     * @tc.name testExceptionsType044
     * @tc.desc Verify throw inside arrow function expression preserves correct exception type.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arrow: () => void = () => {
        throw new RuntimeError('arrow throw');
      };
      try {
        arrow();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        expect(e.message).assertEqual('arrow throw');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_4500
     * @tc.name testExceptionsType045
     * @tc.desc Verify Error and undefined cause values work for exception types (merged from testType103/120/127).
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cv1: Error = new Error('causeStr');
      expect(new NoDataError('m', { cause: cv1 }).cause).assertEqual(cv1);
      expect(new ArgumentOutOfRangeError('m', { cause: cv1 }).cause).assertEqual(cv1);
      expect(new IllegalStateError('m', { cause: cv1 }).cause).assertEqual(cv1);
      expect(new UnsupportedOperationError('m', { cause: cv1 }).cause).assertEqual(cv1);
      expect(new IllegalArgumentError('m', { cause: cv1 }).cause).assertEqual(cv1);
      expect(new RuntimeError('m', { cause: cv1 }).cause).assertEqual(cv1);
      expect(new NoDataError('m', { cause: undefined }).cause).assertEqual(undefined);
      expect(new ArgumentOutOfRangeError('m', { cause: undefined }).cause).assertEqual(undefined);
      expect(new IllegalStateError('m', { cause: undefined }).cause).assertEqual(undefined);
      expect(new UnsupportedOperationError('m', { cause: undefined }).cause).assertEqual(undefined);
      expect(new IllegalArgumentError('m', { cause: undefined }).cause).assertEqual(undefined);
      expect(new RuntimeError('m', { cause: undefined }).cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_4600
     * @tc.name testExceptionsType046
     * @tc.desc Verify exception with JSON-like message string preserves special characters.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const jsonMsg: string = '{"key": "value", "num": 42}';
      const err: NoDataError = new NoDataError(jsonMsg);
      expect(err.message).assertEqual('{"key": "value", "num": 42}');
      expect(err.name).assertEqual('NoDataError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_4700
     * @tc.name testExceptionsType047
     * @tc.desc Verify message property preserves the constructor argument for all 6 exception types.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msgs: string[] = [
        new NoDataError('a').message,
        new ArgumentOutOfRangeError('b').message,
        new IllegalStateError('c').message,
        new UnsupportedOperationError('d').message,
        new IllegalArgumentError('e').message,
        new RuntimeError('f').message
      ];
      expect(msgs[0]).assertEqual('a');
      expect(msgs[1]).assertEqual('b');
      expect(msgs[2]).assertEqual('c');
      expect(msgs[3]).assertEqual('d');
      expect(msgs[4]).assertEqual('e');
      expect(msgs[5]).assertEqual('f');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_4800
     * @tc.name testExceptionsType048
     * @tc.desc Verify exception factory function returns correct type and message for each index.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const factory: (idx: int) => Error = (idx: int): Error => {
        if (idx === 0) {
          return new NoDataError('nd');
        } else if (idx === 1) {
          return new ArgumentOutOfRangeError('aoor');
        } else if (idx === 2) {
          return new IllegalStateError('ise');
        } else if (idx === 3) {
          return new UnsupportedOperationError('uoe');
        } else if (idx === 4) {
          return new IllegalArgumentError('iae');
        }
        return new RuntimeError('re');
      };
      expect(factory(0).name).assertEqual('NoDataError');
      expect(factory(1).name).assertEqual('ArgumentOutOfRangeError');
      expect(factory(2).name).assertEqual('IllegalStateError');
      expect(factory(3).name).assertEqual('UnsupportedOperationError');
      expect(factory(4).name).assertEqual('IllegalArgumentError');
      expect(factory(5).name).assertEqual('RuntimeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_4900
     * @tc.name testExceptionsType049
     * @tc.desc Verify exception constructed inside a conditional expression preserves type correctly.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const flag: boolean = true;
      const err: Error = flag ? new RuntimeError('ternary') : new NoDataError('not used');
      expect(err.name).assertEqual('RuntimeError');
      expect(err.message).assertEqual('ternary');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_5000
     * @tc.name testExceptionsType050
     * @tc.desc Verify exception with message containing only symbols is preserved.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: RuntimeError = new RuntimeError('!@#$%^&*()_+-=[]{}|;:,.<>?');
      expect(err.message).assertEqual('!@#$%^&*()_+-=[]{}|;:,.<>?');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_5100
     * @tc.name testExceptionsType051
     * @tc.desc Verify exception name property differs when reassigned for all 6 types.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const errors: Error[] = [
        new NoDataError('x'),
        new ArgumentOutOfRangeError('x'),
        new IllegalStateError('x'),
        new UnsupportedOperationError('x'),
        new IllegalArgumentError('x'),
        new RuntimeError('x')
      ];
      for (let i: int = 0; i < errors.length; i++) {
        errors[i].name = 'Renamed' + i.toString();
        expect(errors[i].name).assertEqual('Renamed' + i.toString());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_5200
     * @tc.name testExceptionsType052
     * @tc.desc Verify message with hexadecimal string is preserved without number conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: IllegalArgumentError = new IllegalArgumentError('0xFF');
      expect(err.message).assertEqual('0xFF');
      expect(err.name).assertEqual('IllegalArgumentError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_5300
     * @tc.name testExceptionsType053
     * @tc.desc Verify message with mixed quotes is preserved as-is.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: IllegalStateError = new IllegalStateError("it's a \"quoted\" value");
      expect(err.message).assertEqual("it's a \"quoted\" value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_5400
     * @tc.name testExceptionsType054
     * @tc.desc Verify exception with empty msg and cause from each concrete type works.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const causeTypes: Error[] = [
        new NoDataError('c1'),
        new ArgumentOutOfRangeError('c2'),
        new IllegalStateError('c3'),
        new UnsupportedOperationError('c4'),
        new IllegalArgumentError('c5'),
        new RuntimeError('c6')
      ];
      for (let i: int = 0; i < causeTypes.length; i++) {
        const err: RuntimeError = new RuntimeError('', { cause: causeTypes[i] });
        expect(err.cause).assertEqual(causeTypes[i]);
        expect(err.message).assertEqual('');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_5500
     * @tc.name testExceptionsType055
     * @tc.desc Verify catch can be reached after try block with return in function.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fn: (shouldThrow: boolean) => string = (shouldThrow: boolean): string => {
        try {
          if (shouldThrow) {
            throw new RuntimeError('threw');
          }
          return 'ok';
        } catch (e) {
          expect(e.name).assertEqual('RuntimeError');
          return 'caught';
        }
      };
      expect(fn(false)).assertEqual('ok');
      expect(fn(true)).assertEqual('caught');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_5600
     * @tc.name testExceptionsType056
     * @tc.desc Verify exception cause array of strings for all 6 types preserves value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const causeArr: string[] = ['a', 'b'];
      const e1: NoDataError = new NoDataError('m', { cause: causeArr });
      const e2: ArgumentOutOfRangeError = new ArgumentOutOfRangeError('m', { cause: causeArr });
      const e3: IllegalStateError = new IllegalStateError('m', { cause: causeArr });
      const e4: UnsupportedOperationError = new UnsupportedOperationError('m', { cause: causeArr });
      const e5: IllegalArgumentError = new IllegalArgumentError('m', { cause: causeArr });
      const e6: RuntimeError = new RuntimeError('m', { cause: causeArr });
      expect(e1.cause).assertEqual(causeArr);
      expect(e2.cause).assertEqual(causeArr);
      expect(e3.cause).assertEqual(causeArr);
      expect(e4.cause).assertEqual(causeArr);
      expect(e5.cause).assertEqual(causeArr);
      expect(e6.cause).assertEqual(causeArr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_5700
     * @tc.name testExceptionsType057
     * @tc.desc Verify IllegalStateError name and message after construction.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e: IllegalStateError = new IllegalStateError('stateful');
      expect(e.name).assertEqual('IllegalStateError');
      expect(e.message).assertEqual('stateful');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_TYPE_5800
     * @tc.name testExceptionsType058
     * @tc.desc Verify multiple exceptions from switch-case all caught correctly.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsType058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const getErr: (code: int) => Error = (code: int): Error => {
        switch (code) {
          case 1:
            return new NoDataError('n1');
          case 2:
            return new ArgumentOutOfRangeError('a1');
          case 3:
            return new IllegalStateError('i1');
          default:
            return new RuntimeError('d1');
        }
      };
      expect(getErr(1).name).assertEqual('NoDataError');
      expect(getErr(2).name).assertEqual('ArgumentOutOfRangeError');
      expect(getErr(3).name).assertEqual('IllegalStateError');
      expect(getErr(0).name).assertEqual('RuntimeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_5900
     * @tc.name testExceptionsInstanceof059
     * @tc.desc Verify Error in logical OR expression short-circuits evaluation correctly.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let evaluated: int = 0;
      const result: boolean = true || withSideEffect(() => { evaluated = 1; }, false);
      expect(result).assertTrue();
      expect(evaluated).assertEqual(0);
      const result2: boolean = new NoDataError('logical') instanceof Error;
      expect(result2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_6000
     * @tc.name testExceptionsInstanceof060
     * @tc.desc Verify Error in logical AND expression evaluates both sides when first true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('and');
      let evaluated: int = 0;
      const result: boolean = err instanceof Error && withSideEffect(() => { evaluated = 1; }, true);
      expect(result).assertTrue();
      expect(evaluated).assertEqual(1);
      const result2: boolean = false && withSideEffect(() => { evaluated = 2; }, true);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_6100
     * @tc.name testExceptionsInstanceof061
     * @tc.desc Verify Error instanceof check works correctly in array filter callback.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const mixed: (Error | string)[] = [new NoDataError('a'), 'text', new RuntimeError('b')];
      const errors: Error[] = [];
      for (let i: int = 0; i < mixed.length; i++) {
        if (mixed[i] instanceof Error) {
          errors.push(mixed[i] as Error);
        }
      }
      expect(errors.length).assertEqual(2);
      expect(errors[0] instanceof NoDataError).assertTrue();
      expect(errors[1] instanceof RuntimeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_6200
     * @tc.name testExceptionsInstanceof062
     * @tc.desc Verify Error message is preserved when mapped through array map callback.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const errs: Error[] = [new NoDataError('first'), new RuntimeError('second')];
      const messages: string[] = errs.map((e: Error): string => e.message);
      expect(messages[0]).assertEqual('first');
      expect(messages[1]).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_6300
     * @tc.name testExceptionsInstanceof063
     * @tc.desc Verify Error thrown in array reduce callback is caught by surrounding try block.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nums: int[] = [1, 2, 3];
      let caught: boolean = false;
      try {
        nums.reduce((acc: int, _: int): int => {
          if (acc === 2) {
            throw new NoDataError('reduce error');
          }
          return acc + 1;
        }, 0);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('NoDataError');
        expect(e.message).assertEqual('reduce error');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_6400
     * @tc.name testExceptionsInstanceof064
     * @tc.desc Verify Error properties are accessible after construction.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('entries');
      expect(err.message).assertEqual('entries');
      expect(err.name).assertEqual('NoDataError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_6500
     * @tc.name testExceptionsInstanceof065
     * @tc.desc Verify Error cause property is preserved after construction with options.cause.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cause: Error = new Error('root');
      const err: NoDataError = new NoDataError('with cause', { cause: cause });
      expect(err.message).assertEqual('with cause');
      expect(err.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_6600
     * @tc.name testExceptionsInstanceof066
     * @tc.desc Verify Error message property can be modified after construction.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('original');
      expect(err.message).assertEqual('original');
      err.message = 'modified';
      expect(err.message).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_6700
     * @tc.name testExceptionsInstanceof067
     * @tc.desc Verify Error cause property can be modified after construction.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('msg', { cause: new Error('old') });
      const newCause: Error = new Error('new cause');
      err.cause = newCause;
      expect(err.cause).assertEqual(newCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_6800
     * @tc.name testExceptionsInstanceof068
     * @tc.desc Verify Error instance works correctly in array indexOf and lastIndexOf.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err1: NoDataError = new NoDataError('a');
      const err2: RuntimeError = new RuntimeError('b');
      const arr: Error[] = [err1, err2, err1];
      expect(arr.indexOf(err1)).assertEqual(0);
      expect(arr.lastIndexOf(err1)).assertEqual(2);
      expect(arr.indexOf(new NoDataError('a'))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_6900
     * @tc.name testExceptionsInstanceof069
     * @tc.desc Verify Error instance works correctly in array includes method.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('test');
      const arr: (Error | string)[] = ['a', err, 'b'];
      expect(arr.includes(err)).assertTrue();
      expect(arr.includes(new NoDataError('test'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_7000
     * @tc.name testExceptionsInstanceof070
     * @tc.desc Verify Error instanceof check works correctly in array some callback.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: (Error | string)[] = ['text', new NoDataError('err'), 'more'];
      const hasError: boolean = arr.some((x): boolean => x instanceof Error);
      expect(hasError).assertTrue();
      const strings: string[] = ['a', 'b', 'c'];
      expect(strings.some((x): boolean => x instanceof Error)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_7100
     * @tc.name testExceptionsInstanceof071
     * @tc.desc Verify Error instanceof check works correctly in array every callback.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const errors: Error[] = [new NoDataError('a'), new RuntimeError('b')];
      const allErrors: boolean = errors.every((x): boolean => x instanceof Error);
      expect(allErrors).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_7200
     * @tc.name testExceptionsInstanceof072
     * @tc.desc Verify Error works correctly in array find and findIndex callbacks.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const errors: Error[] = [new NoDataError('find me'), new RuntimeError('other')];
      const found: Error | undefined = errors.find((e): boolean => e.message === 'find me');
      expect(found instanceof NoDataError).assertTrue();
      const idx: int = errors.findIndex((e): boolean => e.message === 'find me');
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_7300
     * @tc.name testExceptionsInstanceof073
     * @tc.desc Verify Error.toString contains both name and message when both present.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('hello');
      const str: string = err.toString();
      expect(str).assertEqual('NoDataError: hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_7400
     * @tc.name testExceptionsInstanceof074
     * @tc.desc Verify Error.toString returns only name when message is empty string.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('');
      const str: string = err.toString();
      expect(str).assertEqual('NoDataError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_7500
     * @tc.name testExceptionsInstanceof075
     * @tc.desc Verify array literal correctly creates array containing Error instances.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err1: NoDataError = new NoDataError('a');
      const err2: RuntimeError = new RuntimeError('b');
      const arr: Error[] = [err1, err2];
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(err1);
      expect(arr[1]).assertEqual(err2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_INSTANCEOF_7600
     * @tc.name testExceptionsInstanceof076
     * @tc.desc Verify Error can be caught when thrown inside a try-catch block.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsInstanceof076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('sync throw error');
      try {
        throw err;
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
        expect(e instanceof NoDataError).assertTrue();
        expect(e.message).assertEqual('sync throw error');
      }
    });

});
}
