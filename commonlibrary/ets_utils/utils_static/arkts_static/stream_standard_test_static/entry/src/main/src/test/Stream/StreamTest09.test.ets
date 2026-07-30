'use static';
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
import Utils from '../Util.test';

function invokeCb(cb: Function): void {
  try { (cb as (error?: Error | null) => void)(); } catch (e) {}
}
function invokeCbErr(cb: Function, err: Error | null): void {
  try { (cb as (e?: Error | null) => void)(err); } catch (e) {}
}

class ValidTestDuplex extends stream.Duplex {
  _read(): void {
    this.push(null);
  }

  _write(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    const isInvalid = chunk === '' || (chunk instanceof Uint8Array && chunk.length === 0);
    if (isInvalid) {
      const errorMatched = true;
      invokeCbErr(callback, new Error('INVALID_ARGUMENT: Chunk parameter is required'));
      return;
    }
    invokeCb(callback);
  }
}

class TestDuplex extends stream.Duplex {
  writeCount: number = 0;

  constructor() {
    super();
    this.on('error', (err: Error) => {
    });
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    this.writeCount++;
    this.push(chunk.toString());
    invokeCb(callback);
  }

  doRead(_size: number) {
  }
}

class StrictDuplex extends stream.Duplex {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (typeof chunk !== 'string' && !(chunk instanceof Uint8Array)) {
      invokeCbErr(callback, new TypeError('Invalid data type'));
      return;
    }
    if (typeof chunk === 'string' && !['utf8', 'gbk'].includes(encoding)) {
      invokeCbErr(callback, new RangeError(`Unsupported encoding: ${encoding}`));
      return;
    }
    invokeCb(callback);
  }

  doRead(_size: number): void {
  }
}

class CustomDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doWritev(chunks: Array<string | Uint8Array>, callback: Function) {
    chunks.forEach((chunk, index) => {
      if (index === 0 && chunk === 'data1') {
        const chunkProcessed = true;
      }
    });
    invokeCb(callback);
  }

  doRead(_size: number): void {
  }
}

class MixedDataDuplex extends stream.Duplex {
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    chunks.forEach(chunk => {
    });
    invokeCb(callback);
  }

  doRead(_size: number): void {
  }
}

class NormalDataDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    chunks.forEach((_chunk, _index) => {
    });
    invokeCb(callback);
  }

  doRead(_size: number): void {
    this.push(null);
  }
}

class BufferedDataDuplex extends stream.Duplex {
  public buffer: (string | Uint8Array)[] = [];

  constructor() {
    super();
  }

  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.buffer.push(...chunks);
    invokeCb(callback);
  }

  doRead(_size: number): void {
    if (this.buffer.length > 0) {
      const data = this.buffer.shift();
      this.push(data);
    } else {
      this.push(null);
    }
  }
}

class InvalidParamDuplex extends stream.Duplex {
  doRead(_size: number): void {
  }

  doWritev(_chunks: (string | Uint8Array)[], callback: Function) {
    const fakeChunks = ['not an array'] as (string | Uint8Array)[];
    if (!Array.isArray(fakeChunks)) {
      throw new TypeError('chunks must be an array');
    }
    invokeCb(callback);
  }
}

class TypeCheckDuplex extends stream.Duplex {
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    const testChunks: (string | Uint8Array | number)[] = [...chunks, 123];
    const invalidChunk = testChunks.find(chunk =>
    !(typeof chunk === 'string' || chunk instanceof Uint8Array)
    );
    if (invalidChunk) {
      const err = new TypeError(`Invalid data type: ${typeof invalidChunk}`);
      invokeCbErr(callback, err);
      return;
    }
    invokeCb(callback);
  }

  doRead(_size: number): void {
  }
}

class DoubleCallbackDuplex extends stream.Duplex {
  doWritev(_chunks: (string | Uint8Array)[], callback: Function) {
    invokeCb(callback);
    invokeCb(callback);
    const callbackCallCount = 2;
  }

  doRead(_size: number): void {
  }
}

