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
} from '../../../../../hypium/index';
import { stream } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

class PipeTestTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class PipeTestTransform2 extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    let s: string = chunk;
    this.push(s.toLowerCase());
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class PipeErrorTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    throw new Error('pipe transform error');
  }
}

class CollectWritable extends stream.Writable {
  public chunks: string[] = [];
  public doWriteCallCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doWriteCallCount++;
    this.chunks.push(chunk as string);
    callback.unsafeCall();
  }
}

class DestWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamTransformPipeTest(): void {
  describe('StreamTransformPipeTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: (value: void) => void): void => {
        setTimeout((): void => resolve(undefined as void), 0);
      });
    });
    beforeAll((): void => {
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_0100
     * @tc.name testStreamTransformPipe001
     * @tc.desc Verify pipe returns the destination writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      let result = transform.pipe(writable);
      expect(result).assertEqual(writable);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_0200
     * @tc.name testStreamTransformPipe002
     * @tc.desc Verify unpipe disconnects the pipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      transform.unpipe(writable);
      transform.write('after', 'utf8');
      transform.end();
      expect(writable.doWriteCallCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_0300
     * @tc.name testStreamTransformPipe003
     * @tc.desc Verify pipe overrides pause state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pause();
      transform.pipe(writable);
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_0400
     * @tc.name testStreamTransformPipe004
     * @tc.desc Verify pipe after end sends no data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.end();
      transform.pipe(writable);
      expect(writable.doWriteCallCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_0500
     * @tc.name testStreamTransformPipe005
     * @tc.desc Verify pipe to already-ended writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      writable.end();
      transform.pipe(writable);
      transform.write('x', 'utf8');
      expect(writable.doWriteCallCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_0600
     * @tc.name testStreamTransformPipe006
     * @tc.desc Verify pipe to Duplex stream rejects an incompatible destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let duplex = new stream.Duplex();
      let errorCaught: boolean = false;
      try {
        transform.pipe(duplex as stream.Writable);
        transform.write('hello', 'utf8');
        transform.end();
        expect().assertFail();
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_0700
     * @tc.name testStreamTransformPipe007
     * @tc.desc Verify chaining transforms rejects an incompatible destination cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = new PipeTestTransform();
      let t2 = new PipeTestTransform2();
      let writable = new CollectWritable();
      let errorCaught: boolean = false;
      try {
        t1.pipe(t2 as stream.Writable);
        t2.pipe(writable);
        t1.write('Hello', 'utf8');
        t1.end();
        expect().assertFail();
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_0800
     * @tc.name testStreamTransformPipe008
     * @tc.desc Verify pipe with empty options object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      let result = transform.pipe(writable, {} as Object);
      expect(result).assertEqual(writable);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_0900
     * @tc.name testStreamTransformPipe009
     * @tc.desc Verify pipe with end only, no data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      transform.end();
      expect(writable.doWriteCallCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_1000
     * @tc.name testStreamTransformPipe010
     * @tc.desc Verify pipe with doTransform that does not push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeErrorTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      try {
        transform.write('x', 'utf8');
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      expect(writable.doWriteCallCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_1100
     * @tc.name testStreamTransformPipe011
     * @tc.desc Verify unpipe all with no arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      transform.unpipe();
      transform.write('data', 'utf8');
      transform.end();
      expect(writable.doWriteCallCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_1200
     * @tc.name testStreamTransformPipe012
     * @tc.desc Verify pipe with an empty source completes without destination data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PipeTestTransform();
        let writable = new CollectWritable();
        let chunksLenAtFinish: int = 0;
        let doWriteCountAtFinish: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          writable.on('finish', (): void => {
            chunksLenAtFinish = writable.chunks.length;
            doWriteCountAtFinish = writable.doWriteCallCount;
            resolve(undefined as void);
          });
          transform.pipe(writable);
          transform.end();
        });
        expect(chunksLenAtFinish).assertEqual(0);
        expect(doWriteCountAtFinish).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_1300
     * @tc.name testStreamTransformPipe013
     * @tc.desc Verify unpipe without a destination returns the current Transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      let result = transform.unpipe();
      expect(result).assertEqual(transform);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_1400
     * @tc.name testStreamTransformPipe014
     * @tc.desc Verify unpipe of non-connected destination is silent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      let code: int = 0;
      try {
        transform.unpipe(writable);
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_1500
     * @tc.name testStreamTransformPipe015
     * @tc.desc Verify piping data does not finish downstream before source end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      let finishFired: boolean = false;
      writable.on('finish', (): void => {
        finishFired = true;
      });
      let result = transform.pipe(writable);
      expect(result).assertEqual(writable);
      transform.write('data', 'utf8');
      expect(finishFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_1600
     * @tc.name testStreamTransformPipe016
     * @tc.desc Verify pipe write with empty string throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      let caught: boolean = false;
      try {
        transform.write('', 'utf8');
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_1700
     * @tc.name testStreamTransformPipe017
     * @tc.desc Verify pipe does not affect readable* properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      expect(transform.readable).assertTrue();
      expect(transform.readableLength).assertEqual(0);
      expect(transform.readableHighWatermark).assertEqual(16384);
      expect(transform.readableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_1800
     * @tc.name testStreamTransformPipe018
     * @tc.desc Verify pipe does not affect writable* properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      expect(transform.writable).assertTrue();
      expect(transform.writableLength).assertEqual(0);
      expect(transform.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_1900
     * @tc.name testStreamTransformPipe019
     * @tc.desc Verify pipe sets readableFlowing true and leaves readableEncoding, readableEnded and writable* properties unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      expect(transform.readableFlowing).assertTrue();
      expect(transform.readableEncoding).assertEqual(null);
      expect(transform.readableEnded).assertFalse();
      expect(transform.writableEnded).assertFalse();
      expect(transform.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_2000
     * @tc.name testStreamTransformPipe020
     * @tc.desc Verify pipe unpipe all via no-arg unpipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let ws1 = new CollectWritable();
      let ws2 = new CollectWritable();
      let ws3 = new CollectWritable();
      transform.pipe(ws1);
      transform.pipe(ws2);
      transform.pipe(ws3);
      transform.unpipe();
      transform.write('hello', 'utf8');
      expect(ws1.doWriteCallCount).assertEqual(0);
      expect(ws2.doWriteCallCount).assertEqual(0);
      expect(ws3.doWriteCallCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_2100
     * @tc.name testStreamTransformPipe021
     * @tc.desc Verify pipe still can cork/uncork after pipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      transform.cork();
      expect(transform.writableCorked).assertEqual(1);
      transform.uncork();
      expect(transform.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_2200
     * @tc.name testStreamTransformPipe022
     * @tc.desc Verify pipe still can setEncoding after pipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      let result = transform.setEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_2300
     * @tc.name testStreamTransformPipe023
     * @tc.desc Verify pipe still can setDefaultEncoding after pipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      let result = transform.setDefaultEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_2400
     * @tc.name testStreamTransformPipe024
     * @tc.desc Verify pipe then pause pauses downstream flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      transform.pause();
      transform.write('hello', 'utf8');
      expect(writable.doWriteCallCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_2500
     * @tc.name testStreamTransformPipe025
     * @tc.desc Verify pipe then end triggers downstream finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PipeTestTransform();
        let writable = new CollectWritable();
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          writable.on('finish', (): void => {
            finishedAtFinish = writable.writableFinished;
            resolve(undefined as void);
          });
        });
        transform.pipe(writable);
        transform.end();
        await finishPromise;
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_2600
     * @tc.name testStreamTransformPipe026
     * @tc.desc Verify pipe then unpipe before end suppresses finish on downstream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      let finishFired: boolean = false;
      transform.pipe(writable);
      transform.unpipe(writable);
      writable.on('finish', (): void => {
        finishFired = true;
      });
      transform.end();
      expect(finishFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_2700
     * @tc.name testStreamTransformPipe027
     * @tc.desc Verify pipe to null destination throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let caught: boolean = false;
      try {
        transform.pipe(null as Object as stream.Writable);
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_2800
     * @tc.name testStreamTransformPipe028
     * @tc.desc Verify pipe to undefined destination throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let caught: boolean = false;
      try {
        transform.pipe(undefined as Object as stream.Writable);
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_2900
     * @tc.name testStreamTransformPipe029
     * @tc.desc Verify pipe to an ended Writable returns the destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      writable.end();
      expect(writable.writableEnded).assertTrue();
      let result = transform.pipe(writable);
      expect(result).assertEqual(writable);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_3000
     * @tc.name testStreamTransformPipe030
     * @tc.desc Verify unpipe returns the current Transform instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PipeTestTransform();
      let writable = new CollectWritable();
      transform.pipe(writable);
      let result = transform.unpipe(writable);
      expect(result).assertEqual(transform);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PIPE_3100
     * @tc.name testStreamTransformPipe031
     * @tc.desc Verify pipe then push(null) triggers downstream finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPipe031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PipeTestTransform();
        let writable = new CollectWritable();
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          writable.on('finish', (): void => {
            finishedAtFinish = writable.writableFinished;
            resolve(undefined as void);
          });
        });
        transform.pipe(writable);
        transform.push(null);
        await finishPromise;
        expect(finishedAtFinish).assertTrue();
        done();
      });

  });
}
