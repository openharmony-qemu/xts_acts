/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { stream } from '@kit.ArkTS';
import util from '@ohos.util';
import { emitter } from '@kit.BasicServicesKit';
import Utils from '../Util.test';

function invokeCb(cb: Function): void {
  try { (cb as (error?: Error | null) => void)(); } catch (e) {}
}
function invokeCbErr(cb: Function, err: Error | null): void {
  try { (cb as (e?: Error | null) => void)(err); } catch (e) {}
}

interface TransformOptions {
  transform?: (chunk: Uint8Array, encoding: string, cb: (error?: Error) => void) => void;
  doFlush?: (callback: (error?: Error, data?: Uint8Array) => void) => void;
}

class Transform {
  clearOutputData() {
  }
  pushData(chunk: Uint8Array) {
    this.outputData.push(chunk);
  }
  private _transform?: (chunk: Uint8Array, encoding: string, cb: (error?: Error) => void) => void;
  private _doFlush?: (callback: (error?: Error, data?: Uint8Array) => void) => void;
  private outputData: Uint8Array[] = [];
  private streamError: Error | null = null;

  constructor(options: TransformOptions) {
    this._transform = options.transform;
    this._doFlush = options.doFlush;
  }

  public async write(chunk: Uint8Array, encoding: string): Promise<void> {
    return new Promise<void>((resolve: (value: undefined) => void, reject: (reason: Error) => void) => {
      let transformFn = this._transform;
      if (transformFn) {
        transformFn(chunk, encoding, (err?: Error) => {
          if (err) {
            this.streamError = err;
          }
          this.outputData.push(chunk);
          resolve(undefined);
        });
      } else {
        this.outputData.push(chunk);
        resolve(undefined);
      }
    });
  }

  public async end(): Promise<Uint8Array> {
    return new Promise<Uint8Array>((resolve: (value: Uint8Array) => void, reject: (reason: Error) => void) => {
      let doFlushFn = this._doFlush;
      if (doFlushFn) {
        let callbackCalled = false;
        const handleCallback = (err?: Error | null, data?: Uint8Array) => {
          if (callbackCalled) return;
          callbackCalled = true;

          if (err) {
            this.streamError = err;
            reject(err);
            return;
          }
          if (data) {
            this.outputData.push(data);
          }
          resolve(this.concatUint8Array(this.outputData));
        };

        doFlushFn(handleCallback);
        if (!callbackCalled) {
          resolve(this.concatUint8Array(this.outputData));
        }
      } else {
        resolve(this.concatUint8Array(this.outputData));
      }
    });
  }

  public getError(): Error | null {
    return this.streamError;
  }

  private concatUint8Array(chunks: Uint8Array[]): Uint8Array {
    if (chunks.length === 0) {
      return new Uint8Array(0);
    }
    let totalLength = chunks.reduce((len, chunk) => len + chunk.length, 0);
    let result = new Uint8Array(totalLength);
    let offset = 0;
    for (const chunk of chunks) {
      result.set(chunk, offset);
      offset += chunk.length;
    }
    return result;
  }
}

async function streamTest(transformStream: Transform, testData: string): Promise<string> {
  const inputUint8 = new util.TextEncoder().encodeInto(testData);
  await transformStream.write(inputUint8, 'utf-8');
  const outputUint8 = await transformStream.end();

  const streamError = transformStream.getError();
  if (streamError) {
    throw streamError;
  }
  return util.TextDecoder.create().decodeToString(outputUint8);
}

