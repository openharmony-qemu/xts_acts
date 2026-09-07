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

import { stream, util } from '@kit.ArkTS';
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

class ChainPassTransform extends stream.Transform {
  public transformCount: int = 0;

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.transformCount++;
    this.push(chunk);
    callback.unsafeCall();
  }
}

class LengthFrameWritable extends stream.Writable {
  public pending: string = '';
  public payloads: string[] = [];
  public payloadLength: int = 0;
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.pending += chunk.toString();
    this.writeCount++;
    let separator: int = this.pending.indexOf('#');
    while (separator >= 0) {
      let length: int = Number.parseInt(this.pending.substring(0, separator)).toInt();
      let payloadStart: int = separator + 1;
      if (this.pending.length < payloadStart + length) {
        break;
      }
      let payload: string = this.pending.substring(payloadStart, payloadStart + length);
      this.payloads.push(payload);
      this.payloadLength += payload.length;
      this.pending = this.pending.substring(payloadStart + length);
      separator = this.pending.indexOf('#');
    }
    callback.unsafeCall();
  }
}

class RerouteReadable extends stream.Readable {
  private chunks: string[] = [];
  private index: int = 0;
  private ended: boolean = false;

  constructor(chunks: string[]) {
    super();
    this.chunks = chunks;
  }

  doRead(size: int): void {
    if (this.ended) {
      return;
    }
    if (this.index < this.chunks.length) {
      this.push(this.chunks[this.index]);
      this.index++;
    } else {
      this.ended = true;
      this.push(null);
    }
  }
}

class RerouteSink extends stream.Writable {
  public receivedData: string = '';
  public writeCount: int = 0;
  public finished: boolean = false;
  public writeObserver: Function | undefined = undefined;

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    if (typeof chunk === 'string') {
      this.receivedData += chunk;
    } else {
      this.receivedData += util.TextDecoder.create(encoding).decodeToString(chunk as Uint8Array);
    }
    let observer: Function | undefined = this.writeObserver;
    if (observer !== undefined) {
      observer.unsafeCall();
    }
    callback.unsafeCall();
  }

  finishCallback(): void {
    this.finished = true;
  }
}

/*
 * Comprehensive multi-method combination scenario: error propagation at a middle node of a pipeline.
 * Through a readable, two Transform stages, and a Writable manual-forwarding pipeline, verifies that when a
 * middle Transform throws during flow, the error propagates to the writing stage and upstream behavior.
 */
class ChainReadable extends stream.Readable {
  private chunks: string[] = [];
  private index: int = 0;
  private ended: boolean = false;

  constructor(chunks: string[]) {
    super();
    this.chunks = chunks;
  }

  doRead(size: int): void {
    if (this.ended) {
      return;
    }
    if (this.index < this.chunks.length) {
      this.push(this.chunks[this.index]);
      this.index++;
    } else {
      this.ended = true;
      this.push(null);
    }
  }
}

/*
 * A Transform that synchronously throws on a specified chunk, used to verify error propagation in a pipeline.
 */
class ChainErrorTransform extends stream.Transform {
  private failOn: string;

  constructor(failOn: string) {
    super();
    this.failOn = failOn;
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    if (chunk === this.failOn) {
      throw new Error('chain transform error');
    }
    this.push(chunk);
    callback.unsafeCall();
  }
}

/*
 * A downstream Writable that collects the incoming data.
 */
class ChainSink extends stream.Writable {
  public chunks: string[] = [];
  public text: string = '';
  public writeCount: int = 0;
  public finished: boolean = false;

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.chunks.push(chunk.toString());
    this.text += chunk.toString();
    this.writeCount++;
    callback.unsafeCall();
  }

  finishCallback(): void {
    this.finished = true;
  }
}

/*
 * Comprehensive multi-method combination scenario: driving a pipeline with non-flowing 'readable'-event
 * consumption. Instead of flowing 'data' events, chunks are pulled explicitly with read() from a paused
 * source and forwarded through a Transform to a Writable sink, verifying that a chain can be driven purely
 * by 'readable' events plus explicit read() calls.
 */
class DriveReadable extends stream.Readable {
  private chunks: string[] = [];
  private index: int = 0;
  private ended: boolean = false;

  constructor(chunks: string[]) {
    super();
    this.chunks = chunks;
  }

  doRead(size: int): void {
    if (this.ended) {
      return;
    }
    if (this.index < this.chunks.length) {
      this.push(this.chunks[this.index]);
      this.index++;
    } else {
      this.ended = true;
      this.push(null);
    }
  }
}

