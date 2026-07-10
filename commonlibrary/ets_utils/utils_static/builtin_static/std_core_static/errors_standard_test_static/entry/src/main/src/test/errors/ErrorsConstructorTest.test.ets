'use static';
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class ConstructorCustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'ConstructorCustomError';
  }
}

class ConstructorDeepBaseError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'ConstructorDeepBaseError';
  }
}

class ConstructorDeepLeafError extends ConstructorDeepBaseError {
  constructor(message: string) {
    super(message);
    this.name = 'ConstructorDeepLeafError';
  }
}

class ConstructorTypeBaseError extends TypeError {
  constructor(message: string) {
    super(message);
    this.name = 'ConstructorTypeBaseError';
  }
}

class ConstructorTypeLeafError extends ConstructorTypeBaseError {
  constructor(message: string) {
    super(message);
    this.name = 'ConstructorTypeLeafError';
  }
}

class ConstructorCauseCustomError extends Error {
  constructor(message: string, options: ErrorOptions) {
    super(message, options);
    this.name = 'ConstructorCauseCustomError';
  }
}

class ConstructorStaticHost extends Error {
  static readonly CODE: int = 500;

  constructor(message: string) {
    super(message);
    this.name = 'ConstructorStaticHost';
  }
}

class ConstructorErrorFieldHost {
  readonly readonlyError: Error = new Error('readonly-error');
  optionalError?: Error;
  nullableError: Error | null = null;
  defaultError: Error = new Error('default-error');
}

class ConstructorPlainErrorLike {
  name: string = 'Error';
  message: string = 'plain-message';
}

class ConstructorPrivateError extends Error {
  private constructor(message: string) {
    super(message);
    this.name = 'ConstructorPrivateError';
  }

  static create(message: string): ConstructorPrivateError {
    return new ConstructorPrivateError(message);
  }
}

class ConstructorNameOverrideError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'MySpecialName';
  }
}

class ConstructorGetterThrowHost {
  get errorValue(): Error {
    throw new RangeError('getter-error');
  }
}

class ConstructorVisibilityFieldHost {
  protected protectedError: RangeError = new RangeError('protected-field-error');
  private privateError: Error = new Error('private-field-error');

  getPrivateError(): Error {
    return this.privateError;
  }

  getProtectedError(): RangeError {
    return this.protectedError;
  }
}

interface ConstructorErrorInterface {
  errorValue: Error;
}

class ConstructorInterfaceFieldHost implements ConstructorErrorInterface {
  errorValue: Error = new Error('interface-field-error');
}

class ConstructorSpecialFieldHost {
  error_value: RangeError = new RangeError('underscore-field-error');
}

class ConstructorAccessorErrorHost {
  private storedError: Error = new Error('getter-default');

  get errorValue(): Error {
    return this.storedError;
  }

  set errorValue(value: Error) {
    this.storedError = value;
  }
}

class ConstructorGenericErrorBox<T extends Error> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

class ConstructorCollectionFieldHost {
  errorList: Error[] = [];
  errorMap: Map<string, Error> = new Map<string, Error>();
  errorSet: Set<TypeError> = new Set<TypeError>();

  constructor() {
    this.errorList.push(new Error('array-error'));
    this.errorMap.set('range', new RangeError('map-error'));
    this.errorSet.add(new TypeError('set-error'));
  }
}

class ConstructorCausePayload {
  code: int = 1001;
  detail: string = 'payload-cause';
}