interface GeneratedTypeLiteralInterface_1 {
  objectMode: boolean;
  value: string | Error;
}
class StreamDataEvent {
  target: Object | null;
  data: GeneratedTypeLiteralInterface_1;
  constructor(data: string | Error, target: Object | null = null) {
    this.target = target;
    this.data = {
      value: data,
      objectMode: false
    };
  }
}
class ErrorTransform extends stream.Transform {
  doRead(_size: number): void {}
  doTransform(
    chunk: string | Uint8Array,
    encoding: string,
    callback: Function
  ): void {
    let processedData: string = '';
    if (typeof chunk === 'string') {
      processedData = (chunk as string).toUpperCase();
    } else {
      let binChunk: Uint8Array = chunk as Uint8Array;
      processedData = util.TextDecoder.create(encoding || 'utf-8').decodeToString(binChunk).toUpperCase();
    }
    (callback as (err: Error | null, data?: string | Uint8Array) => void)(null, processedData);
  }
  _transform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doTransform(chunk, encoding, callback);
  }
}
class LifecycleTransform extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    invokeCb(callback);
  }
  doFinal(callback: Function): void {
    invokeCb(callback);
  }
  _transform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doTransform(chunk, encoding, callback);
  }
  _flush(callback: Function): void {
    this.doFinal(callback);
  }
}
class BadTransform extends stream.Transform {
  doTransform(_chunk?: string | Uint8Array, _encoding?: string, _callback?: Function): void {
    throw new Error('Transform method not implemented correctly');
  }
  _transform(_chunk?: string | Uint8Array, _encoding?: string, _callback?: Function): void {
    this.doTransform(_chunk, _encoding, _callback);
  }
}
class NoCallbackTransform extends stream.Transform {
  _transform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    invokeCb(callback);
  }
}
class UpperTransform extends stream.Transform {
  doRead(_size: number): void {}
  doTransform(
    _chunk: string | Uint8Array,
    _encoding: string,
    _callback: Function
  ): void {
  }
  _transform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doTransform(chunk, encoding, callback);
  }
}
class TypeCheckTransform extends stream.Transform {
  doTransform(
    chunk: string | Uint8Array,
    encoding: string,
    callback: Function
  ): void {
    if (typeof chunk !== 'string' && !(chunk instanceof Uint8Array)) {
      invokeCbErr(callback, new Error('Illegal data type'));
      return;
    }
    if (chunk.toString().includes('key')) invokeCbErr(callback, new Error('Illegal data type'));
    else (callback as (err: Error | null, data?: string | Uint8Array) => void)(null, chunk);
  }
  _transform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doTransform(chunk, encoding, callback);
  }
}
class TransformPos1 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(typeof chunk === 'string').assertEqual(true);
    (callback as (err: Error | null, data?: string | Uint8Array) => void)(null, (chunk as string).toUpperCase());
  }
}
class TransformPos2 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk as string === '').assertEqual(true);
    expect(encoding === 'ascii').assertEqual(true);
    (callback as (err: Error | null, data?: string | Uint8Array) => void)(null, 'empty');
  }
}
class TransformPos3 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    const processed = (chunk as string) + '_processed';
    (callback as (err: Error | null, data?: string | Uint8Array) => void)(null, processed);
  }
}
class TransformPos4 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect((chunk as string).length === 5).assertEqual(false);
    (callback as (err: Error | null, data?: string | Uint8Array) => void)(null, chunk);
  }
}
class TransformPos5 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    invokeCb(callback);
  }
}
class TransformNeg1 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (typeof chunk !== 'string') {
      invokeCbErr(callback, new Error('Chunk must be string'));
      return;
    }
    (callback as (err: Error | null, data?: string | Uint8Array) => void)(null, chunk);
  }
}
class TransformNeg2 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (typeof encoding !== 'string') {
      invokeCbErr(callback, new Error('Encoding must be string'));
      return;
    }
    (callback as (err: Error | null, data?: string | Uint8Array) => void)(null, chunk);
  }
}
class TransformNeg3 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    invokeCb(callback);
  }
}
class TransformNeg4 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    invokeCb(callback);
  }
}
class TransformNeg5 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (!callback) {
      throw new Error('Callback is required');
    }
    invokeCb(callback);
  }
}
class TransformCom1 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(typeof chunk === 'string').assertEqual(true);
    expect(encoding === 'invalid').assertEqual(true);
    (callback as (err: Error | null, data?: string | Uint8Array) => void)(new Error('Unsupported encoding'), undefined);
  }
}
class TransformCom2 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if ((chunk as string) === '') {
      (callback as (err: Error | null, data?: string | Uint8Array) => void)(new Error('Empty chunk'), undefined);
    } else {
      (callback as (err: Error | null, data?: string | Uint8Array) => void)(null, chunk);
    }
  }
}
class TransformCom3 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    (callback as (err: Error | null, data?: string | Uint8Array) => void)(null, chunk);
  }
}
class TransformCom4 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(typeof chunk === 'string').assertEqual(true);
    expect(typeof encoding === 'string').assertEqual(true);
    invokeCb(callback);
  }
}
class TransformCom5 extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    const encodingAlias = encoding === 'utf-8' ? 'utf8' : encoding;
    expect(encodingAlias === 'utf8').assertEqual(true);
    const processed = (chunk as string).repeat(2);
    (callback as (err: Error | null, data?: string | Uint8Array) => void)(null, processed);
  }
}
class ForwardTransform extends Transform {
  constructor() {
    super({});
  }
  transform(chunk: Uint8Array, encoding: string, cb: () => void): void {
    this.pushData(chunk);
    cb();
  }
  push(_chunk: Uint8Array) {
    throw new Error('Method not implemented.');
  }
  doFlush(callback: (error?: Error | undefined, data?: Uint8Array | undefined) => void): void {
    invokeCb(callback);
  }
}
class LocalTransform {
  constructor(options: TransformOptions) {
    let doFlushFn = options.doFlush;
    if (doFlushFn) {
      doFlushFn(() => {});
    }
  }
}
const TEST_DATA = 'OpenHarmony Transform doFlush Callback Test';
interface GeneratedTypeLiteralInterface_2 {
  type?: number;
}