/*
 * A pass-through Transform that pushes each received chunk and records how many chunks were transformed.
 */
class DriveTransform extends stream.Transform {
  public transformCount: int = 0;

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.transformCount++;
    if (typeof chunk === 'string') {
      this.push(chunk);
    } else {
      this.push(util.TextDecoder.create(encoding).decodeToString(chunk as Uint8Array));
    }
    callback.unsafeCall();
  }
}

/*
 * A Writable that collects the incoming data as text.
 */
class DriveSink extends stream.Writable {
  public text: string = '';
  public writeCount: int = 0;

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    if (typeof chunk === 'string') {
      this.text += chunk;
    } else {
      this.text += util.TextDecoder.create(encoding).decodeToString(chunk as Uint8Array);
    }
    callback.unsafeCall();
  }
}

export default function StreamLengthFrameFlowTest(): void {
  describe('StreamLengthFrameFlowTest', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_0100
     * @tc.name testStreamLengthFrameFlow001
     * @tc.desc Verify a Readable-to-Transform-to-frame-sink chain preserves two framed payloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        let capturedTransformCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new LengthFrameWritable();
          let transform = new ChainPassTransform();
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            capturedTransformCount = transform.transformCount;
            resolve(undefined as void);
          });
          let source = new RerouteReadable(['1#a', '2#bc']);
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            sink.end();
          });
          transform.resume();
          source.resume();
        });
        expect(capturedJoined).assertEqual("a|bc");
        expect(capturedPayloadLength).assertEqual(3);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedTransformCount).assertEqual(2);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_0200
     * @tc.name testStreamLengthFrameFlow002
     * @tc.desc Verify two frames packed into one end(data) call are split by their declared lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new LengthFrameWritable();
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.end('1#a2#bc', 'utf8');
        });
        expect(capturedJoined).assertEqual("a|bc");
        expect(capturedPayloadLength).assertEqual(3);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_0300
     * @tc.name testStreamLengthFrameFlow003
     * @tc.desc Verify a header split between writes is buffered until the remaining length and payload arrive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new RerouteReadable(["1", "2#abcdefghijkl"]);
          let sink = new LengthFrameWritable();
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedJoined).assertEqual("abcdefghijkl");
        expect(capturedPayloadLength).assertEqual(12);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_0400
     * @tc.name testStreamLengthFrameFlow004
     * @tc.desc Verify corked header and delimiter fragments reconstruct one three-byte frame
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["3", "#abc"];
          let sink = new LengthFrameWritable();
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write(chunks[0], 'utf8');
          sink.uncork();
          sink.end(chunks[1], 'utf8');
        });
        expect(capturedJoined).assertEqual("abc");
        expect(capturedPayloadLength).assertEqual(3);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_0500
     * @tc.name testStreamLengthFrameFlow005
     * @tc.desc Verify a Transform forwards a split five-byte payload before the frame sink finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["5#ab", "cde"];
          let frameTransform = new ChainPassTransform();
          let sink = new LengthFrameWritable();
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          frameTransform.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          frameTransform.on('end', (): void => {
            sink.end();
          });
          frameTransform.resume();
          frameTransform.write(chunks[0], 'utf8');
          frameTransform.end(chunks[1], 'utf8');
        });
        expect(capturedJoined).assertEqual("abcde");
        expect(capturedPayloadLength).assertEqual(5);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_0600
     * @tc.name testStreamLengthFrameFlow006
     * @tc.desc Verify a payload length digit followed by the next header across writes yields two frames
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["3#abc2", "#de"];
          let source = new RerouteReadable(chunks);
          let frameTransform = new ChainPassTransform();
          let sink = new LengthFrameWritable();
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          source.on('data', (chunk: Object): void => {
            frameTransform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            frameTransform.end();
          });
          frameTransform.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          frameTransform.on('end', (): void => {
            sink.end();
          });
          frameTransform.resume();
          source.resume();
        });
        expect(capturedJoined).assertEqual("abc|de");
        expect(capturedPayloadLength).assertEqual(5);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_0700
     * @tc.name testStreamLengthFrameFlow007
     * @tc.desc Verify every header, delimiter, and payload character boundary is reassembled correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["1", "#", "a", "1", "#", "b"];
          let source = new RerouteReadable(chunks);
          let sink = new LengthFrameWritable();
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedJoined).assertEqual("a|b");
        expect(capturedPayloadLength).assertEqual(2);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(6);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_0800
     * @tc.name testStreamLengthFrameFlow008
     * @tc.desc Verify a zero-length frame crosses a pass-through Transform before completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        let capturedTransformCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new LengthFrameWritable();
          let source = new RerouteReadable(['0#']);
          let transform = new ChainPassTransform();
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            capturedTransformCount = transform.transformCount;
            resolve(undefined as void);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            sink.end();
          });
          transform.resume();
          source.resume();
        });
        expect(capturedJoined).assertEqual("");
        expect(capturedPayloadLength).assertEqual(0);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedTransformCount).assertEqual(1);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_0900
     * @tc.name testStreamLengthFrameFlow009
     * @tc.desc Verify separate source chunks emit an empty frame followed by abc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["0#", "3#abc"];
          let source = new RerouteReadable(chunks);
          let sink = new LengthFrameWritable();
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedJoined).assertEqual("|abc");
        expect(capturedPayloadLength).assertEqual(3);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_1000
     * @tc.name testStreamLengthFrameFlow010
     * @tc.desc Verify one input containing declared lengths 1, 3, and 5 produces three payloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["1#a3#bbb5#ccccc"];
          let sink = new LengthFrameWritable();
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write(chunks[0], 'utf8');
          sink.uncork();
          sink.end();
        });
        expect(capturedJoined).assertEqual("a|bbb|ccccc");
        expect(capturedPayloadLength).assertEqual(9);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_1100
     * @tc.name testStreamLengthFrameFlow011
     * @tc.desc Verify a delimiter inside the payload remains data because framing uses length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new LengthFrameWritable();
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let source = new RerouteReadable(['3#', 'a#b']);
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedJoined).assertEqual("a#b");
        expect(capturedPayloadLength).assertEqual(3);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_1200
     * @tc.name testStreamLengthFrameFlow012
     * @tc.desc Verify a 100-byte declared payload is retained across three writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["100#", "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"];
          let sink = new LengthFrameWritable();
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let source = new RerouteReadable(chunks);
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedJoined)
          .assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        expect(capturedPayloadLength).assertEqual(100);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_1300
     * @tc.name testStreamLengthFrameFlow013
     * @tc.desc Verify a complete frame and the next header in one chunk produce two outputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedJoined: string = '';
        let capturedPayloadLength: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["4#data3#", "end"];
          let sink = new LengthFrameWritable();
          sink.setDefaultEncoding('utf8');
          sink.on('finish', (): void => {
            capturedJoined = sink.payloads.join('|');
            capturedPayloadLength = sink.payloadLength;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.write(chunks[0], 'utf8');
          sink.end(chunks[1], 'utf8');
        });
        expect(capturedJoined).assertEqual("data|end");
        expect(capturedPayloadLength).assertEqual(7);
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_1400
     * @tc.name testStreamLengthFrameFlow014
     * @tc.desc Verify unpipe reroutes remaining source chunks from w1 to w2 and records both connection lifecycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let w1Data: string = '';
      let w2Data: string = '';
      let pipeOnW1: int = 0;
      let pipeOnW2: int = 0;
      let unpipeOnW1: int = 0;
      let unpipeOnW2: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let source = new RerouteReadable(['a', 'b', 'c']);
        let w1 = new RerouteSink();
        let w2 = new RerouteSink();
        let rerouted: boolean = false;
        let onPipe1: Function = (src: Object): void => {
          pipeOnW1++;
        };
        let onPipe2: Function = (src: Object): void => {
          pipeOnW2++;
        };
        let onUnpipe1: Function = (src: Object): void => {
          unpipeOnW1++;
        };
        let onUnpipe2: Function = (src: Object): void => {
          unpipeOnW2++;
        };
        w1.on('pipe', onPipe1);
        w2.on('pipe', onPipe2);
        w1.on('unpipe', onUnpipe1);
        w2.on('unpipe', onUnpipe2);
        w1.writeObserver = (): void => {
          if (!rerouted) {
            rerouted = true;
            source.unpipe(w1);
            source.pipe(w2);
            source.resume();
          }
        };
        source.on('end', (): void => {
          w2.end();
        });
        w2.on('finish', (): void => {
          w1Data = w1.receivedData;
          w2Data = w2.receivedData;
          resolve(undefined as void);
        });
        source.pipe(w1);
        source.resume();
      });
      expect(pipeOnW1).assertEqual(1);
      expect(pipeOnW2).assertEqual(1);
      expect(unpipeOnW1).assertEqual(1);
      expect(unpipeOnW2).assertEqual(1);
      expect(w1Data).assertEqual('a');
      expect(w2Data).assertEqual('bc');
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_1500
     * @tc.name testStreamLengthFrameFlow015
     * @tc.desc Verify unpipe followed by re-pipe to the same writable resumes delivery without losing xyz
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let wData: string = '';
      await new Promise<void>((resolve: (value: void) => void): void => {
        let source = new RerouteReadable(['x', 'y', 'z']);
        let w1 = new RerouteSink();
        let reconnected: boolean = false;
        w1.writeObserver = (): void => {
          if (!reconnected) {
            reconnected = true;
            source.unpipe(w1);
            source.pipe(w1);
            source.resume();
          }
          if (w1.writeCount >= 3) {
            wData = w1.receivedData;
            resolve(undefined as void);
          }
        };
        source.pipe(w1);
        source.resume();
      });
      expect(wData).assertEqual('xyz');
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_1600
     * @tc.name testStreamLengthFrameFlow016
     * @tc.desc Verify Transform write return values change at the high-water mark for small and oversized input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new ChainPassTransform();
      let smallOk: boolean = t.write(new Uint8Array(10));
      let bigOk: boolean = t.write(new Uint8Array(20000));
      expect(smallOk).assertTrue();
      expect(bigOk).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_1700
     * @tc.name testStreamLengthFrameFlow017
     * @tc.desc Verify a middle Transform error drops only b while a and c still reach the sink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let errorName: string = '';
      let sinkText: string = '';
      let transformCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let source = new ChainReadable(['a', 'b', 'c']);
        let t1 = new ChainPassTransform();
        let t2 = new ChainErrorTransform('b');
        let sink = new ChainSink();
        let settle: Function = (): void => {
          if (errorName === 'Error' && sink.writeCount > 0) {
            sinkText = sink.text;
            transformCount = t1.transformCount;
            resolve(undefined as void);
          }
        };
        source.on('data', (chunk: Object): void => {
          t1.write(chunk.toString(), 'utf8');
        });
        source.on('end', (): void => {
          t1.end();
        });
        t1.on('data', (chunk: Object): void => {
          try {
            t2.write(chunk.toString(), 'utf8');
          } catch (e) {
            expect(e.name).assertEqual('Error');
            errorName = e.name;
            settle();
          }
        });
        t1.on('end', (): void => {
          t2.end();
        });
        t2.on('data', (chunk: Object): void => {
          sink.write(chunk.toString(), 'utf8');
          settle();
        });
        t2.on('end', (): void => {
          sink.end();
        });
        source.resume();
      });
      expect(errorName).assertEqual('Error');
      expect(sinkText).assertEqual('ac');
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_1800
     * @tc.name testStreamLengthFrameFlow018
     * @tc.desc Verify an error on the first Transform chunk prevents all input from reaching the sink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let errorName: string = '';
      let sinkWriteCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let source = new ChainReadable(['x', 'y']);
        let t2 = new ChainErrorTransform('x');
        let sink = new ChainSink();
        source.on('data', (chunk: Object): void => {
          try {
            t2.write(chunk.toString(), 'utf8');
          } catch (e) {
            expect(e.name).assertEqual('Error');
            errorName = e.name;
            sinkWriteCount = sink.writeCount;
            resolve(undefined);
          }
        });
        source.on('end', (): void => {
          t2.end();
        });
        t2.on('data', (chunk: Object): void => {
          sink.write(chunk.toString(), 'utf8');
        });
        source.resume();
      });
      expect(errorName).assertEqual('Error');
      expect(sinkWriteCount).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_LENGTH_FRAME_FLOW_1900
     * @tc.name testStreamLengthFrameFlow019
     * @tc.desc Verify nested readable and read() consumers pull both source and Transform output end-to-end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamLengthFrameFlow019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let sinkText: string = '';
      let transformCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let source = new DriveReadable([]);
        let t = new DriveTransform();
        let sink = new DriveSink();
        source.on('readable', (): void => {
          let chunk = source.read();
          while (chunk !== null) {
            t.write(chunk.toString(), 'utf8');
            chunk = source.read();
          }
        });
        source.on('end', (): void => {
          t.end();
        });
        t.on('readable', (): void => {
          let chunk = t.read();
          while (chunk !== null) {
            sink.write(chunk.toString(), 'utf8');
            chunk = t.read();
          }
        });
        t.on('end', (): void => {
          sink.end();
        });
        sink.on('finish', (): void => {
          sinkText = sink.text;
          transformCount = t.transformCount;
          resolve(undefined as void);
        });
        source.push('x');
        source.push('y');
        source.push('z');
        source.push(null);
      });
      expect(sinkText).assertEqual('xyz');
      expect(transformCount).assertEqual(1);

      done();
    });
  });
}
