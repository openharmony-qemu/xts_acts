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

class WriteTransformBase extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class TrackDoTransform extends stream.Transform {
  public doTransformCalled: boolean = false;

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.doTransformCalled = true;
    this.push(chunk);
    callback.unsafeCall();
  }
}

class TrackEncodingTransform extends stream.Transform {
  public lastEncoding: string = '';
  public lastChunk: string | Uint8Array = '';

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.lastChunk = chunk;
    this.lastEncoding = encoding;
    this.push(chunk);
    callback.unsafeCall();
  }
}

class WriteSequenceTransform extends stream.Transform {
  public chunks: string[] = [];

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.chunks.push(chunk as string);
    this.push(chunk);
    callback.unsafeCall();
  }
}

class TrackCallCountTransform extends stream.Transform {
  public callCount: int = 0;

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.callCount++;
    this.push(chunk);
    callback.unsafeCall();
  }
}

class DoubleCallbackTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class CallbackErrorTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall(new Error("transform fail"));
  }
}

class WriteToBufferTransform extends stream.Transform {
  public received: string[] = [];

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.received.push(chunk as string);
    callback.unsafeCall();
  }
}

export default function StreamTransformWriteTest(): void {
  describe('StreamTransformWriteTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_0100
     * @tc.name testStreamTransformWrite001
     * @tc.desc Verify string write returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      ws.pause();
      let result = ws.write("test");
      expect(result).assertTrue();
      expect(ws.read()?.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_0200
     * @tc.name testStreamTransformWrite002
     * @tc.desc Verify Uint8Array write returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      ws.pause();
      let result = ws.write(new Uint8Array([72, 101, 108, 108, 111]), "utf8");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_0300
     * @tc.name testStreamTransformWrite003
     * @tc.desc Verify write of Chinese text with gbk, gb18030 and gb2312 encodings returns true and reads back the original text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['测试工程师', '中文', '测试'];
      let encodings: string[] = ['gbk', 'gb18030', 'gb2312'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new WriteTransformBase();
        ws.pause();
        let result = ws.write(chunks[i], encodings[i]);
        expect(result).assertTrue();
        expect(ws.read()?.toString()).assertEqual(chunks[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_0400
     * @tc.name testStreamTransformWrite004
     * @tc.desc Verify write with callback does not error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteTransformBase();
        let output: string = '';
        let result: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
          ws.on('data', (chunk: Object): void => {
            output = chunk.toString();
            resolve(undefined as void);
          });
          ws.resume();
          result = ws.write("data", "utf8", (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
          });
        });
        expect(result).assertTrue();
        expect(output).assertEqual("data");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_0500
     * @tc.name testStreamTransformWrite005
     * @tc.desc Verify a valid write leaves the error event inactive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      let errorFired: boolean = false;
      ws.on('error', (): void => {
        errorFired = true;
      });
      ws.pause();
      let result = ws.write("valid");
      expect(result).assertTrue();
      expect(errorFired).assertFalse();
      expect(ws.read()?.toString()).assertEqual("valid");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_0600
     * @tc.name testStreamTransformWrite006
     * @tc.desc Verify write with uppercase UTF-8 encoding returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      ws.pause();
      let result = ws.write("test", "UTF-8");
      expect(result).assertTrue();
      expect(ws.read()?.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_0700
     * @tc.name testStreamTransformWrite007
     * @tc.desc Verify empty string write throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      try {
        ws.write("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_0800
     * @tc.name testStreamTransformWrite008
     * @tc.desc Verify no doTransform throws 10200039 on write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new stream.Transform();
      let code: int = 0;
      try {
        ws.write("data");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(10200039);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_0900
     * @tc.name testStreamTransformWrite009
     * @tc.desc Verify write with emoji data returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      ws.pause();
      let result = ws.write("😀");
      expect(result).assertTrue();
      expect(ws.readableLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_1000
     * @tc.name testStreamTransformWrite010
     * @tc.desc Verify write uses utf8 when encoding is omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TrackEncodingTransform();
      ws.pause();
      ws.write('default-encoding');
      expect(ws.lastEncoding).assertEqual('utf8');
      expect((ws.lastChunk as string)).assertEqual('default-encoding');
      expect(ws.read()?.toString()).assertEqual('default-encoding');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_1100
     * @tc.name testStreamTransformWrite011
     * @tc.desc Verify write forwards gb18030 encoding to doTransform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TrackEncodingTransform();
      ws.pause();
      ws.write('encoded', 'gb18030');
      expect(ws.lastEncoding).assertEqual('gb18030');
      expect(ws.read()?.toString()).assertEqual('encoded');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_1200
     * @tc.name testStreamTransformWrite012
     * @tc.desc Verify a one-byte write is transformed and readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      ws.pause();
      let result = ws.write('x', 'utf8');
      expect(result).assertTrue();
      expect(ws.readableLength).assertEqual(1);
      expect(ws.read()?.toString()).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_1300
     * @tc.name testStreamTransformWrite013
     * @tc.desc Verify sequential writes preserve chunk order in the transform output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteSequenceTransform();
      ws.pause();
      expect(ws.write('first', 'utf8')).assertTrue();
      expect(ws.write('second', 'utf8')).assertTrue();
      expect(ws.chunks.length).assertEqual(2);
      expect(ws.chunks[0]).assertEqual('first');
      expect(ws.chunks[1]).assertEqual('second');
      expect(ws.readableLength).assertEqual(11);
      expect(ws.read()?.toString()).assertEqual('firstsecond');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_1400
     * @tc.name testStreamTransformWrite014
     * @tc.desc Verify write 16383 bytes (below watermark) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      ws.pause();
      let result = ws.write('x'.repeat(16383), 'utf8');
      expect(result).assertTrue();
      expect(ws.readableLength).assertEqual(16383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_1500
     * @tc.name testStreamTransformWrite015
     * @tc.desc Verify write at and above the 16384-byte watermark applies backpressure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16384, 16385];
      for (let i = 0; i < sizes.length; i++) {
        let ws = new WriteTransformBase();
        ws.pause();
        let result = ws.write("x".repeat(sizes[i]), "utf8");
        expect(result).assertFalse();
        expect(ws.readableLength).assertEqual(sizes[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_1600
     * @tc.name testStreamTransformWrite016
     * @tc.desc Verify a 100KB Uint8Array write triggers strong backpressure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      ws.pause();
      let result = ws.write(new Uint8Array(102400), 'utf8');
      expect(result).assertFalse();
      expect(ws.writableLength).assertEqual(102400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_1700
     * @tc.name testStreamTransformWrite017
     * @tc.desc Verify write with GBK uppercase encoding forwards correctly to doTransform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TrackEncodingTransform();
      ws.pause();
      ws.write('大写测试', 'GBK');
      expect(ws.lastEncoding).assertEqual('GBK');
      expect(ws.read()?.toString()).assertEqual('大写测试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_1800
     * @tc.name testStreamTransformWrite018
     * @tc.desc Verify flowing mode triggers data event on write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteTransformBase();
        let dataAtData: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('data', (chunk: Object): void => {
            dataAtData = chunk.toString();
            resolve(undefined as void);
          });
          ws.write('flowingData', 'utf8');
        });
        expect(dataAtData).assertEqual('flowingData');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_1900
     * @tc.name testStreamTransformWrite019
     * @tc.desc Verify pause mode does not trigger data event on write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      ws.pause();
      let dataFired: boolean = false;
      ws.on('data', (chunk: Object): void => {
        dataFired = true;
      });
      ws.write('pausedData', 'utf8');
      expect(dataFired).assertFalse();
      expect(ws.readableLength).assertEqual(10);
      expect(ws.read()?.toString()).assertEqual('pausedData');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_2000
     * @tc.name testStreamTransformWrite020
     * @tc.desc Verify callback with Error triggers error event on Transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new CallbackErrorTransform();
        ws.pause();
        let errName: string = '';
        let errMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: Error): void => {
            errName = err.name;
            errMessage = err.message;
            resolve(undefined as void);
          });
          ws.write('errortest', 'utf8');
        });
        expect(errName).assertEqual('Error');
        expect(errMessage).assertEqual('transform fail');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_2100
     * @tc.name testStreamTransformWrite021
     * @tc.desc Verify write with null and undefined throws ClassCastError in Transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws1 = new WriteTransformBase();
      try {
        ws1.write(null as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      let ws2 = new WriteTransformBase();
      try {
        ws2.write(undefined as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_2200
     * @tc.name testStreamTransformWrite022
     * @tc.desc Verify write with unsupported base64 encoding throws in Transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      try {
        ws.write('test', 'base64');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_2300
     * @tc.name testStreamTransformWrite023
     * @tc.desc Verify write with empty encoding string uses the default encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TrackEncodingTransform();
      ws.pause();
      let result = ws.write('test', '');
      expect(result).assertTrue();
      expect(ws.lastEncoding).assertEqual('utf8');
      expect(ws.lastChunk).assertEqual('test');
      expect(ws.read()?.toString()).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_2400
     * @tc.name testStreamTransformWrite024
     * @tc.desc Verify flowing mode preserves the order of multiple data events
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteTransformBase();
        let dataAtData: string = '';
        let dataCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('data', (data: Object): void => {
            dataAtData += data.toString();
            dataCount++;
            if (dataCount == 2) {
              resolve(undefined as void);
            }
          });
          ws.write('first', 'utf8');
          ws.write('second', 'utf8');
        });
        expect(dataCount).assertEqual(2);
        expect(dataAtData).assertEqual('firstsecond');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_2500
     * @tc.name testStreamTransformWrite025
     * @tc.desc Verify pause mode supports partial reads from buffered write data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      ws.pause();
      ws.write('hello', 'utf8');
      expect(ws.read(2)?.toString()).assertEqual('he');
      expect(ws.read()?.toString()).assertEqual('llo');
      expect(ws.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_2600
     * @tc.name testStreamTransformWrite026
     * @tc.desc Verify write callback overload without doTransform throws 10200039
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws1 = new stream.Transform();
      try {
        ws1.write("data", "utf8", (err?: Error): void => {
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200039);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_2700
     * @tc.name testStreamTransformWrite027
     * @tc.desc Verify empty Uint8Array write is accepted without readable output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteTransformBase();
        ws.pause();
        let result = ws.write(new Uint8Array(0), 'utf8');
        await new Promise<void>((resolve: (value: void) => void): void => {
          setTimeout((): void => {
            resolve(undefined as void);
          }, 0);
        });
        expect(result).assertTrue();
        expect(ws.readableLength).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_WRITE_2800
     * @tc.name testStreamTransformWrite028
     * @tc.desc Verify binary write returns false under backpressure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformWrite028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTransformBase();
      ws.pause();
      let result = ws.write(new Uint8Array(20000), 'utf8');
      expect(result).assertFalse();
    });

  });
}