export default function ErrorsConstructorTest(): void {
  describe('ErrorsConstructorTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0001
     * @tc.name testErrorsConstructor0001
     * @tc.desc Verify 0 parameter constructor AssertionError - with all parameters omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new AssertionError();
      expect(e.name).assertEqual('AssertionError');
      expect((e as Error).message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0002
     * @tc.name testErrorsConstructor0002
     * @tc.desc Verify 1 parameter constructor AssertionError - message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new AssertionError("a");
      expect((e as Error).message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0003
     * @tc.name testErrorsConstructor0003
     * @tc.desc Verify 2 parameter constructor AssertionError - message + options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new AssertionError("m", { cause: new Error("c") });
      expect(((e as Error).cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0004
     * @tc.name testErrorsConstructor0004
     * @tc.desc Verify 0 parameter constructor RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError();
      expect(e.name).assertEqual('RangeError');
      expect((e as Error).message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0005
     * @tc.name testErrorsConstructor0005
     * @tc.desc Verify 1 parameter constructor RangeError - message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("range");
      expect((e as Error).message).assertEqual("range");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0006
     * @tc.name testErrorsConstructor0006
     * @tc.desc Verify 2 parameter constructor RangeError - message + options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("r", { cause: "x" });
      expect((e as Error).cause).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0007
     * @tc.name testErrorsConstructor0007
     * @tc.desc Verify 0 parameter constructor TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new TypeError();
      expect(e.name).assertEqual('TypeError');
      expect((e as Error).message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0008
     * @tc.name testErrorsConstructor0008
     * @tc.desc Verify 1 parameter constructor TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new TypeError("t");
      expect((e as Error).message).assertEqual("t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0009
     * @tc.name testErrorsConstructor0009
     * @tc.desc Verify 2 parameter constructor TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new TypeError("t", { cause: 1 });
      expect((e as Error).cause).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0010
     * @tc.name testErrorsConstructor0010
     * @tc.desc Verify 0 parameter constructor SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new SyntaxError();
      expect(e.name).assertEqual('SyntaxError');
      expect((e as Error).message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0011
     * @tc.name testErrorsConstructor0011
     * @tc.desc Verify 1 parameter constructor SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new SyntaxError("s");
      expect((e as Error).message).assertEqual("s");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0012
     * @tc.name testErrorsConstructor0012
     * @tc.desc Verify 2 parameter constructor SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new SyntaxError("s", { cause: true });
      expect((e as Error).cause).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0013
     * @tc.name testErrorsConstructor0013
     * @tc.desc Verify 0 parameter constructor ReferenceError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ReferenceError();
      expect(e.name).assertEqual('ReferenceError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0014
     * @tc.name testErrorsConstructor0014
     * @tc.desc Verify 1 parameter constructor ReferenceError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ReferenceError("r");
      expect((e as Error).message).assertEqual("r");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0015
     * @tc.name testErrorsConstructor0015
     * @tc.desc Verify 2 parameter constructor ReferenceError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ReferenceError("r", { cause: undefined });
      expect(e.name).assertEqual('ReferenceError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0016
     * @tc.name testErrorsConstructor0016
     * @tc.desc Verify 0 parameter constructor URIError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new URIError();
      expect(e.name).assertEqual('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0017
     * @tc.name testErrorsConstructor0017
     * @tc.desc Verify 1 parameter constructor URIError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new URIError("u");
      expect((e as Error).message).assertEqual("u");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0018
     * @tc.name testErrorsConstructor0018
     * @tc.desc Verify 2 parameter constructor URIError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new URIError("u", { cause: 0 });
      expect((e as Error).cause).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0019
     * @tc.name testErrorsConstructor0019
     * @tc.desc Verify 0 parameter constructor EvalError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new EvalError();
      expect(e.name).assertEqual('EvalError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0020
     * @tc.name testErrorsConstructor0020
     * @tc.desc Verify 1 parameter constructor EvalError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new EvalError("ev");
      expect((e as Error).message).assertEqual("ev");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0021
     * @tc.name testErrorsConstructor0021
     * @tc.desc Verify 2 parameter constructor EvalError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new EvalError("ev", { cause: -1 });
      expect((e as Error).cause).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0022
     * @tc.name testErrorsConstructor0022
     * @tc.desc Verify assertionError instantiation instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new AssertionError("a");
      expect(e.name).assertEqual('AssertionError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0023
     * @tc.name testErrorsConstructor0023
     * @tc.desc Verify divideByZeroError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new DivideByZeroError("d");
      expect(e.name).assertEqual('DivideByZeroError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0024
     * @tc.name testErrorsConstructor0024
     * @tc.desc Verify nullPointerError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NullPointerError("np");
      expect(e.name).assertEqual('NullPointerError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0025
     * @tc.name testErrorsConstructor0025
     * @tc.desc Verify uncaughtExceptionError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new UncaughtExceptionError("u");
      expect(e.name).assertEqual('UncaughtExceptionError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0026
     * @tc.name testErrorsConstructor0026
     * @tc.desc Verify syntaxError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new SyntaxError("s");
      expect(e.name).assertEqual('SyntaxError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0027
     * @tc.name testErrorsConstructor0027
     * @tc.desc Verify JSONTypeError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new JSONTypeError();
      expect(e.name).assertEqual('JSONTypeError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0028
     * @tc.name testErrorsConstructor0028
     * @tc.desc Verify negativeArraySizeError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NegativeArraySizeError("n");
      expect(e.name).assertEqual('NegativeArraySizeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0029
     * @tc.name testErrorsConstructor0029
     * @tc.desc Verify negativeArraySizeError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NegativeArraySizeError();
      expect(e.name).assertEqual('NegativeArraySizeError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0030
     * @tc.name testErrorsConstructor0030
     * @tc.desc Verify arrayIndexOutOfBoundsError instanceof RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArrayIndexOutOfBoundsError();
      expect(e instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0031
     * @tc.name testErrorsConstructor0031
     * @tc.desc Verify arithmeticError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArithmeticError("ar");
      expect(e.name).assertEqual('ArithmeticError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0032
     * @tc.name testErrorsConstructor0032
     * @tc.desc Verify outOfMemoryError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new OutOfMemoryError("o");
      expect(e.name).assertEqual('OutOfMemoryError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0033
     * @tc.name testErrorsConstructor0033
     * @tc.desc Verify stackOverflowError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new StackOverflowError("st");
      expect(e.name).assertEqual('StackOverflowError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0034
     * @tc.name testErrorsConstructor0034
     * @tc.desc Verify instantiationError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InstantiationError("in");
      expect(e.name).assertEqual('InstantiationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0035
     * @tc.name testErrorsConstructor0035
     * @tc.desc Verify internalError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InternalError("int");
      expect(e.name).assertEqual('InternalError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0036
     * @tc.name testErrorsConstructor0036
     * @tc.desc Verify indexOutOfBoundsError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new IndexOutOfBoundsError("io");
      expect(e.name).assertEqual('IndexOutOfBoundsError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0037
     * @tc.name testErrorsConstructor0037
     * @tc.desc Verify indexOutOfBoundsError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new IndexOutOfBoundsError();
      expect(e.name).assertEqual('IndexOutOfBoundsError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0038
     * @tc.name testErrorsConstructor0038
     * @tc.desc Verify stringIndexOutOfBoundsError instanceof RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new StringIndexOutOfBoundsError();
      expect(e instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0039
     * @tc.name testErrorsConstructor0039
     * @tc.desc Verify stringIndexOutOfBoundsError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new StringIndexOutOfBoundsError();
      expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0040
     * @tc.name testErrorsConstructor0040
     * @tc.desc Verify classCastError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ClassCastError("cc");
      expect(e.name).assertEqual('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0041
     * @tc.name testErrorsConstructor0041
     * @tc.desc Verify classCastError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ClassCastError();
      expect(e.name).assertEqual('ClassCastError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0042
     * @tc.name testErrorsConstructor0042
     * @tc.desc Verify arrayStoreError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArrayStoreError("as");
      expect(e.name).assertEqual('ArrayStoreError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0043
     * @tc.name testErrorsConstructor0043
     * @tc.desc Verify arrayStoreError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArrayStoreError();
      expect(e.name).assertEqual('ArrayStoreError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0044
     * @tc.name testErrorsConstructor0044
     * @tc.desc Verify exceptionInInitializerError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ExceptionInInitializerError("ei");
      expect(e.name).assertEqual('ExceptionInInitializerError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0045
     * @tc.name testErrorsConstructor0045
     * @tc.desc Verify exceptionInInitializerError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ExceptionInInitializerError();
      expect(e.name).assertEqual('ExceptionInInitializerError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0046
     * @tc.name testErrorsConstructor0046
     * @tc.desc Verify coroutinesLimitExceedError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new CoroutinesLimitExceedError("cl");
      expect(e.name).assertEqual('CoroutinesLimitExceedError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0047
     * @tc.name testErrorsConstructor0047
     * @tc.desc Verify coroutinesLimitExceedError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new CoroutinesLimitExceedError();
      expect(e.name).assertEqual('CoroutinesLimitExceedError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0048
     * @tc.name testErrorsConstructor0048
     * @tc.desc Verify illegalLockStateError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new IllegalLockStateError("il");
      expect(e.name).assertEqual('IllegalLockStateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0049
     * @tc.name testErrorsConstructor0049
     * @tc.desc Verify illegalLockStateError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new IllegalLockStateError();
      expect(e.name).assertEqual('IllegalLockStateError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0050
     * @tc.name testErrorsConstructor0050
     * @tc.desc Verify invalidJobOperationError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InvalidJobOperationError("ij");
      expect(e.name).assertEqual('InvalidJobOperationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0051
     * @tc.name testErrorsConstructor0051
     * @tc.desc Verify invalidJobOperationError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InvalidJobOperationError();
      expect(e.name).assertEqual('InvalidJobOperationError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0052
     * @tc.name testErrorsConstructor0052
     * @tc.desc Verify argumentsUnderapplicationError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArgumentsUnderapplicationError("au");
      expect(e.name).assertEqual('ArgumentsUnderapplicationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0053
     * @tc.name testErrorsConstructor0053
     * @tc.desc Verify argumentsUnderapplicationError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArgumentsUnderapplicationError();
      expect(e.name).assertEqual('ArgumentsUnderapplicationError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0054
     * @tc.name testErrorsConstructor0054
     * @tc.desc Verify invalidStoreAccessError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InvalidStoreAccessError("is");
      expect(e.name).assertEqual('InvalidStoreAccessError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0055
     * @tc.name testErrorsConstructor0055
     * @tc.desc Verify invalidStoreAccessError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InvalidStoreAccessError();
      expect(e.name).assertEqual('InvalidStoreAccessError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0056
     * @tc.name testErrorsConstructor0056
     * @tc.desc Verify evalError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new EvalError("e");
      expect(e.name).assertEqual('EvalError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0057
     * @tc.name testErrorsConstructor0057
     * @tc.desc Verify nonIntegralIndexError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NonIntegralIndexError("ni");
      expect(e.name).assertEqual('NonIntegralIndexError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0058
     * @tc.name testErrorsConstructor0058
     * @tc.desc Verify nonIntegralIndexError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NonIntegralIndexError();
      expect(e.name).assertEqual('NonIntegralIndexError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0059
     * @tc.name testErrorsConstructor0059
     * @tc.desc Verify typeError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new TypeError("t");
      expect(e.name).assertEqual('TypeError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0060
     * @tc.name testErrorsConstructor0060
     * @tc.desc Verify referenceError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ReferenceError("r");
      expect(e.name).assertEqual('ReferenceError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0061
     * @tc.name testErrorsConstructor0061
     * @tc.desc Verify URIError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new URIError("u");
      expect(e.name).assertEqual('URIError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0062
     * @tc.name testErrorsConstructor0062
     * @tc.desc Verify formatError instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new FormatError("f");
      expect(e.name).assertEqual('FormatError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0063
     * @tc.name testErrorsConstructor0063
     * @tc.desc Verify formatError instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new FormatError();
      expect(e.name).assertEqual('FormatError');
      expect(e instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0064
     * @tc.name testErrorsConstructor0064
     * @tc.desc Verify message length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new TypeError("a");
      expect((e as Error).message.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0065
     * @tc.name testErrorsConstructor0065
     * @tc.desc Verify message length 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longValue = "a".repeat(10000);
      const e = new RangeError(longValue);
      expect((e as Error).message.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0066
     * @tc.name testErrorsConstructor0066
     * @tc.desc Verify message istemplate string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError(`template`);
      expect((e as Error).message).assertEqual("template");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0067
     * @tc.name testErrorsConstructor0067
     * @tc.desc Verify message DivideByZeroError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new DivideByZeroError("div-msg");
      expect((e as Error).message).assertEqual("div-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0068
     * @tc.name testErrorsConstructor0068
     * @tc.desc Verify message NullPointerError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NullPointerError("npe-msg");
      expect((e as Error).message).assertEqual("npe-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0069
     * @tc.name testErrorsConstructor0069
     * @tc.desc Verify message UncaughtExceptionError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new UncaughtExceptionError("uce-msg");
      expect((e as Error).message).assertEqual("uce-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0070
     * @tc.name testErrorsConstructor0070
     * @tc.desc Verify message JSONTypeError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new JSONTypeError("json-msg");
      expect((e as Error).message).assertEqual("json-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0071
     * @tc.name testErrorsConstructor0071
     * @tc.desc Verify message NegativeArraySizeError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NegativeArraySizeError("nas-msg");
      expect((e as Error).message).assertEqual("nas-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0072
     * @tc.name testErrorsConstructor0072
     * @tc.desc Verify message ArrayIndexOutOfBoundsError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArrayIndexOutOfBoundsError("aioob-msg");
      expect((e as Error).message).assertEqual("aioob-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0073
     * @tc.name testErrorsConstructor0073
     * @tc.desc Verify message ArithmeticError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArithmeticError("arith-msg");
      expect((e as Error).message).assertEqual("arith-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0074
     * @tc.name testErrorsConstructor0074
     * @tc.desc Verify message OutOfMemoryError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new OutOfMemoryError("oom-msg");
      expect((e as Error).message).assertEqual("oom-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0075
     * @tc.name testErrorsConstructor0075
     * @tc.desc Verify message StackOverflowError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new StackOverflowError("sof-msg");
      expect((e as Error).message).assertEqual("sof-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0076
     * @tc.name testErrorsConstructor0076
     * @tc.desc Verify message InstantiationError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InstantiationError("inst-msg");
      expect((e as Error).message).assertEqual("inst-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0077
     * @tc.name testErrorsConstructor0077
     * @tc.desc Verify message InternalError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InternalError("intern-msg");
      expect((e as Error).message).assertEqual("intern-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0078
     * @tc.name testErrorsConstructor0078
     * @tc.desc Verify message IndexOutOfBoundsError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new IndexOutOfBoundsError("ioob-msg");
      expect((e as Error).message).assertEqual("ioob-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0079
     * @tc.name testErrorsConstructor0079
     * @tc.desc Verify message StringIndexOutOfBoundsError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new StringIndexOutOfBoundsError("sioob-msg");
      expect((e as Error).message).assertEqual("sioob-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0080
     * @tc.name testErrorsConstructor0080
     * @tc.desc Verify message ClassCastError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ClassCastError("cce-msg");
      expect((e as Error).message).assertEqual("cce-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0081
     * @tc.name testErrorsConstructor0081
     * @tc.desc Verify message ArrayStoreError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArrayStoreError("ase-msg");
      expect((e as Error).message).assertEqual("ase-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0082
     * @tc.name testErrorsConstructor0082
     * @tc.desc Verify message ExceptionInInitializerError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ExceptionInInitializerError("eii-msg");
      expect((e as Error).message).assertEqual("eii-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0083
     * @tc.name testErrorsConstructor0083
     * @tc.desc Verify message CoroutinesLimitExceedError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new CoroutinesLimitExceedError("cle-msg");
      expect((e as Error).message).assertEqual("cle-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0084
     * @tc.name testErrorsConstructor0084
     * @tc.desc Verify message IllegalLockStateError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new IllegalLockStateError("ils-msg");
      expect((e as Error).message).assertEqual("ils-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0085
     * @tc.name testErrorsConstructor0085
     * @tc.desc Verify message InvalidJobOperationError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InvalidJobOperationError("ijo-msg");
      expect((e as Error).message).assertEqual("ijo-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0086
     * @tc.name testErrorsConstructor0086
     * @tc.desc Verify message ArgumentsUnderapplicationError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArgumentsUnderapplicationError("aua-msg");
      expect((e as Error).message).assertEqual("aua-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0087
     * @tc.name testErrorsConstructor0087
     * @tc.desc Verify message InvalidStoreAccessError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InvalidStoreAccessError("isa-msg");
      expect((e as Error).message).assertEqual("isa-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0088
     * @tc.name testErrorsConstructor0088
     * @tc.desc Verify message NonIntegralIndexError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NonIntegralIndexError("nii-msg");
      expect((e as Error).message).assertEqual("nii-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0089
     * @tc.name testErrorsConstructor0089
     * @tc.desc Verify message FormatError on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new FormatError("fmt-msg");
      expect((e as Error).message).assertEqual("fmt-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0090
     * @tc.name testErrorsConstructor0090
     * @tc.desc Verify options.cause is Error instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("inner");
      const e = new RangeError("m", { cause: inner });
      expect(((e as Error).cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0091
     * @tc.name testErrorsConstructor0091
     * @tc.desc Verify options.cause is RangeError nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new RangeError("rng-inner");
      const e = new TypeError("m", { cause: inner });
      expect((e as Error).cause instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0092
     * @tc.name testErrorsConstructor0092
     * @tc.desc Verify options.cause is TypeError nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new TypeError("t-inner");
      const e = new RangeError("m", { cause: inner });
      expect((e as Error).cause instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0093
     * @tc.name testErrorsConstructor0093
     * @tc.desc Verify options.cause is SyntaxError nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new SyntaxError("s-inner");
      const e = new RangeError("m", { cause: inner });
      expect((e as Error).cause instanceof SyntaxError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0094
     * @tc.name testErrorsConstructor0094
     * @tc.desc Verify options.cause is ReferenceError nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new ReferenceError("r-inner");
      const e = new RangeError("m", { cause: inner });
      expect((e as Error).cause instanceof ReferenceError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0095
     * @tc.name testErrorsConstructor0095
     * @tc.desc Verify options.cause is URIError nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new URIError("u-inner");
      const e = new RangeError("m", { cause: inner });
      expect((e as Error).cause instanceof URIError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0096
     * @tc.name testErrorsConstructor0096
     * @tc.desc Verify options.cause is EvalError nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new EvalError("ev-inner");
      const e = new RangeError("m", { cause: inner });
      expect((e as Error).cause instanceof EvalError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0097
     * @tc.name testErrorsConstructor0097
     * @tc.desc Verify options.cause is integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("m", { cause: 42 });
      expect((e as Error).cause).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0098
     * @tc.name testErrorsConstructor0098
     * @tc.desc Verify options.cause is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("m", { cause: -1 });
      expect((e as Error).cause).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0099
     * @tc.name testErrorsConstructor0099
     * @tc.desc Verify options.cause is floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("m", { cause: 3.14 });
      expect((e as Error).cause).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0100
     * @tc.name testErrorsConstructor0100
     * @tc.desc Verify options.cause is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("m", { cause: true });
      expect((e as Error).cause).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0101
     * @tc.name testErrorsConstructor0101
     * @tc.desc Verify options.cause is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("m", { cause: false });
      expect((e as Error).cause).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0102
     * @tc.name testErrorsConstructor0102
     * @tc.desc Verify options.cause is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("m", { cause: undefined });
      expect(e.name).assertEqual('RangeError');
      expect((e as Error).cause).assertEqual(undefined);
      expect((e as Error).message).assertEqual('m');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0103
     * @tc.name testErrorsConstructor0103
     * @tc.desc Verify options.cause nested chained 3-level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lvl1 = new Error("lvl1");
      const lvl2 = new TypeError("lvl2", { cause: lvl1 });
      const e = new RangeError("top", { cause: lvl2 });
      expect((((e as Error).cause as Error).cause as Error).message).assertEqual("lvl1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0104
     * @tc.name testErrorsConstructor0104
     * @tc.desc Verify options.cause nested chained 4-level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Error("a");
      const b = new TypeError("b", { cause: a });
      const c = new SyntaxError("c", { cause: b });
      const e = new RangeError("d", { cause: c });
      expect(((((e as Error).cause as Error).cause as Error).cause as Error).message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0105
     * @tc.name testErrorsConstructor0105
     * @tc.desc Verify options.cause is Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("m", { cause: Number.MAX_VALUE });
      expect((e as Error).cause).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0106
     * @tc.name testErrorsConstructor0106
     * @tc.desc Verify options.cause DivideByZeroError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new DivideByZeroError("d", { cause: 1 });
      expect((e as Error).cause).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0107
     * @tc.name testErrorsConstructor0107
     * @tc.desc Verify options.cause NullPointerError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NullPointerError("n", { cause: "s" });
      expect((e as Error).cause).assertEqual("s");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0108
     * @tc.name testErrorsConstructor0108
     * @tc.desc Verify options.cause UncaughtExceptionError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new UncaughtExceptionError("u", { cause: true });
      expect((e as Error).cause).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0109
     * @tc.name testErrorsConstructor0109
     * @tc.desc Verify options.cause JSONTypeError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new JSONTypeError("j", { cause: new Error("c") });
      expect(((e as Error).cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0110
     * @tc.name testErrorsConstructor0110
     * @tc.desc Verify options.cause NegativeArraySizeError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NegativeArraySizeError("n", { cause: -5 });
      expect((e as Error).cause).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0111
     * @tc.name testErrorsConstructor0111
     * @tc.desc Verify options.cause ArrayIndexOutOfBoundsError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArrayIndexOutOfBoundsError("a", { cause: 100 });
      expect((e as Error).cause).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0112
     * @tc.name testErrorsConstructor0112
     * @tc.desc Verify options.cause ArithmeticError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArithmeticError("a", { cause: "div-zero" });
      expect((e as Error).cause).assertEqual("div-zero");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0113
     * @tc.name testErrorsConstructor0113
     * @tc.desc Verify options.cause OutOfMemoryError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new OutOfMemoryError("o", { cause: 999 });
      expect((e as Error).cause).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0114
     * @tc.name testErrorsConstructor0114
     * @tc.desc Verify options.cause StackOverflowError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new StackOverflowError("s", { cause: new Error("rec") });
      expect(((e as Error).cause as Error).message).assertEqual("rec");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0115
     * @tc.name testErrorsConstructor0115
     * @tc.desc Verify options.cause InstantiationError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InstantiationError("i", { cause: "abstract" });
      expect((e as Error).cause).assertEqual("abstract");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0116
     * @tc.name testErrorsConstructor0116
     * @tc.desc Verify options.cause InternalError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InternalError("i", { cause: 0 });
      expect((e as Error).cause).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0117
     * @tc.name testErrorsConstructor0117
     * @tc.desc Verify options.cause IndexOutOfBoundsError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new IndexOutOfBoundsError("i", { cause: 200 });
      expect((e as Error).cause).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0118
     * @tc.name testErrorsConstructor0118
     * @tc.desc Verify options.cause StringIndexOutOfBoundsError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new StringIndexOutOfBoundsError("s", { cause: 50 });
      expect((e as Error).cause).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0119
     * @tc.name testErrorsConstructor0119
     * @tc.desc Verify options.cause ClassCastError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ClassCastError("c", { cause: "cast" });
      expect((e as Error).cause).assertEqual("cast");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0120
     * @tc.name testErrorsConstructor0120
     * @tc.desc Verify options.cause ArrayStoreError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArrayStoreError("a", { cause: false });
      expect((e as Error).cause).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0121
     * @tc.name testErrorsConstructor0121
     * @tc.desc Verify options.cause ExceptionInInitializerError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ExceptionInInitializerError("e", { cause: new Error("init") });
      expect(((e as Error).cause as Error).message).assertEqual("init");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0122
     * @tc.name testErrorsConstructor0122
     * @tc.desc Verify options.cause CoroutinesLimitExceedError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new CoroutinesLimitExceedError("c", { cause: 1024 });
      expect((e as Error).cause).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0123
     * @tc.name testErrorsConstructor0123
     * @tc.desc Verify options.cause IllegalLockStateError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new IllegalLockStateError("i", { cause: "lock" });
      expect((e as Error).cause).assertEqual("lock");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0124
     * @tc.name testErrorsConstructor0124
     * @tc.desc Verify options.cause InvalidJobOperationError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InvalidJobOperationError("i", { cause: 7 });
      expect((e as Error).cause).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0125
     * @tc.name testErrorsConstructor0125
     * @tc.desc Verify options.cause ArgumentsUnderapplicationError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArgumentsUnderapplicationError("a", { cause: 1 });
      expect((e as Error).cause).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0126
     * @tc.name testErrorsConstructor0126
     * @tc.desc Verify options.cause InvalidStoreAccessError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InvalidStoreAccessError("i", { cause: "store" });
      expect((e as Error).cause).assertEqual("store");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0127
     * @tc.name testErrorsConstructor0127
     * @tc.desc Verify options.cause NonIntegralIndexError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NonIntegralIndexError("n", { cause: 0.5 });
      expect((e as Error).cause).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0128
     * @tc.name testErrorsConstructor0128
     * @tc.desc Verify options.cause FormatError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new FormatError("f", { cause: "bad-format" });
      expect((e as Error).cause).assertEqual("bad-format");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0129
     * @tc.name testErrorsConstructor0129
     * @tc.desc Verify options.cause EvalError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new EvalError("e", { cause: new Error("ev") });
      expect(((e as Error).cause as Error).message).assertEqual("ev");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0130
     * @tc.name testErrorsConstructor0130
     * @tc.desc Verify options.cause URIError on attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new URIError("u", { cause: "%-encoding" });
      expect((e as Error).cause).assertEqual("%-encoding");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0131
     * @tc.name testErrorsConstructor0131
     * @tc.desc Verify options.cause cross subtype RangeError TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new RangeError("rng");
      const e = new TypeError("t", { cause: inner });
      expect(((e as Error).cause as Error).message).assertEqual("rng");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0132
     * @tc.name testErrorsConstructor0132
     * @tc.desc Verify options.cause cross subtype IndexOutOfBoundsError ReferenceError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new IndexOutOfBoundsError("idx");
      const e = new ReferenceError("r", { cause: inner });
      expect((e as Error).cause instanceof IndexOutOfBoundsError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0133
     * @tc.name testErrorsConstructor0133
     * @tc.desc Verify options.cause type RangeError RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new RangeError("inner");
      const e = new RangeError("outer", { cause: inner });
      expect(((e as Error).cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0134
     * @tc.name testErrorsConstructor0134
     * @tc.desc Verify with all parameters omitted + RangeError default message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError();
      expect((e as Error).message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0135
     * @tc.name testErrorsConstructor0135
     * @tc.desc Verify options omitted message - explicit undefined message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError(undefined, { cause: "c" });
      expect((e as Error).cause).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0136
     * @tc.name testErrorsConstructor0136
     * @tc.desc Verify message + options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("m", { cause: "c" });
      expect((e as Error).message).assertEqual("m");
      expect((e as Error).cause).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0137
     * @tc.name testErrorsConstructor0137
     * @tc.desc Verify options TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new TypeError(undefined, { cause: 9 });
      expect((e as Error).cause).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0138
     * @tc.name testErrorsConstructor0138
     * @tc.desc Verify options SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new SyntaxError(undefined, { cause: true });
      expect((e as Error).cause).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0139
     * @tc.name testErrorsConstructor0139
     * @tc.desc Verify message + explicit undefined options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("m", undefined);
      expect((e as Error).message).assertEqual("m");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0140
     * @tc.name testErrorsConstructor0140
     * @tc.desc Verify constructor return value non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("m");
      expect(e.name).assertEqual('RangeError');
      expect((e as Error).message).assertEqual("m");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0141
     * @tc.name testErrorsConstructor0141
     * @tc.desc Verify constructor returns instanceof subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new TypeError("m");
      expect(e.name).assertEqual('TypeError');
      expect(e instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0142
     * @tc.name testErrorsConstructor0142
     * @tc.desc Verify constructor returns object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new RangeError("a");
      const b = new RangeError("a");
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0143
     * @tc.name testErrorsConstructor0143
     * @tc.desc Verify message subtype independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new RangeError("same");
      const b = new TypeError("same");
      expect(a.message).assertEqual("same");
      expect(b.message).assertEqual("same");
      expect(a.name).assertEqual('RangeError');
      expect(b.name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0144
     * @tc.name testErrorsConstructor0144
     * @tc.desc Verify rangeError subtype name and instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("m");
      expect(e.name).assertEqual('RangeError');
      expect(e instanceof RangeError).assertTrue();
    }); 
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0145
     * @tc.name testErrorsConstructor0145
     * @tc.desc Verify negativeArraySizeError subtype name and parent chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NegativeArraySizeError("m");
      expect(e.name).assertEqual('NegativeArraySizeError');
      expect(e instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0146
     * @tc.name testErrorsConstructor0146
     * @tc.desc Verify arrayIndexOutOfBoundsError subtype name and parent chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArrayIndexOutOfBoundsError("m");
      expect(e.name).assertEqual('ArrayIndexOutOfBoundsError');
      expect(e instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0147
     * @tc.name testErrorsConstructor0147
     * @tc.desc Verify constructor returns instance throw catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: Error | undefined = undefined;
      try {
        throw new RangeError("thrown");
      } catch (e) {
        caught = e as Error;
        expect((e as Error).name).assertEqual("RangeError");
      }
      expect(caught!.message).assertEqual("thrown");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0148
     * @tc.name testErrorsConstructor0148
     * @tc.desc Verify throw catch instanceof subtype preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isType = false;
      try {
        throw new TypeError("t");
      } catch (e) {
        isType = e instanceof TypeError;
        expect(e instanceof TypeError).assertTrue();
        expect((e as Error).name).assertEqual("TypeError");
      }
      expect(isType).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0149
     * @tc.name testErrorsConstructor0149
     * @tc.desc Verify cause throw catch pass through
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: string = '';
      try {
        throw new RangeError("m", { cause: "c" });
      } catch (e) {
        cause = (e as Error).cause as string;
        expect((e as Error).name).assertEqual("RangeError");
      }
      expect(cause).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0150
     * @tc.name testErrorsConstructor0150
     * @tc.desc Verify constructor empty string message instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("");
      expect(e.name).assertEqual('RangeError');
      expect(e.message).assertEqual('');
      expect(e instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0151
     * @tc.name testErrorsConstructor0151
     * @tc.desc Verify constructornested cause instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("m", { cause: new TypeError("t") });
      expect(e.name).assertEqual('RangeError');
      expect(e.cause instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0152
     * @tc.name testErrorsConstructor0152
     * @tc.desc Verify emoji message length UTF-16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("😀");
      expect((e as Error).message.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0153
     * @tc.name testErrorsConstructor0153
     * @tc.desc Verify AssertionError constructor name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new AssertionError("x");
      expect(e.name).assertEqual('AssertionError');
      expect((e as Error).message).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0154
     * @tc.name testErrorsConstructor0154
     * @tc.desc Verify SyntaxError constructor preserves cause message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new SyntaxError("s", { cause: new Error("c") });
      expect(((e as Error).cause as Error).message).assertEqual("c");
    }); 
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0155
     * @tc.name testErrorsConstructor0155
     * @tc.desc Verify OutOfMemoryError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new OutOfMemoryError();
      expect(e.name).assertEqual('OutOfMemoryError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0156
     * @tc.name testErrorsConstructor0156
     * @tc.desc Verify StackOverflowError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new StackOverflowError();
      expect(e.name).assertEqual('StackOverflowError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0157
     * @tc.name testErrorsConstructor0157
     * @tc.desc Verify InternalError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InternalError();
      expect(e.name).assertEqual('InternalError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0158
     * @tc.name testErrorsConstructor0158
     * @tc.desc Verify ClassCastError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ClassCastError();
      expect(e.name).assertEqual('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0159
     * @tc.name testErrorsConstructor0159
     * @tc.desc Verify ArrayStoreError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArrayStoreError();
      expect(e.name).assertEqual('ArrayStoreError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0160
     * @tc.name testErrorsConstructor0160
     * @tc.desc Verify ExceptionInInitializerError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ExceptionInInitializerError();
      expect(e.name).assertEqual('ExceptionInInitializerError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0161
     * @tc.name testErrorsConstructor0161
     * @tc.desc Verify CoroutinesLimitExceedError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new CoroutinesLimitExceedError();
      expect(e.name).assertEqual('CoroutinesLimitExceedError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0162
     * @tc.name testErrorsConstructor0162
     * @tc.desc Verify IllegalLockStateError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new IllegalLockStateError();
      expect(e.name).assertEqual('IllegalLockStateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0163
     * @tc.name testErrorsConstructor0163
     * @tc.desc Verify InvalidJobOperationError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InvalidJobOperationError();
      expect(e.name).assertEqual('InvalidJobOperationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0164
     * @tc.name testErrorsConstructor0164
     * @tc.desc Verify ArgumentsUnderapplicationError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArgumentsUnderapplicationError();
      expect(e.name).assertEqual('ArgumentsUnderapplicationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0165
     * @tc.name testErrorsConstructor0165
     * @tc.desc Verify InvalidStoreAccessError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InvalidStoreAccessError();
      expect(e.name).assertEqual('InvalidStoreAccessError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0166
     * @tc.name testErrorsConstructor0166
     * @tc.desc Verify NonIntegralIndexError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NonIntegralIndexError();
      expect(e.name).assertEqual('NonIntegralIndexError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0167
     * @tc.name testErrorsConstructor0167
     * @tc.desc Verify FormatError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new FormatError();
      expect(e.name).assertEqual('FormatError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0168
     * @tc.name testErrorsConstructor0168
     * @tc.desc Verify ArithmeticError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ArithmeticError();
      expect(e.name).assertEqual('ArithmeticError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0169
     * @tc.name testErrorsConstructor0169
     * @tc.desc Verify InstantiationError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new InstantiationError();
      expect(e.name).assertEqual('InstantiationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0170
     * @tc.name testErrorsConstructor0170
     * @tc.desc Verify DivideByZeroError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new DivideByZeroError();
      expect(e.name).assertEqual('DivideByZeroError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0171
     * @tc.name testErrorsConstructor0171
     * @tc.desc Verify NullPointerError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new NullPointerError();
      expect(e.name).assertEqual('NullPointerError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0172
     * @tc.name testErrorsConstructor0172
     * @tc.desc Verify UncaughtExceptionError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new UncaughtExceptionError();
      expect(e.name).assertEqual('UncaughtExceptionError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0173
     * @tc.name testErrorsConstructor0173
     * @tc.desc Verify JSONTypeError constructor default name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new JSONTypeError();
      expect(e.name).assertEqual('JSONTypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0174
     * @tc.name testErrorsConstructor0174
     * @tc.desc Verify constructor preserves nested cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new RangeError("a");
      const b = new TypeError("b", { cause: a });
      const e = new SyntaxError("c", { cause: b });
      expect((((e as Error).cause as Error).cause as Error).message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0175
     * @tc.name testErrorsConstructor0175
     * @tc.desc Verify constructor cause nested instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new SyntaxError("s");
      const e = new RangeError("m", { cause: inner });
      expect(e.cause instanceof SyntaxError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0176
     * @tc.name testErrorsConstructor0176
     * @tc.desc Verify nested constructor preserves cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("deep");
      const a = new RangeError("a", { cause: inner });
      const b = new RangeError("b", { cause: a });
      const c = new RangeError("c", { cause: b });
      expect((((c.cause as Error).cause as Error).cause as Error).message).assertEqual("deep");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0177
     * @tc.name testErrorsConstructor0177
     * @tc.desc Verify constructor preserves long message length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new RangeError("a".repeat(65535));
      expect((e as Error).message.length).assertEqual(65535);
      expect(e.name).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0178
     * @tc.name testErrorsConstructor0178
     * @tc.desc Verify base Error constructor default name and empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error();
      expect(e.name).assertEqual('Error');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0179
     * @tc.name testErrorsConstructor0179
     * @tc.desc Verify base Error constructor preserves message and cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new RangeError('cause-error');
      const e = new Error('base-error', { cause: cause });
      expect(e.name).assertEqual('Error');
      expect(e.message).assertEqual('base-error');
      expect(e.cause instanceof RangeError).assertTrue();
      expect((e.cause as Error).message).assertEqual('cause-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0180
     * @tc.name testErrorsConstructor0180
     * @tc.desc Verify Error message constructed from object string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Object();
      const e = new Error(source.toString());
      expect(e.message).assertEqual('[object Object]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0181
     * @tc.name testErrorsConstructor0181
     * @tc.desc Verify custom Error subclass constructor keeps concrete type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ConstructorCustomError('custom-error');
      expect(e.name).assertEqual('ConstructorCustomError');
      expect(e.message).assertEqual('custom-error');
      expect(e instanceof ConstructorCustomError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0182
     * @tc.name testErrorsConstructor0182
     * @tc.desc Verify deep custom Error subclass constructor keeps leaf type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ConstructorDeepLeafError('deep-error');
      expect(e.name).assertEqual('ConstructorDeepLeafError');
      expect(e instanceof ConstructorDeepLeafError).assertTrue();
      expect(e instanceof ConstructorDeepBaseError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0183
     * @tc.name testErrorsConstructor0183
     * @tc.desc Verify static readonly error code host value is readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ConstructorStaticHost('static-error');
      expect(ConstructorStaticHost.CODE).assertEqual(500);
      expect(e.message).assertEqual('static-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0184
     * @tc.name testErrorsConstructor0184
     * @tc.desc Verify optional readonly nullable and default error fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const host = new ConstructorErrorFieldHost();
      expect(host.readonlyError.message).assertEqual('readonly-error');
      expect(host.optionalError).assertUndefined();
      expect(host.nullableError).assertEqual(null);
      expect(host.defaultError.message).assertEqual('default-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0185
     * @tc.name testErrorsConstructor0185
     * @tc.desc Verify uninitialized error reference can be undefined before assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error | undefined = undefined;
      expect(e).assertUndefined();
      e = new Error('assigned-error');
      expect(e.message).assertEqual('assigned-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0186
     * @tc.name testErrorsConstructor0186
     * @tc.desc Verify constructed Error keeps prototype association
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error('created-error');
      expect(e.name).assertEqual('Error');
      expect(e.message).assertEqual('created-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0187
     * @tc.name testErrorsConstructor0187
     * @tc.desc Verify Error own message is writable and enumerable keys exclude built in fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error('descriptor-error');
      e.message = 'descriptor-updated';
      expect(e.message).assertEqual('descriptor-updated');
      const keys = Object.keys(e);
      expect(keys.includes('message')).assertFalse();
      expect(keys.includes('name')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0188
     * @tc.name testErrorsConstructor0188
     * @tc.desc Verify Error name stays on prototype and is not own enumerable property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error('name-error');
      expect(e.name).assertEqual('Error');
      expect(Object.keys(e).includes('name')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0189
     * @tc.name testErrorsConstructor0189
     * @tc.desc Verify constructed errors keep readable fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const range = new RangeError('range-error');
      const type = new TypeError('type-error');
      const syntax = new SyntaxError('syntax-error');
      expect(range.message).assertEqual('range-error');
      expect(type.message).assertEqual('type-error');
      expect(syntax.message).assertEqual('syntax-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0190
     * @tc.name testErrorsConstructor0190
     * @tc.desc Verify plain object with name and message is not Error instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const plain = new ConstructorPlainErrorLike();
      expect(plain.name).assertEqual('Error');
      expect(plain.message).assertEqual('plain-message');
      expect(plain instanceof Error).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0191
     * @tc.name testErrorsConstructor0191
     * @tc.desc Verify private constructor error can expose instance through static factory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = ConstructorPrivateError.create('private-error');
      expect(e.name).assertEqual('ConstructorPrivateError');
      expect(e.message).assertEqual('private-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0192
     * @tc.name testErrorsConstructor0192
     * @tc.desc Verify custom Error subclass can override instance name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ConstructorNameOverrideError('named-error');
      expect(e.name).assertEqual('MySpecialName');
      expect(e.message).assertEqual('named-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0193
     * @tc.name testErrorsConstructor0193
     * @tc.desc Verify getter that throws error reports precise constructor type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const host = new ConstructorGetterThrowHost();
      let valueName: string = '';
      try {
        valueName = host.errorValue.name;
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
        expect((e as Error).message).assertEqual('getter-error');
      }
      expect(valueName).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0194
     * @tc.name testErrorsConstructor0194
     * @tc.desc Verify constructed error fields are stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error('cached-error', { cause: new TypeError('cached-cause') });
      expect(e.name).assertEqual('Error');
      expect(e.message).assertEqual('cached-error');
      expect((e.cause as Error).message).assertEqual('cached-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0195
     * @tc.name testErrorsConstructor0195
     * @tc.desc Verify Error object remains readable through prototype chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error('stable-prototype');
      expect(e.message).assertEqual('stable-prototype');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0196
     * @tc.name testErrorsConstructor0196
     * @tc.desc Verify custom Error subclass construction (test point 11)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ConstructorCustomError("custom");
      expect(e.name).assertEqual('ConstructorCustomError');
      expect((e as Error).message).assertEqual("custom");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0197
     * @tc.name testErrorsConstructor0197
     * @tc.desc Verify deep inheritance chain CustomError -> BaseError -> Error (test point 12)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ConstructorDeepLeafError("deep");
      expect(e.name).assertEqual('ConstructorDeepLeafError');
      expect(e instanceof ConstructorDeepBaseError).assertTrue();
      expect((e as Error).message).assertEqual("deep");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0198
     * @tc.name testErrorsConstructor0198
     * @tc.desc Verify static readonly field value CODE = 500 (test point 22)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstructorStaticHost.CODE).assertEqual(500);
      const e = new ConstructorStaticHost("msg");
      expect(e.name).assertEqual('ConstructorStaticHost');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0199
     * @tc.name testErrorsConstructor0199
     * @tc.desc Verify cause property nested Error chain (test point 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("inner");
      const e = new Error("outer", { cause: inner });
      expect((e.cause as Error).message).assertEqual("inner");
      expect((e.cause as Error).name).assertEqual("Error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0200
     * @tc.name testErrorsConstructor0200
     * @tc.desc Verify deeply nested cause chain Error in Error (test point 43)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root = new Error("root");
      const mid = new TypeError("mid", { cause: root });
      const outer = new RangeError("outer", { cause: mid });
      expect(((outer.cause as Error).cause as Error).message).assertEqual("root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0201
     * @tc.name testErrorsConstructor0201
     * @tc.desc Verify private constructor error class via static factory (test point 104)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = ConstructorPrivateError.create("private");
      expect(e.name).assertEqual('ConstructorPrivateError');
      expect((e as Error).message).assertEqual("private");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0202
     * @tc.name testErrorsConstructor0202
     * @tc.desc Verify error subclass overrides name property (test point 112)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ConstructorNameOverrideError("msg");
      expect(e.name).assertEqual('MySpecialName');
      expect((e as Error).message).assertEqual("msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0203
     * @tc.name testErrorsConstructor0203
     * @tc.desc Verify non-Error subclass with message and name (test point 94)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new ConstructorPlainErrorLike();
      expect(obj.name).assertEqual('Error');
      expect(obj.message).assertEqual('plain-message');
      expect(obj instanceof Error).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0204
     * @tc.name testErrorsConstructor0204
     * @tc.desc Verify super long message 100000 chars no crash (test point 81)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMsg = "z".repeat(100000);
      const e = new Error(longMsg);
      expect((e as Error).message.length).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0205
     * @tc.name testErrorsConstructor0205
     * @tc.desc Verify empty string message boundary (test point 82)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error("");
      expect((e as Error).message).assertEqual("");
      expect(e.name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0206
     * @tc.name testErrorsConstructor0206
     * @tc.desc Verify circular cause reference no infinite loop (test point 84)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const e2: Error = new Error("b");
      e1.cause = e2;
      e2.cause = e1;
      expect((e1.cause as Error).message).assertEqual("b");
      expect(((e1.cause as Error).cause as Error).message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0207
     * @tc.name testErrorsConstructor0207
     * @tc.desc Verify ErrorOptions with undefined cause behaves as no cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const opts: ErrorOptions = { cause: undefined };
      const err = new Error("undef-cause-opts", opts);
      expect(err.message).assertEqual("undef-cause-opts");
      expect(err.name).assertEqual("Error");
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0208
     * @tc.name testErrorsConstructor0208
     * @tc.desc Verify AggregateError empty constructor state (test points 9 and 38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new AggregateError([] as Error[], 'empty-aggregate');
      expect(e.name).assertEqual('AggregateError');
      expect(e.message).assertEqual('empty-aggregate');
      expect(e.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0209
     * @tc.name testErrorsConstructor0209
     * @tc.desc Verify AggregateError keeps mixed native and custom errors (test point 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new ConstructorCustomError('custom-aggregate');
      const e =
        new AggregateError([new RangeError('range-aggregate'), new TypeError('type-aggregate'), custom], 'mixed');
      expect(e.errors.length).assertEqual(3);
      expect(e.errors[0] instanceof RangeError).assertTrue();
      expect(e.errors[1] instanceof TypeError).assertTrue();
      expect(e.errors[2] instanceof ConstructorCustomError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0210
     * @tc.name testErrorsConstructor0210
     * @tc.desc Verify nested AggregateError preserves inner element types (test points 36, 37 and 39)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new RangeError('inner-range'), new TypeError('inner-type')], 'inner');
      const outer = new AggregateError([inner], 'outer');
      const nested = outer.errors[0] as AggregateError;
      expect(nested.name).assertEqual('AggregateError');
      expect(nested.errors[0].name).assertEqual('RangeError');
      expect(nested.errors[1].name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0211
     * @tc.name testErrorsConstructor0211
     * @tc.desc Verify deep AggregateError chain resolves root message (test point 83)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Error = new Error('deep-root');
      for (let i: int = 0; i < 100; i++) {
        current = new AggregateError([current], 'aggregate-level');
      }
      let cursor: Error = current;
      for (let i: int = 0; i < 100; i++) {
        cursor = ((cursor as AggregateError).errors[0] as Error);
      }
      expect(current.name).assertEqual('AggregateError');
      expect(cursor.message).assertEqual('deep-root');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0212
     * @tc.name testErrorsConstructor0212
     * @tc.desc Verify custom TypeError inheritance chain construction (test point 12)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ConstructorTypeLeafError('type-leaf');
      expect(e.name).assertEqual('ConstructorTypeLeafError');
      expect(e instanceof ConstructorTypeBaseError).assertTrue();
      expect(e instanceof TypeError).assertTrue();
      expect(e.message).assertEqual('type-leaf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0213
     * @tc.name testErrorsConstructor0213
     * @tc.desc Verify private and protected error fields through public accessors (test points 25 and 26)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const host = new ConstructorVisibilityFieldHost();
      expect(host.getPrivateError().message).assertEqual('private-field-error');
      expect(host.getProtectedError().name).assertEqual('RangeError');
      expect(host.getProtectedError().message).assertEqual('protected-field-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0214
     * @tc.name testErrorsConstructor0214
     * @tc.desc Verify interface declared Error field is constructed (test point 32)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const host: ConstructorErrorInterface = new ConstructorInterfaceFieldHost();
      expect(host.errorValue.name).assertEqual('Error');
      expect(host.errorValue.message).assertEqual('interface-field-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0215
     * @tc.name testErrorsConstructor0215
     * @tc.desc Verify underscore error field name keeps RangeError value (test point 17)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const host = new ConstructorSpecialFieldHost();
      expect(host.error_value.name).assertEqual('RangeError');
      expect(host.error_value.message).assertEqual('underscore-field-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0216
     * @tc.name testErrorsConstructor0216
     * @tc.desc Verify getter and setter carry Error values (test points 34 and 35)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const host = new ConstructorAccessorErrorHost();
      expect(host.errorValue.message).assertEqual('getter-default');
      host.errorValue = new TypeError('setter-type');
      expect(host.errorValue.name).assertEqual('TypeError');
      expect(host.errorValue.message).assertEqual('setter-type');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0217
     * @tc.name testErrorsConstructor0217
     * @tc.desc Verify generic Error constraint stores concrete subtype (test point 65)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new ConstructorGenericErrorBox<RangeError>(new RangeError('generic-range'));
      expect(box.value.name).assertEqual('RangeError');
      expect(box.value.message).assertEqual('generic-range');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0218
     * @tc.name testErrorsConstructor0218
     * @tc.desc Verify array Map and Set error fields are constructed (test points 66, 69 and 70)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const host = new ConstructorCollectionFieldHost();
      expect(host.errorList.length).assertEqual(1);
      expect(host.errorList[0].message).assertEqual('array-error');
      expect(host.errorMap.get('range')!.message).assertEqual('map-error');
      expect(host.errorSet.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0219
     * @tc.name testErrorsConstructor0219
     * @tc.desc Verify constructed Error name message and stack are valid values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error('property-type');
      expect(e.name).assertEqual('Error');
      expect(e.message).assertEqual('property-type');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0220
     * @tc.name testErrorsConstructor0220
     * @tc.desc Verify cause can carry custom payload object (test point 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const payload = new ConstructorCausePayload();
      const e = new Error('payload-error', { cause: payload });
      const cause = e.cause as ConstructorCausePayload;
      expect(cause.code).assertEqual(1001);
      expect(cause.detail).assertEqual('payload-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0221
     * @tc.name testErrorsConstructor0221
     * @tc.desc Verify numeric cause boundary values are preserved (test point 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanCause = new Error('nan-cause', { cause: Number.NaN });
      const infiniteCause = new Error('infinite-cause', { cause: Number.POSITIVE_INFINITY });
      expect(isNaN(nanCause.cause as number)).assertTrue();
      expect(infiniteCause.cause as number).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0222
     * @tc.name testErrorsConstructor0222
     * @tc.desc Verify custom Error subclass forwards constructor cause (test points 11 and 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new ConstructorCauseCustomError('custom-cause', { cause: new RangeError('range-cause') });
      expect(e.name).assertEqual('ConstructorCauseCustomError');
      expect(e.message).assertEqual('custom-cause');
      expect((e.cause as Error).name).assertEqual('RangeError');
      expect((e.cause as Error).message).assertEqual('range-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0223
     * @tc.name testErrorsConstructor0223
     * @tc.desc Verify default Error field values are independent per instance (test point 76)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ConstructorErrorFieldHost();
      const second = new ConstructorErrorFieldHost();
      first.defaultError.message = 'changed-default';
      expect(first.defaultError.message).assertEqual('changed-default');
      expect(second.defaultError.message).assertEqual('default-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0224
     * @tc.name testErrorsConstructor0224
     * @tc.desc Verify message keeps escaped whitespace boundary input (test point 82)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new SyntaxError('line\nbreak\tmessage');
      expect(e.name).assertEqual('SyntaxError');
      expect(e.message.includes('\n')).assertTrue();
      expect(e.message.includes('\t')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0225
     * @tc.name testErrorsConstructor0225
     * @tc.desc Verify explicit primitive string conversion messages are preserved (test points 88, 89 and 90)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numericValue: number = 123;
      const booleanValue: boolean = true;
      const textError = new Error('not an error');
      const numberError = new Error(`${numericValue}`);
      const booleanError = new Error(`${booleanValue}`);
      expect(textError.message).assertEqual('not an error');
      expect(numberError.message).assertEqual('123');
      expect(booleanError.message).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0226
     * @tc.name testErrorsConstructor0226
     * @tc.desc Verify Error constructor with omitted message and explicit cause (test points 42 and 106)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new TypeError('omitted-message-cause');
      const e = new Error(undefined, { cause: cause });
      expect(e.name).assertEqual('Error');
      expect(e.message).assertEqual('');
      expect((e.cause as Error).message).assertEqual('omitted-message-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_CONSTRUCTOR_0227
     * @tc.name testErrorsConstructor0227
     * @tc.desc Verify constructor options.cause as non-Error object for various error types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsConstructor0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objCause = new ConstructorCausePayload();
      const a = new AssertionError("a", { cause: objCause });
      expect(a.cause).assertEqual(objCause);
      const b = new DivideByZeroError("b", { cause: objCause });
      expect(b.cause).assertEqual(objCause);
      const c = new NullPointerError("c", { cause: objCause });
      expect(c.cause).assertEqual(objCause);
      const d = new SyntaxError("d", { cause: objCause });
      expect(d.cause).assertEqual(objCause);
      const e = new RangeError("e", { cause: objCause });
      expect(e.cause).assertEqual(objCause);
      const f = new TypeError("f", { cause: objCause });
      expect(f.cause).assertEqual(objCause);
    });
  });
}
