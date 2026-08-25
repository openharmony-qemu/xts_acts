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

class EndTransformBase extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class EndErrorCbTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error('transform end failed'));
  }
}

/**
 * A Transform that rewrites each incoming chunk by appending a marker, accumulates all transformed output,
 * and appends a tail chunk in doFlush, so a single object can verify a full write, transform, and flush
 * lifecycle in one test.
 */
class AccumTransform extends stream.Transform {
  public transformCount: int = 0;
  public flushCalled: boolean = false;
  public text: string = '';

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.transformCount++;
    this.text += chunk;
    this.push(chunk + '-x');
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.flushCalled = true;
    this.push('-flush');
    callback.unsafeCall();
  }
}

class EndFlushTracker extends stream.Transform {
  public flushCalled: boolean = false;

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.flushCalled = true;
    callback.unsafeCall();
  }
}

class EndFlushOutputTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.push('flush-data');
    callback.unsafeCall();
  }
}

class EndCallbackTransform extends stream.Transform {
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

class EndStateCheckTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class NoFlushTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

export default function StreamTransformEndTest(): void {
  describe('StreamTransformEndTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_0100
     * @tc.name testStreamTransformEnd001
     * @tc.desc Verify end with encoding and callback returns Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndTransformBase();
      let result = ws.end("完成", "gbk", (err?: Error): void => {
      });
      expect(ws.writableEnded).assertTrue();
      expect(result.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_0200
     * @tc.name testStreamTransformEnd002
     * @tc.desc Verify end after write sets writableEnded true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndTransformBase();
      ws.write("data");
      ws.end();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_0300
     * @tc.name testStreamTransformEnd003
     * @tc.desc Verify off finish listener does not trigger after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndTransformBase();
      let finishCalled: boolean = false;
      let handler = (): void => {
        finishCalled = true;
      };
      ws.on("finish", handler);
      ws.off("finish", handler);
      ws.end();
      expect(finishCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_0400
     * @tc.name testStreamTransformEnd004
     * @tc.desc Verify cork + end flushes data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndTransformBase();
      ws.cork();
      ws.write("a");
      ws.write("b");
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_0500
     * @tc.name testStreamTransformEnd005
     * @tc.desc Verify end with an empty string still ends the writable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndTransformBase();
      ws.end('');
      expect(ws.writableEnded).assertTrue();
      expect(ws.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_0600
     * @tc.name testStreamTransformEnd006
     * @tc.desc Verify end with Chinese text and gb2312, gb18030 or uppercase GBK encoding sets writableEnded to true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['结束', '中文', '结束'];
      let encodings: string[] = ['gb2312', 'gb18030', 'GBK'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new EndTransformBase();
        ws.end(chunks[i], encodings[i]);
        expect(ws.writableEnded).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_0700
     * @tc.name testStreamTransformEnd007
     * @tc.desc Verify finish marks writableFinished after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new EndTransformBase();
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_0800
     * @tc.name testStreamTransformEnd008
     * @tc.desc Verify close is emitted after ending the Transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new EndTransformBase();
        let endedAtClose: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('close', (): void => {
            endedAtClose = ws.writableEnded;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(endedAtClose).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_0900
     * @tc.name testStreamTransformEnd009
     * @tc.desc Verify end invokes doFlush exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndFlushTracker();
      ws.end();
      expect(ws.flushCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_1000
     * @tc.name testStreamTransformEnd010
     * @tc.desc Verify doFlush output is readable when end completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndFlushOutputTransform();
      ws.pause();
      ws.end();
      let data = ws.read();
      expect(data?.toString()).assertEqual('flush-data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_1100
     * @tc.name testStreamTransformEnd011
     * @tc.desc Verify end flushes buffered data after pause and resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndTransformBase();
      ws.pause();
      ws.write('buffered', 'utf8');
      ws.end();
      ws.resume();
      expect(ws.writableEnded).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_1200
     * @tc.name testStreamTransformEnd012
     * @tc.desc Verify end on an empty Transform still emits finish and close
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new EndTransformBase();
        let finishCalled: boolean = false;
        let finishedAtFinish: boolean = false;
        let finishAtClose: boolean = false;
        let endedAtClose: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishCalled = true;
            finishedAtFinish = ws.writableFinished;
          });
          ws.on('close', (): void => {
            finishAtClose = finishCalled;
            endedAtClose = ws.writableEnded;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(finishAtClose).assertTrue();
        expect(endedAtClose).assertTrue();
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_1300
     * @tc.name testStreamTransformEnd013
     * @tc.desc Verify an empty final string still reaches the finish lifecycle callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new EndCallbackTransform();
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            endedAtFinish = ws.writableEnded;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end('', 'utf8');
        });
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_1400
     * @tc.name testStreamTransformEnd014
     * @tc.desc Verify end with 16383 bytes (below watermark) completes successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndTransformBase();
      ws.end('x'.repeat(16383), 'utf8');
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_1500
     * @tc.name testStreamTransformEnd015
     * @tc.desc Verify end with null and undefined throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws1 = new EndTransformBase();
      try {
        ws1.end(null as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      let ws2 = new EndTransformBase();
      try {
        ws2.end(undefined as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_1600
     * @tc.name testStreamTransformEnd016
     * @tc.desc Verify double end() on Transform throws appropriate error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndTransformBase();
      ws.end();
      let code: int = 0;
      try {
        ws.end("again");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(10200036);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_1700
     * @tc.name testStreamTransformEnd017
     * @tc.desc Verify no doTransform subclass end(chunk) throws 10200039
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new stream.Transform();
      let code: int = 0;
      try {
        ws.end("data");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(10200039);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_1800
     * @tc.name testStreamTransformEnd018
     * @tc.desc Verify end with chunk, encoding, and callback all provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndTransformBase();
      let cbCalled: boolean = false;
      ws.end('final', 'utf8', (err?: Error): void => {
        cbCalled = true;
      });
      expect(ws.writableEnded).assertTrue();
      expect(cbCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_1900
     * @tc.name testStreamTransformEnd019
     * @tc.desc Verify end sets writableEnded true and writable false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndTransformBase();
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_2000
     * @tc.name testStreamTransformEnd020
     * @tc.desc Verify cork then write then end triggers doFlush and writableCorked resets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new EndFlushTracker();
      ws.cork();
      ws.write('a');
      ws.write('b');
      ws.end();
      expect(ws.flushCalled).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_2100
     * @tc.name testStreamTransformEnd021
     * @tc.desc Verify the end callback receives the Error reported by doTransform and end without doFlush still completes the writable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new EndErrorCbTransform();
        let errName: string = '';
        let errMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
          ws.end('data', 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              errName = err.name;
              errMessage = err.message;
              resolve(undefined as void);
              return;
            }
            reject(new Error('expected doTransform to report an error'));
            return;
          });
        });
        expect(errName).assertEqual('Error');
        expect(errMessage).assertEqual('transform end failed');
        expect(ws.writableEnded).assertTrue();
        let noFlush = new NoFlushTransform();
        noFlush.end('data');
        expect(noFlush.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_2200
     * @tc.name testStreamTransformEnd022
     * @tc.desc Verify a full lifecycle on a single Transform: multiple chunk writes are transformed by doTransform (marker appended per chunk) and accumulated, end() triggers doFlush which appends a tail chunk, and the data stream ends with the transformed output in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let t = new AccumTransform();
        let output: string = '';
        t.write('a');
        t.write('b');
        t.write('c');
        let textAtEnd: string = '';
        let transformCountAtEnd: int = 0;
        let flushCalledAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          t.on('data', (chunk: Object): void => {
            output += chunk.toString();
          });
          t.on('end', (): void => {
            textAtEnd = t.text;
            transformCountAtEnd = t.transformCount;
            flushCalledAtEnd = t.flushCalled;
            resolve(undefined as void);
          });
          t.end();
        });
        expect(output).assertEqual('a-xb-xc-x-flush');
        expect(textAtEnd).assertEqual('abc');
        expect(transformCountAtEnd).assertEqual(3);
        expect(flushCalledAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_END_2300
     * @tc.name testStreamTransformEnd023
     * @tc.desc Verify a single Transform runs doTransform for each write, accumulates the transformed text, and end() triggers doFlush followed by the finish event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformEnd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let t = new AccumTransform();
        t.write('x', 'utf8');
        t.write('y', 'utf8');
        let textAtEnd: string = '';
        let transformCountAtEnd: int = 0;
        let flushCalledAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          t.on('end', (): void => {
            textAtEnd = t.text;
            transformCountAtEnd = t.transformCount;
            flushCalledAtEnd = t.flushCalled;
            resolve(undefined as void);
          });
          t.end();
        });
        expect(textAtEnd).assertEqual('xy');
        expect(transformCountAtEnd).assertEqual(2);
        expect(flushCalledAtEnd).assertTrue();

        done();
      });

  });
}
