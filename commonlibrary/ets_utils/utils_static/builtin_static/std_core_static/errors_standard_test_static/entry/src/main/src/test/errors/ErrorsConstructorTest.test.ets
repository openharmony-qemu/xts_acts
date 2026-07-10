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
} from '../../../../hypium/index';
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