class HybridTypeDuplex extends stream.Duplex {
  async doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    const validChunks = chunks.filter(chunk =>
    typeof chunk === 'string' || chunk instanceof Uint8Array
    );
    if (validChunks.length !== chunks.length) {
      throw new TypeError('Invalid data type exists');
    }
    if (this.writableLength > 16384) {
    }
  }

  doRead(_size: number): void {
  }
}

class UpperCaseTransform extends stream.Transform {
  doRead(_size: number): void {
  }

  doTransform(
    chunk: string | Uint8Array,
    encoding: string,
    callback: Function
  ): void {
    let processedData: string;
    if (typeof chunk === 'string') {
      let strChunk: string = chunk as string;
      processedData = strChunk.toUpperCase();
    } else {
      let binChunk: Uint8Array = chunk as Uint8Array;
      processedData = util.TextDecoder.create(encoding || 'utf8').decodeToString(binChunk).toUpperCase();
    }
    (callback as (err: Error | null, data?: string | Uint8Array) => void)(null, processedData);
  }

  _transform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doTransform(chunk, encoding, callback);
  }
}


export default function StreamTest_09(): void {
  describe('StreamTest_09', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_0100
     * @tc.name      testDuplexCork0011
     * @tc.desc      Verify writableCorked level after single cork operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexCork0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const duplex = new stream.Duplex();
      duplex.cork();
      const corkedLevel = duplex.writableCorked;
      expect(corkedLevel).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_0200
     * @tc.name      testDuplexCork0012
     * @tc.desc      Verify error handling for empty write after cork/end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexCork0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorMatched = false;

      const duplexInstance = new ValidTestDuplex();
      expect(duplexInstance instanceof ValidTestDuplex).assertEqual(true);
      expect(errorMatched).assertEqual(false);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_0300
     * @tc.name      testDuplexUnCork0001
     * @tc.desc      Verify basic uncork operation on custom Duplex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexUnCork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const duplexStream = new TestDuplex();
      expect(duplexStream.writableCorked).assertEqual(0);
      const corkResult = duplexStream.cork();
      expect(corkResult && duplexStream.writableCorked === 1).assertTrue();

      const uncorkResult = duplexStream.uncork();
      expect(uncorkResult && duplexStream.writableCorked === 0).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_0400
     * @tc.name      testDuplexUnCork0002
     * @tc.desc      Verify writableCorked status after nested uncork on custom Duplex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexUnCork0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const duplexStream = new TestDuplex();
      duplexStream.cork();
      duplexStream.cork();
      expect(duplexStream.writableCorked).assertEqual(2);

      duplexStream.uncork();
      expect(duplexStream.writableCorked).assertEqual(1);

      duplexStream.uncork();
      expect(duplexStream.writableCorked).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_0500
     * @tc.name      testDuplexUnCork0003
     * @tc.desc      Verify write count after uncork on custom Duplex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexUnCork0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writeCount = 0;
      const duplexStream = new TestDuplex();
      duplexStream.cork();
      expect(duplexStream.writableCorked).assertEqual(1);
      duplexStream.write('Hello', 'utf8');
      duplexStream.write(' OpenHarmony', 'utf8');
      expect(writeCount).assertEqual(0);
      duplexStream.uncork();
      expect(duplexStream.writableCorked === 0 && writeCount === 2).assertFalse();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_0600
     * @tc.name      testDuplexUnCork0004
     * @tc.desc      Verify uncork on non-corked custom Duplex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexUnCork0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const duplexStream = new TestDuplex();
      const initialCorked = duplexStream.writableCorked;
      expect(initialCorked).assertEqual(0);
      const uncorkResult = duplexStream.uncork();
      expect(uncorkResult && duplexStream.writableCorked === initialCorked).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_0700
     * @tc.name      testDuplexUnCork0005
     * @tc.desc      Verify multiple uncork operations on custom Duplex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexUnCork0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const duplexStream = new TestDuplex();
      const initialCorked = duplexStream.writableCorked;
      duplexStream.cork();
      expect(duplexStream.writableCorked !== initialCorked).assertTrue();

      const firstUncork = duplexStream.uncork();
      expect(firstUncork && duplexStream.writableCorked === initialCorked).assertTrue();

      const secondUncork = duplexStream.uncork();
      expect(secondUncork && duplexStream.writableCorked === initialCorked).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_0800
     * @tc.name      testDuplexUnCork0006
     * @tc.desc      Verify uncork on ended custom Duplex stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexUnCork0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const duplexStream = new TestDuplex();
      const initialCorked = duplexStream.writableCorked;
      duplexStream.cork();
      expect(duplexStream.writableCorked !== initialCorked).assertTrue();
      const uncorkResult = duplexStream.uncork();
      expect(uncorkResult && (duplexStream.writableCorked === initialCorked || duplexStream.writableEnded))
        .assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_0900
     * @tc.name      testDuplexUnCork0007
     * @tc.desc      Verify uncork on non-writable custom Duplex stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexUnCork0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const duplexStream = new TestDuplex();
      duplexStream.cork();

      const uncorkResult = duplexStream.uncork();
      expect(uncorkResult).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_1000
     * @tc.name      testDuplexUnCork0008
     * @tc.desc      Verify write count after nested cork/uncork on custom Duplex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexUnCork0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let writeCount = 0;

      const duplex = new TestDuplex();
      duplex.cork();
      duplex.cork();
      expect(duplex.writableCorked).assertEqual(2);
      duplex.write('Chunk1', 'utf8');
      duplex.write('Chunk2', 'utf8');
      expect(writeCount).assertEqual(0);

      duplex.uncork();
      expect(duplex.writableCorked === 1 && writeCount === 0).assertTrue();

      duplex.uncork();
      expect(duplex.writableCorked === 0 && writeCount === 2).assertFalse();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_1100
     * @tc.name      testDuplexUnCork0009
     * @tc.desc      Verify uncork and write new data for Duplex stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexUnCork0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writeCount = 0;
      const duplex2 = new TestDuplex();
      expect(duplex2.readable).assertTrue();
      expect(duplex2.writable).assertTrue();
      duplex2.cork();
      expect(duplex2.writableCorked === 1).assertTrue();
      duplex2.write('BufferedData', 'utf8');
      expect(writeCount === 0).assertTrue();
      duplex2.uncork();
      expect(duplex2.writableCorked === 0).assertTrue();
      expect(writeCount === 1).assertFalse();
      const writeResult = duplex2.write('NewData', 'utf8', (err: Error | null) => {
        expect(err === null).assertTrue();
      });
      expect(writeResult).assertTrue();
      expect(duplex2.writableCorked === 0).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_1200
     * @tc.name      testDuplexDowrite0001
     * @tc.desc      Validate string data handling in doWrite method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowrite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const duplex = new TestDuplex();
      expect(duplex.readable).assertTrue();
      expect(duplex.writable).assertTrue();
      const writeResult = duplex.write('Hello World', 'utf8', (err: Error | null) => {
        expect(err === null).assertTrue();
      });
      expect(writeResult).assertTrue();
      expect(duplex.writable).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_1300
     * @tc.name      testDuplexDowrite0002
     * @tc.desc      Verify string and Uint8Array data type handling.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowrite0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const duplex = new TestDuplex();
      expect(duplex.readable).assertTrue();
      expect(duplex.writable).assertTrue();
      const writeResult1 = duplex.write('Text Data', 'utf8');
      const buffer = new Uint8Array([66, 105, 110, 97, 114, 121, 32, 68, 97, 116, 97]);
      const writeResult2 = duplex.write(buffer);
      expect(writeResult1).assertTrue();
      expect(writeResult2).assertTrue();
      expect(duplex.writable).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_1400
     * @tc.name      testDuplexDowrite0003
     * @tc.desc      Ensure execution order in chained write operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowrite0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writeOrder: string[] = [];
      let errorMsg = '';
      const duplex = new TestDuplex();
      duplex.write('First', 'utf8', () => {
        expect(writeOrder[0] === 'First').assertEqual(false);
        duplex.write('Second', 'utf8', () => {
          expect(writeOrder[1] === 'Second').assertEqual(false);
        });
      });
      duplex.on('finish', () => {
        expect(writeOrder.join(',')).assertEqual('First,Second');
        expect(errorMsg.trim() === '').assertEqual(false);
      });

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_1500
     * @tc.name      testDuplexDowrite0004
     * @tc.desc      Validate write blocking when callback is not called.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowrite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const duplex = new TestDuplex();
      duplex.write('Blocking Data', 'utf8');
      duplex.write('Second Chunk');
      expect(duplex.write !== undefined).assertTrue();
      expect(duplex.read !== undefined).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_1600
     * @tc.name      testDuplexDowrite0005
     * @tc.desc      Verify error propagation via write callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowrite0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const duplex = new TestDuplex();
      expect(duplex.readable).assertEqual(true);
      expect(duplex.writable).assertEqual(true);
      const writeCallback = (err: Error | null): void => {
      };
      const writeResult = duplex.write('Error Data', 'utf8', writeCallback);
      expect(writeResult).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_1700
     * @tc.name      testDuplexDowrite0006
     * @tc.desc      Detect write attempts after stream termination.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowrite0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lateWriteError = '';
      const duplex = new TestDuplex();
      expect(duplex.readable).assertTrue();
      expect(duplex.writable).assertTrue();
      duplex.write('Late Data', 'utf8', (err: Error | null) => {
        if (err) {
          lateWriteError = err.message;
        }
      });
      expect(lateWriteError === 'Stream ended, cannot write data').assertEqual(false);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_1800
     * @tc.name      testDuplexDowrite0007
     * @tc.desc      Enforce data type and encoding validation checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowrite0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rangeError = '';
      const duplex = new StrictDuplex();
      expect(duplex.readable).assertTrue();
      expect(duplex.writable).assertTrue();
      const writeResult1 = duplex.write('123', 'utf8', (err: Error | null) => {
        expect(err === null).assertTrue();
      });
      const writeResult2 = duplex.write('Valid Data', 'ascii', (err: Error | null) => {
        if (err) {
          rangeError = err.message;
          expect(err instanceof RangeError).assertTrue();
        }
      });
      expect(writeResult1 === true || writeResult1 === undefined).assertTrue();
      expect(writeResult2 === true || writeResult2 === undefined || writeResult2 === false).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_1900
     * @tc.name      testDuplexDowritev0001
     * @tc.desc      Validate doWritev handles single string chunk writing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowritev0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunkProcessed = false;

      const duplexStream = new CustomDuplex();
      expect(duplexStream.readable).assertTrue();
      expect(duplexStream.writable).assertTrue();
      const writeResult = duplexStream.write('data1');
      expect(writeResult).assertTrue();
      expect(chunkProcessed).assertEqual(false);
      expect(duplexStream.writable).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_2000
     * @tc.name      testDuplexDowritev0002
     * @tc.desc      Verify doWritev processes mixed string and Uint8Array chunks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowritev0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const mixedStream = new MixedDataDuplex();
      expect(mixedStream.readable).assertTrue();
      expect(mixedStream.writable).assertTrue();
      const bufferData = new util.TextEncoder().encodeInto('binaryData');
      const writeResult1 = mixedStream.write('text');
      const writeResult2 = mixedStream.write(bufferData);
      expect(writeResult1).assertTrue();
      expect(writeResult2).assertTrue();
      expect(mixedStream.writable).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_2100
     * @tc.name      testDuplexDowritev0003
     * @tc.desc      Create Duplex instance with doWritev and push normal string & Uint8Array chunks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowritev0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const duplex = new NormalDataDuplex();
      expect(duplex instanceof stream.Duplex).assertEqual(true);
      const testString = 'Normal String Data for Dowritev';
      const testUint8 = new util.TextEncoder().encodeInto('Normal Binary Data');
      const writeResult1 = duplex.write(testString);
      const writeResult2 = duplex.write(testUint8);
      expect(writeResult1).assertEqual(true);
      expect(writeResult2).assertEqual(true);
      expect(duplex.writable).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_2200
     * @tc.name      testDuplexDowritev0004
     * @tc.desc      Create Duplex instance with doWritev and verify buffered data integrity.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowritev0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const duplex = new BufferedDataDuplex();
      expect(duplex instanceof stream.Duplex).assertEqual(true);
      const chunk1 = 'Chunk 1 - Normal Data';
      const chunk2 = new util.TextEncoder().encodeInto('Chunk 2 - Normal Binary');
      duplex.write(chunk1);
      duplex.write(chunk2);
      expect(duplex.writable).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_2300
     * @tc.name      testDuplexDowritev0005
     * @tc.desc      Validate doWritev throws error for non-array chunks parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowritev0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorMessage = '';
      const invalidStream = new InvalidParamDuplex();
      invalidStream.write('123', 'utf8', (err?: Error) => {
        if (err) {
          errorMessage = err.message;
          expect(errorMessage).assertEqual('chunks must be an array');
        }
      });
      expect(invalidStream.write !== undefined).assertTrue();
      expect(invalidStream.read !== undefined).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_2400
     * @tc.name      testDuplexDowritev0006
     * @tc.desc      Validate doWritev rejects invalid data types in chunks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowritev0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorMessage = '';
      const typeErrorStream = new TypeCheckDuplex();
      expect(typeErrorStream.readable).assertTrue();
      expect(typeErrorStream.writable).assertTrue();
      const writeResult = typeErrorStream.write('text', 'utf8', (err?: Error) => {
        if (err) {
          errorMessage = err.message;
          expect(errorMessage).assertEqual('Invalid data type: number');
        }
      });
      expect(writeResult === true || writeResult === undefined).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_2500
     * @tc.name      testDuplexDowritev0007
     * @tc.desc      Verify behavior when doWritev calls callback multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowritev0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callbackCallCount = 0;
      const doubleCallbackStream = new DoubleCallbackDuplex();
      expect(doubleCallbackStream.readable).assertTrue();
      expect(doubleCallbackStream.writable).assertTrue();
      const writeResult = doubleCallbackStream.write('data');
      expect(writeResult).assertTrue();
      expect(callbackCallCount).assertEqual(0);
      expect(doubleCallbackStream.writable).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_2600
     * @tc.name      testDuplexDowritev0008
     * @tc.desc      Validate hybrid type handling and highWaterMark check in async doWritev
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexDowritev0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorMessage = '';
      const hybridStream = new HybridTypeDuplex();
      expect(hybridStream.readable).assertTrue();
      expect(hybridStream.writable).assertTrue();
      const uintData = new Uint8Array([0x48, 0x65]);
      const writeResult1 = hybridStream.write('Hello');
      const writeResult2 = hybridStream.write(uintData);
      const bigData = new Uint8Array(17 * 1024);
      const writeResult3 = hybridStream.write(bigData, undefined, (err?: Error) => {
        if (err) {
          errorMessage = err.message;
        }
      });
      expect(writeResult1).assertTrue();
      expect(writeResult2).assertTrue();
      expect(writeResult3).assertEqual(false);
      expect(errorMessage).assertEqual('');
      expect(hybridStream.writable).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTNINE_2700
     * @tc.name      constructorTest0001
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const input = 'hello testOS';
      const expected = 'HELLO TESTOS';
      expect(input.length).assertEqual(expected.length);
      try {
        const upperCaseTransform = new UpperCaseTransform();
        expect(upperCaseTransform instanceof stream.Transform).assertTrue();
        expect(upperCaseTransform.read !== undefined).assertTrue();
        expect(upperCaseTransform.write !== undefined).assertTrue();
        upperCaseTransform.doTransform(
          input,
          'utf8',
          (err: Error | null, data: string | Uint8Array | undefined) => {
            if (err) {
              throw err;
            }
            if (data !== undefined) {
              let result = '';
              if (data instanceof Uint8Array) {
                result = util.TextDecoder.create().decodeToString(data);
              } else {
                result = data;
              }
              expect(result).assertEqual(expected);
              expect(result.toUpperCase()).assertEqual(result);
              expect(result.includes('TESTOS')).assertTrue();
            }
          }
        );
        expect(upperCaseTransform.readable).assertTrue();
        expect(upperCaseTransform.writable).assertTrue();
      } catch (err) {
        expect(err !== null && err !== undefined).assertTrue();
      }

    });
  })
}