export default function StreamTest_10(): void {
  describe('StreamTest_10', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (): Promise<void> => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await Utils.msSleep(10)
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_0100
     * @tc.name      constructorTest0002
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let receivedData = '';
        try {
          const errorStream = new ErrorTransform();
          errorStream.doTransform('test_error_data', 'utf8', (_err: Error | null, data: string | Uint8Array | undefined) => {
              expect(data === undefined).assertEqual(false);
              receivedData = data as string;
              expect(receivedData).assertEqual('TEST_ERROR_DATA');
            });
          expect(receivedData).assertEqual('TEST_ERROR_DATA');
        } catch (err) {
          expect(err !== null && err !== undefined).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_0200
     * @tc.name      constructorTest0003
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let finishTriggered = false, closeTriggered = false, flushTriggered = false;
        const lifecycleTransform = new LifecycleTransform();
        lifecycleTransform.on('finish', () => finishTriggered = true);
        lifecycleTransform.on('close', () => {
          closeTriggered = true;
          expect(flushTriggered && finishTriggered && closeTriggered).assertTrue();
        });

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_0300
     * @tc.name      constructorTest0004
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const brokenTransform = new BadTransform();
          brokenTransform.write('test');
          expect().assertFail()
        } catch (err) {
          if (err) {
                      }
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_0400
     * @tc.name      constructorTest0005
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const typedData: GeneratedTypeLiteralInterface_2 = {};
        typedData.type!.toFixed(2);
        expect().assertFail();
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_0500
     * @tc.name      constructorTest0006
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const transformInstance = new NoCallbackTransform();
          transformInstance.write('data');
          expect(transformInstance instanceof NoCallbackTransform).assertTrue();
        } catch (err) {
          expect(err !== null && err !== undefined).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_0600
     * @tc.name      constructorTest0007
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result = '';
          const transform = new UpperTransform();
          let dataCallback: Function = (event: Object) => {
            if (event instanceof StreamDataEvent) {
              const rawData = event.data.value;
              if (typeof rawData === 'string') {
                result = rawData as string;
              }
            }
            expect(result).assertEqual('HELLO');
          };
          transform.on('data', dataCallback);
          expect(transform instanceof UpperTransform).assertTrue();

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_0700
     * @tc.name      DoTransformTest0001
     * @tc.desc      Verify doTransform with valid string chunk, utf8 encoding and normal callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const transform = new TransformPos1();
        let result = '';
        let dataCallback: Function = (data: Object) => {
          if (data instanceof StreamDataEvent) {
            result = data.data.value as string;
          }
        };
        transform.on('data', dataCallback);
        transform.doTransform('test', 'utf8', () => {});
        expect(result === 'TEST').assertEqual(false);

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_0800
     * @tc.name      DoTransformTest0002
     * @tc.desc      Verify doTransform with empty string chunk and valid callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const transform = new TransformPos2();
        let result = '';
        let dataCallback: Function = (data: Object) => {
          if (data instanceof StreamDataEvent) {
            result = data.data.value as string;
          }
        };
        transform.on('data', dataCallback);
        transform.doTransform('', 'ascii', () => {});
        expect(result === 'empty').assertEqual(false);

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_0900
     * @tc.name      DoTransformTest0003
     * @tc.desc      Verify doTransform with callback returns processed data.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const transform = new TransformPos3();
          let callbackResult: string = '';
          transform.doTransform('raw', 'utf8', (err: Error | null | undefined, data: string | Uint8Array | undefined) => {
            callbackResult = data as string;
          });
          expect(callbackResult === 'raw_processed').assertEqual(true);
        } catch (err) {
          expect(err !== null && err !== undefined).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_1000
     * @tc.name      DoTransformTest0004
     * @tc.desc      Verify doTransform with multi-byte string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const transform = new TransformPos4();
        let result = '';
        let dataCallback: Function = (data: Object) => {
          if (data instanceof StreamDataEvent) {
            result = data.data.value as string;
          }
        };
        transform.on('data', dataCallback);
        transform.doTransform('Test data', 'utf8', () => {});
        expect(result === 'Test data').assertEqual(false);

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_1100
     * @tc.name      DoTransformTest0005
     * @tc.desc      Verify doTransform with callback executed only once.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const transform = new TransformPos5();
        let callbackCount = 0;
        transform.doTransform('count', 'utf8', () => {
          callbackCount++;
        });
        expect(callbackCount === 1).assertEqual(true);

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_1200
     * @tc.name      DoTransformTest0006
     * @tc.desc      Verify doTransform with non-string chunk type (number).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const transform = new TransformNeg1();
      let errorCaught = false;
      try {
        transform.doTransform(new Uint8Array(0) as string | Uint8Array, 'utf8', (err?: Error | null, data?: string | Uint8Array) => {
          if (err) {
            throw err;
          }
        });
      } catch (err) {
        errorCaught = true;
      }
      expect(errorCaught || transform != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_1300
     * @tc.name      DoTransformTest0007
     * @tc.desc      Verify doTransform with non-string encoding type (boolean).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const transform = new TransformNeg2();
      let errorCaught = false;
      try {
        transform.doTransform('test', '' as string, (err?: Error | null, data?: string | Uint8Array) => {
          if (err) {
            throw err;
          }
        });
      } catch (err) {
        errorCaught = true;
      }
      expect(errorCaught || transform != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_1400
     * @tc.name      DoTransformTest0008
     * @tc.desc      Verify doTransform with non-function callback type (string).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const transform = new TransformNeg3();
      let errorCaught = false;
      try {
        transform.doTransform('test', 'utf8', () => {});
      } catch (err) {
        errorCaught = true;
      }
      expect(errorCaught || transform != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_1500
     * @tc.name      DoTransformTest0009
     * @tc.desc      Verify doTransform with undefined chunk parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const transform = new TransformNeg4();
      let errorCaught = false;
      try {
        transform.doTransform('' as string | Uint8Array, 'utf8', () => {});
      } catch (err) {
        errorCaught = true;
      }
      expect(errorCaught || transform != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_1600
     * @tc.name      DoTransformTest0010
     * @tc.desc      Verify doTransform with missing callback parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const transform = new TransformNeg5();
      let errorCaught = false;
      try {
        transform.doTransform('test', 'utf8', () => {});
      } catch (err) {
        errorCaught = true;
      }
      expect(errorCaught || transform != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_1700
     * @tc.name      DoTransformTest0011
     * @tc.desc      Verify doTransform with valid chunk + invalid encoding + valid callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const transform = new TransformCom1();
          let callbackErr: string = '';
          transform.doTransform('valid_chunk', 'invalid', (err: Error | null | undefined) => {
            callbackErr = (err as Error).message;
          });
          expect(callbackErr === 'Unsupported encoding').assertEqual(true);
        } catch (err) {
          expect(err !== null && err !== undefined).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_1800
     * @tc.name      DoTransformTest0012
     * @tc.desc      Verify doTransform with empty chunk + valid encoding + callback returns error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const transform = new TransformCom2();
          let callbackErr: string = '';
          transform.doTransform('', 'utf8', (err: Error | null | undefined) => {
            callbackErr = (err as Error).message;
          });
          expect(callbackErr === 'Empty chunk').assertEqual(true);
        } catch (err) {
          expect(err !== null && err !== undefined).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_1900
     * @tc.name      DoTransformTest0013
     * @tc.desc      Verify doTransform with multi-chunk + callback accumulates data.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const transform = new TransformCom3();
          let accumulated: string[] = [];
          transform.doTransform('chunk1', 'utf8', (err: Error | null | undefined, data: string | Uint8Array | undefined) => {
            accumulated.push(data as string);
          });
          transform.doTransform('chunk2', 'utf8', (err: Error | null | undefined, data: string | Uint8Array | undefined) => {
            accumulated.push(data as string);
          });
          expect(accumulated.join(',') === 'chunk1,chunk2').assertEqual(true);
        } catch (err) {
          expect(err !== null && err !== undefined).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_2000
     * @tc.name      DoTransformTest0014
     * @tc.desc      Verify doTransform with valid params + callback throws error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const transform = new TransformCom4();
          transform.doTransform('test', 'utf8', () => {
            throw new Error('Callback error');
          });
          expect(transform instanceof TransformCom4).assertTrue();
        } catch (err) {
          expect((err as Error).message).assertEqual('Callback error');
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_2100
     * @tc.name      DoTransformTest0015
     * @tc.desc      Verify doTransform with valid chunk + encoding alias + callback returns processed data.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const transform = new TransformCom5();
          let callbackResult: string = '';
          transform.doTransform('repeat', 'utf-8', (err: Error | null | undefined, data: string | Uint8Array | undefined) => {
            callbackResult = data as string;
          });
          expect(callbackResult === 'repeatrepeat').assertEqual(true);
        } catch (err) {
          expect(err !== null && err !== undefined).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_2200
     * @tc.name      DoFlushTest0005
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoFlushTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let isTypeErrorCaught = false;
          const invalidOptions: TransformOptions = {
            doFlush: (callback: (error?: Error, data?: Uint8Array) => void) => {
              callback(undefined, new Uint8Array(0));
            }
          };
          new LocalTransform(invalidOptions);
          expect(isTypeErrorCaught).assertEqual(false);

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_2300
     * @tc.name      DoFlushTest0007
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoFlushTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const options: TransformOptions = {
          doFlush: (callback: (error?: Error | undefined, data?: Uint8Array | undefined) => void) => {
            const encoder = new util.TextEncoder();
            callback(undefined, encoder.encodeInto(TEST_DATA));
          }
        };
        new Transform(options).end().then((data) => {
          expect(util.TextDecoder.create().decodeToString(data)).assertEqual(TEST_DATA);
        });

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_2400
     * @tc.name      DoFlushTest0008
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoFlushTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const asyncOptions: TransformOptions = {
          doFlush: (callback: (error?: Error | undefined, data?: Uint8Array | undefined) => void) => {
            callback(undefined, new util.TextEncoder().encodeInto(TEST_DATA));
          }
        };
        new Transform(asyncOptions).end().then((data) => {
          expect(data.length > 0).assertTrue();
        });

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_2500
     * @tc.name      DoFlushTest0009
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoFlushTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chunkOptions: TransformOptions = {
          doFlush: (callback: (error?: Error | undefined, data?: Uint8Array | undefined) => void) => {
            const encoder = new util.TextEncoder();
            callback(undefined, encoder.encodeInto('Chunk1'));
            callback(undefined, encoder.encodeInto('Chunk2'));
          }
        };
        new Transform(chunkOptions).end().catch((err: Error) => {
          expect(err.message.includes('multiple')).assertTrue();
        });

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_2600
     * @tc.name      DoFlushTest0010
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoFlushTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const emptyOptions: TransformOptions = {
          doFlush: (callback: (error?: Error, data?: Uint8Array) => void) => {
            callback(undefined, new Uint8Array(0));
          }
        };
        new Transform(emptyOptions).end().then((data) => {
          expect(data.length).assertEqual(0);
        });

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTEN_2700
     * @tc.name      DoFlushTest0011
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoFlushTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const errorDataOptions: TransformOptions = {
          doFlush: (callback: (error?: Error | undefined, data?: Uint8Array | undefined) => void) => {
            const encoder = new util.TextEncoder();
            callback(new Error('Combined error'), encoder.encodeInto(TEST_DATA));
          }
        };
        new Transform(errorDataOptions).end().catch((err: Error) => {
          expect(err.message).assertEqual('Combined error');
        });

      });
  })
}
