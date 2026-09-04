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
import { buffer, stream, util } from '@kit.ArkTS';

class ExplicitFullStackReadable extends stream.Readable {
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

class ExplicitManualReadable extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class SlowConsumeWritable extends stream.Writable {
  public received: string[] = [];
  public writeCount: int = 0;
  public collected: string = '';
  private delayMs: int = 0;

  constructor(delayMs: int) {
    super();
    this.delayMs = delayMs;
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let text: string = '';
    if (typeof chunk === 'string') {
      text = chunk as string;
    } else if (buffer.isBuffer(chunk)) {
      text = chunk.toString();
    } else {
      text = util.TextDecoder.create('utf-8').decodeToString(chunk as Uint8Array);
    }
    this.received.push(text);
    this.collected += text;
    this.writeCount++;
    setTimeout((): void => {
      callback.unsafeCall();
    }, this.delayMs);
  }
}

class CountingReadable extends stream.Readable {
  private chunks: string[] = [];
  private index: int = 0;

  constructor(chunks: string[]) {
    super();
    this.chunks = chunks;
    this.index = 0;
  }

  doRead(size: int): void {
    if (this.index < this.chunks.length) {
      this.push(this.chunks[this.index]);
      this.index++;
    } else {
      this.push(null);
    }
  }
}

class ErrorEmitReadable extends stream.Readable {
  private chunks: string[] = [];
  private index: int = 0;
  private errorAfter: int = 0;
  private errorMessage: string = '';

  constructor(chunks: string[], errorAfter: int, errorMessage: string) {
    super();
    this.chunks = chunks;
    this.index = 0;
    this.errorAfter = errorAfter;
    this.errorMessage = errorMessage;
  }

  doRead(size: int): void {
    if (this.index === this.errorAfter) {
      this.index++;
      throw new Error(this.errorMessage);
    }
    if (this.index < this.chunks.length) {
      this.push(this.chunks[this.index]);
      this.index++;
    } else {
      this.push(null);
    }
  }
}

class ErrorOnChunkTransform extends stream.Transform {
  private errorChunk: string = '';
  private errorMessage: string = '';
  public acceptedChunks: string[] = [];

  constructor(errorChunk: string, errorMessage: string) {
    super();
    this.errorChunk = errorChunk;
    this.errorMessage = errorMessage;
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let text: string = chunk as string;
    if (text === this.errorChunk) {
      callback.unsafeCall(new Error(this.errorMessage));
      return;
    }
    this.acceptedChunks.push(text);
    this.push(text);
    callback.unsafeCall();
  }
}

class IdentityTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class UppercaseTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let s: string = chunk as string;
    if (s.length > 0) {
      this.push(s.toUpperCase());
    }
    callback.unsafeCall();
  }
}

class PrefixTransform extends stream.Transform {
  private prefix: string = '';
  private counter: int = 0;

  constructor(prefix: string) {
    super();
    this.prefix = prefix;
    this.counter = 0;
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.counter++;
    this.push(this.prefix + this.counter + ':' + (chunk as string));
    callback.unsafeCall();
  }
}

class FilterTransform extends stream.Transform {
  private filterPrefix: string = '';

  constructor(filterPrefix: string) {
    super();
    this.filterPrefix = filterPrefix;
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let s: string = chunk as string;
    if (!s.startsWith(this.filterPrefix)) {
      this.push(s);
    }
    callback.unsafeCall();
  }
}

class AggregateFlushTransform extends stream.Transform {
  private items: string[] = [];
  private separator: string = '';

  constructor(separator: string) {
    super();
    this.items = [];
    this.separator = separator;
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.items.push(chunk as string);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.push(this.items.join(this.separator));
    callback.unsafeCall();
  }
}

class CollectWritable extends stream.Writable {
  public received: string[] = [];
  public writeCount: int = 0;
  public collected: string = '';

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let text: string = '';
    if (typeof chunk === 'string') {
      text = chunk as string;
    } else if (buffer.isBuffer(chunk)) {
      text = chunk.toString();
    } else {
      text = util.TextDecoder.create('utf-8').decodeToString(chunk as Uint8Array);
    }
    this.received.push(text);
    this.writeCount++;
    this.collected += text;
    callback.unsafeCall();
  }
}

class BidirectionalDuplex extends stream.Duplex {
  public writeSideReceived: string[] = [];
  public readSidePushed: string[] = [];
  private readQueue: string[] = [];

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let text: string = chunk as string;
    this.writeSideReceived.push(text);
    this.push('w2r:' + text);
    callback.unsafeCall();
  }

  doRead(size: int): void {
    if (this.readQueue.length > 0) {
      let item: string = this.readQueue.shift() as string;
      this.readSidePushed.push(item);
      this.push('r2r:' + item);
    }
  }

  pushExternal(data: string): void {
    this.readQueue.push(data);
  }

  endExternal(): void {
    this.push(null);
  }
}

class RelayDuplex extends stream.Duplex {
  public writeReceived: string[] = [];

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let text: string = chunk as string;
    this.writeReceived.push(text);
    this.push('W:' + text);
    callback.unsafeCall();
  }

  doRead(size: int): void {
  }
}

function connectStreams(source: stream.Readable, target: stream.Writable | stream.Duplex): void {
  source.on('data', (chunk: Object): void => {
    let text: string = '';
    if (typeof chunk === 'string') {
      text = chunk as string;
    } else if (buffer.isBuffer(chunk)) {
      text = chunk.toString();
    } else {
      text = util.TextDecoder.create('utf-8').decodeToString(chunk as Uint8Array);
    }
    target.write(text, 'utf8');
  });
  source.on('end', (): void => {
    target.end();
  });
  setTimeout((): void => {
    source.resume();
  }, 0);
}

class FailFirstWritable extends stream.Writable {
  public writeCount: int = 0;
  private failed: boolean = false;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    if (!this.failed) {
      this.failed = true;
      callback.unsafeCall(new Error('downstream consumer crashed'));
      return;
    }
    callback.unsafeCall();
  }
}

class ExplicitFullStackTransform extends stream.Transform {
  private prefix: string = '';
  private suffix: string = '';
  public transformCount: int = 0;

  constructor(prefix: string, suffix: string = '') {
    super();
    this.prefix = prefix;
    this.suffix = suffix;
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.transformCount++;
    this.push(this.prefix + chunk.toString());
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    if (this.suffix.length > 0) {
      this.push(this.suffix);
    }
    callback.unsafeCall();
  }
}

class ExplicitFullStackDuplex extends stream.Duplex {
  private prefix: string = '';
  public writeCount: int = 0;

  constructor(prefix: string) {
    super();
    this.prefix = prefix;
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    this.push(this.prefix + chunk.toString());
    callback.unsafeCall();
  }
}

class ExplicitFullStackWritable extends stream.Writable {
  public text: string = '';
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.text += chunk.toString();
    this.writeCount++;
    callback.unsafeCall();
  }
}

class ExplicitFanoutTransform extends stream.Transform {
  public transformCount: int = 0;

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.transformCount++;
    let value: string = chunk.toString();
    this.push('L:' + value);
    this.push('R:' + value);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class ExplicitFlushOnlyTransform extends stream.Transform {
  public transformCount: int = 0;

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.transformCount++;
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.push('<flush-only>');
    callback.unsafeCall();
  }
}

export default function StreamExplicitPipelineFlowTest(): void {
  describe('StreamExplicitPipelineFlowTest', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_0100
     * @tc.name testStreamExplicitFullStackFlow001
     * @tc.desc Verify an explicit Readable Transform Duplex Writable pipe preserves a two-record business flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedTransformCount: int = 0;
        let capturedDuplexWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ExplicitFullStackReadable(['A', 'B']);
          let transform = new ExplicitFullStackTransform('T:');
          let duplex = new ExplicitFullStackDuplex('D:');
          let sink = new ExplicitFullStackWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedTransformCount = transform.transformCount;
            capturedDuplexWriteCount = duplex.writeCount;
            resolve(undefined as void);
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedText).assertEqual('D:T:AD:T:B');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedTransformCount).assertEqual(2);
        expect(capturedDuplexWriteCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_0200
     * @tc.name testStreamExplicitFullStackFlow002
     * @tc.desc Verify explicit Readable.read calls write records into Transform then Duplex and Writable stages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ExplicitManualReadable();
          let transform = new ExplicitFullStackTransform('T:');
          let duplex = new ExplicitFullStackDuplex('D:');
          let sink = new ExplicitFullStackWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          transform.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            duplex.end();
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('end', (): void => {
            sink.end();
          });
          source.push('one');
          source.push(null);
          let chunk: Object | null = source.read();
          let value: string = chunk === null ? '' : chunk.toString();
          transform.write(value, 'utf8');
          transform.end();
        });
        expect(capturedText).assertEqual('D:T:one');
        expect(capturedWriteCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_0300
     * @tc.name testStreamExplicitFullStackFlow003
     * @tc.desc Verify pause and resume on an explicit four-stage stream flow preserves all records and order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ExplicitFullStackReadable(['1', '2', '3']);
          let transform = new ExplicitFullStackTransform('T:');
          let duplex = new ExplicitFullStackDuplex('D:');
          let sink = new ExplicitFullStackWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('end', (): void => {
            sink.end();
          });
          source.pause();
          setTimeout((): void => {
            source.resume();
          }, 10);
        });
        expect(capturedText).assertEqual('D:T:1D:T:2D:T:3');
        expect(capturedWriteCount).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_0400
     * @tc.name testStreamExplicitFullStackFlow004
     * @tc.desc Verify Transform doFlush output travels through Duplex before Writable finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ExplicitFullStackReadable(['body']);
          let transform = new ExplicitFullStackTransform('T:', '<flush>');
          let duplex = new ExplicitFullStackDuplex('D:');
          let sink = new ExplicitFullStackWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedText).assertEqual('D:T:bodyD:<flush>');
        expect(capturedWriteCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_0500
     * @tc.name testStreamExplicitFullStackFlow005
     * @tc.desc Verify two explicit Transform stages preserve stage order before Duplex and Writable consumption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedFirstTransformCount: int = 0;
        let capturedSecondTransformCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ExplicitFullStackReadable(['x', 'y']);
          let first = new ExplicitFullStackTransform('T1:');
          let second = new ExplicitFullStackTransform('T2:');
          let duplex = new ExplicitFullStackDuplex('D:');
          let sink = new ExplicitFullStackWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedFirstTransformCount = first.transformCount;
            capturedSecondTransformCount = second.transformCount;
            resolve(undefined as void);
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          source.on('data', (chunk: Object): void => {
            first.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            first.end();
          });
          first.on('data', (chunk: Object): void => {
            second.write(chunk.toString(), 'utf8');
          });
          first.on('end', (): void => {
            second.end();
          });
          second.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
          });
          second.on('end', (): void => {
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedText).assertEqual('D:T2:T1:xD:T2:T1:y');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedFirstTransformCount).assertEqual(2);
        expect(capturedSecondTransformCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_0600
     * @tc.name testStreamExplicitFullStackFlow006
     * @tc.desc Verify an empty Readable still completes Transform doFlush and delivers the flush record to Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedTransformCount: int = 0;
        let capturedDuplexWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ExplicitFullStackReadable([]);
          let transform = new ExplicitFullStackTransform('T:', '<empty-flush>');
          let duplex = new ExplicitFullStackDuplex('D:');
          let sink = new ExplicitFullStackWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedTransformCount = transform.transformCount;
            capturedDuplexWriteCount = duplex.writeCount;
            resolve(undefined as void);
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedText).assertEqual('D:<empty-flush>');
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedTransformCount).assertEqual(0);
        expect(capturedDuplexWriteCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_0700
     * @tc.name testStreamExplicitFullStackFlow007
     * @tc.desc Verify one explicit stream result can be consumed by two Writable branches without data loss or divergence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAText: string = '';
        let capturedAWriteCount: int = 0;
        let capturedBText: string = '';
        let capturedBWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ExplicitFullStackReadable(['left', 'right']);
          let transform = new ExplicitFullStackTransform('T:');
          let duplex = new ExplicitFullStackDuplex('D:');
          let sinkA = new ExplicitFullStackWritable();
          let sinkB = new ExplicitFullStackWritable();
          let finishedA: boolean = false;
          let finishedB: boolean = false;
          let resolved: boolean = false;
          sinkA.on('finish', (): void => {
            finishedA = true;
            capturedAText = sinkA.text;
            capturedAWriteCount = sinkA.writeCount;
            capturedBText = sinkB.text;
            capturedBWriteCount = sinkB.writeCount;
            if (finishedB && !resolved) {
              resolved = true;
              resolve(undefined as void);
            }
          });
          sinkB.on('finish', (): void => {
            finishedB = true;
            capturedAText = sinkA.text;
            capturedAWriteCount = sinkA.writeCount;
            capturedBText = sinkB.text;
            capturedBWriteCount = sinkB.writeCount;
            if (finishedA && !resolved) {
              resolved = true;
              resolve(undefined as void);
            }
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sinkA.write(chunk.toString(), 'utf8');
            sinkB.write(chunk.toString(), 'utf8');
          });
          duplex.on('end', (): void => {
            sinkA.end();
            sinkB.end();
          });
          source.resume();
        });
        expect(capturedAText).assertEqual('D:T:leftD:T:right');
        expect(capturedBText).assertEqual('D:T:leftD:T:right');
        expect(capturedAWriteCount).assertEqual(2);
        expect(capturedBWriteCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_0800
     * @tc.name testStreamExplicitFullStackFlow008
     * @tc.desc Verify an explicit Duplex control record inserted between Transform data records keeps the intended order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedDataCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ExplicitFullStackReadable(['first', 'second']);
          let transform = new ExplicitFullStackTransform('T:');
          let duplex = new ExplicitFullStackDuplex('D:');
          let sink = new ExplicitFullStackWritable();
          let dataCount: int = 0;
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedDataCount = dataCount;
            resolve(undefined as void);
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
            dataCount++;
            if (dataCount === 1) {
              duplex.write('control', 'utf8');
            }
          });
          transform.on('end', (): void => {
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedText).assertEqual('D:T:firstD:controlD:T:second');
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedDataCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_0900
     * @tc.name testStreamExplicitFullStackFlow009
     * @tc.desc Verify Writable cork buffers a complete Duplex output batch and uncork releases it in original order before finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedCorkedAtEnd: int = 0;
        let capturedCorkedAtFinish: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ExplicitFullStackReadable(['one', 'two', 'three']);
          let transform = new ExplicitFullStackTransform('T:');
          let duplex = new ExplicitFullStackDuplex('D:');
          let sink = new ExplicitFullStackWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedCorkedAtFinish = sink.writableCorked;
            resolve(undefined as void);
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('end', (): void => {
            capturedCorkedAtEnd = sink.writableCorked;
            sink.uncork();
            sink.end();
          });
          sink.cork();
          source.resume();
        });
        expect(capturedText).assertEqual('D:T:oneD:T:twoD:T:three');
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedCorkedAtEnd).assertEqual(1);
        expect(capturedCorkedAtFinish).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_1000
     * @tc.name testStreamExplicitFullStackFlow010
     * @tc.desc Verify one Transform input may produce multiple ordered records consumed by Duplex and Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedTransformCount: int = 0;
        let capturedDuplexWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ExplicitFullStackReadable(['a', 'b']);
          let transform = new ExplicitFanoutTransform();
          let duplex = new ExplicitFullStackDuplex('D:');
          let sink = new ExplicitFullStackWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedTransformCount = transform.transformCount;
            capturedDuplexWriteCount = duplex.writeCount;
            resolve(undefined as void);
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedText).assertEqual('D:L:aD:R:aD:L:bD:R:b');
        expect(capturedWriteCount).assertEqual(4);
        expect(capturedTransformCount).assertEqual(2);
        expect(capturedDuplexWriteCount).assertEqual(4);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_1100
     * @tc.name testStreamExplicitFullStackFlow011
     * @tc.desc Verify a Transform can discard normal input while doFlush emits the only terminal record in the complete flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedTransformCount: int = 0;
        let capturedDuplexWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ExplicitFullStackReadable(['discard-me']);
          let transform = new ExplicitFlushOnlyTransform();
          let duplex = new ExplicitFullStackDuplex('D:');
          let sink = new ExplicitFullStackWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedTransformCount = transform.transformCount;
            capturedDuplexWriteCount = duplex.writeCount;
            resolve(undefined as void);
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedText).assertEqual('D:<flush-only>');
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedTransformCount).assertEqual(1);
        expect(capturedDuplexWriteCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_1200
     * @tc.name testStreamExplicitFullStackFlow012
     * @tc.desc Verify writing to the final Writable after the complete stream has finished follows the documented negative path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedErrorName: string = '';
        let capturedSinkText: string = '';
        let capturedWriteCount: int = 0;
        let capturedFinished: boolean = false;
        let capturedLateWriteResult: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ExplicitFullStackReadable(['valid']);
          let transform = new ExplicitFullStackTransform('T:');
          let duplex = new ExplicitFullStackDuplex('D:');
          let sink = new ExplicitFullStackWritable();
          let settled: boolean = false;
          let complete = (): void => {
            if (!settled) {
              settled = true;
              resolve(undefined as void);
            }
          };
          sink.on('error', (err: Error): void => {
            capturedErrorName = err.name;
            capturedSinkText = sink.text;
            capturedWriteCount = sink.writeCount;
            complete();
          });
          sink.on('finish', (): void => {
            capturedFinished = sink.writableFinished;
            let result: boolean = sink.write('late', 'utf8');
            capturedLateWriteResult = result;
            setTimeout((): void => {
              complete();
            }, 0);
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedErrorName).assertEqual('BusinessError');
        expect(capturedSinkText).assertEqual('D:T:valid');
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedFinished).assertTrue();
        expect(capturedLateWriteResult).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_1300
     * @tc.name testStreamExplicitFullStackFlow013
     * @tc.desc Verify two explicit Readable Transform Duplex Writable flows can run concurrently with isolated state and output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAText: string = '';
        let capturedAWriteCount: int = 0;
        let capturedBText: string = '';
        let capturedBWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sourceA = new ExplicitFullStackReadable(['A1', 'A2']);
          let transformA = new ExplicitFullStackTransform('TA:');
          let duplexA = new ExplicitFullStackDuplex('DA:');
          let sinkA = new ExplicitFullStackWritable();
          let sourceB = new ExplicitFullStackReadable(['B1', 'B2', 'B3']);
          let transformB = new ExplicitFullStackTransform('TB:');
          let duplexB = new ExplicitFullStackDuplex('DB:');
          let sinkB = new ExplicitFullStackWritable();
          let finished: int = 0;
          sinkA.on('finish', (): void => {
            capturedAText = sinkA.text;
            capturedAWriteCount = sinkA.writeCount;
            finished++;
            if (finished === 2) {
              resolve(undefined as void);
            }
          });
          sinkB.on('finish', (): void => {
            capturedBText = sinkB.text;
            capturedBWriteCount = sinkB.writeCount;
            finished++;
            if (finished === 2) {
              resolve(undefined as void);
            }
          });
          duplexA.on('finish', (): void => {
            duplexA.push(null);
          });
          duplexB.on('finish', (): void => {
            duplexB.push(null);
          });
          sourceA.on('data', (chunk: Object): void => {
            transformA.write(chunk.toString(), 'utf8');
          });
          sourceA.on('end', (): void => {
            transformA.end();
          });
          transformA.on('data', (chunk: Object): void => {
            duplexA.write(chunk.toString(), 'utf8');
          });
          transformA.on('end', (): void => {
            duplexA.end();
          });
          duplexA.on('data', (chunk: Object): void => {
            sinkA.write(chunk.toString(), 'utf8');
          });
          duplexA.on('end', (): void => {
            sinkA.end();
          });
          sourceB.on('data', (chunk: Object): void => {
            transformB.write(chunk.toString(), 'utf8');
          });
          sourceB.on('end', (): void => {
            transformB.end();
          });
          transformB.on('data', (chunk: Object): void => {
            duplexB.write(chunk.toString(), 'utf8');
          });
          transformB.on('end', (): void => {
            duplexB.end();
          });
          duplexB.on('data', (chunk: Object): void => {
            sinkB.write(chunk.toString(), 'utf8');
          });
          duplexB.on('end', (): void => {
            sinkB.end();
          });
          sourceA.resume();
          sourceB.resume();
        });
        expect(capturedAText).assertEqual('DA:TA:A1DA:TA:A2');
        expect(capturedAWriteCount).assertEqual(2);
        expect(capturedBText).assertEqual('DB:TB:B1DB:TB:B2DB:TB:B3');
        expect(capturedBWriteCount).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_1400
     * @tc.name testStreamExplicitFullStackFlow014
     * @tc.desc Verify backpressure propagation: slow Writable causes write to return false, drain event restores flow, all data arrives intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let w = new SlowConsumeWritable(20);
        let backpressureTriggered: boolean = false;
        let drainFired: boolean = false;
        let totalChunks: int = 10;
        let sentChunks: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('drain', (): void => {
            drainFired = true;
            while (sentChunks < totalChunks) {
              sentChunks++;
              let ret: boolean = w.write('chunk-' + sentChunks);
              if (!ret) {
                backpressureTriggered = true;
                return;
              }
            }
            w.end();
          });
          w.on('finish', (): void => {
            resolve(undefined as void);
          });
          for (let i: int = 0; i < 5; i++) {
            sentChunks++;
            let ret: boolean = w.write('chunk-' + sentChunks + '-'.repeat(6000));
            if (!ret) {
              backpressureTriggered = true;
            }
          }
        });
        expect(backpressureTriggered).assertTrue();
        expect(drainFired).assertTrue();
        expect(w.writeCount).assertEqual(totalChunks);
        expect(w.received[0].substring(0, 6)).assertEqual('chunk-');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_1500
     * @tc.name testStreamExplicitFullStackFlow015
     * @tc.desc Verify backpressure in multi-Transform chain: slow downstream Transform buffers accumulate, upstream pauses, drain restores all nodes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new CountingReadable(['a'.repeat(8000), 'b'.repeat(8000), 'c'.repeat(8000)]);
        let t1 = new IdentityTransform();
        let t2 = new IdentityTransform();
        let w = new SlowConsumeWritable(30);
        let t1BufferPeak: int = 0;
        let t2BufferPeak: int = 0;
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            resolve(undefined as void);
          });
          connectStreams(r, t1);
          t1.on('data', (chunk: Object): void => {
            if (t1.writableLength > t1BufferPeak) {
              t1BufferPeak = t1.writableLength;
            }
            t2.write(chunk.toString(), 'utf8');
          });
          t1.on('end', (): void => {
            t2.end();
          });
          t2.on('data', (chunk: Object): void => {
            if (t2.writableLength > t2BufferPeak) {
              t2BufferPeak = t2.writableLength;
            }
            w.write(chunk.toString(), 'utf8');
          });
          t2.on('end', (): void => {
            w.end();
          });
          t1.resume();
          t2.resume();
        });
        expect(capturedWriteCount).assertEqual(3);
        expect(w.collected.length).assertEqual(24000);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_1600
     * @tc.name testStreamExplicitFullStackFlow016
     * @tc.desc Verify data written during backpressure is buffered without loss and all chunks arrive after drain recovery in original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let w = new SlowConsumeWritable(15);
        let chunks: string[] = ['first', 'second', 'third', 'fourth', 'fifth'];
        let bufferedDuringBackpressure: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            resolve(undefined as void);
          });
          for (let i: int = 0; i < chunks.length; i++) {
            let ret: boolean = w.write(chunks[i] + '-'.repeat(4000));
            if (!ret) {
              bufferedDuringBackpressure++;
            }
          }
          w.end();
        });
        expect(w.writeCount).assertEqual(5);
        expect(w.received[0].substring(0, 5)).assertEqual('first');
        expect(w.received[1].substring(0, 6)).assertEqual('second');
        expect(w.received[2].substring(0, 5)).assertEqual('third');
        expect(w.received[3].substring(0, 6)).assertEqual('fourth');
        expect(w.received[4].substring(0, 5)).assertEqual('fifth');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_1700
     * @tc.name testStreamExplicitFullStackFlow017
     * @tc.desc Verify error cascade: upstream Readable emits error after delivering some chunks, error reaches Transform and Writable listeners, prior data preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ErrorEmitReadable(['ok-1', 'ok-2'], 2, 'upstream failure');
        let t = new IdentityTransform();
        let w = new CollectWritable();
        let sourceError: string = '';
        let transformError: string = '';
        let settled: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let complete = (): void => {
            if (!settled) {
              settled = true;
              resolve(undefined as void);
            }
          };
          r.on('error', (err: Error): void => {
            sourceError = err.message;
            complete();
          });
          t.on('error', (err: Error): void => {
            transformError = err.message;
          });
          connectStreams(r, t);
          t.pipe(w);
          setTimeout(complete, 3000);
        });
        expect(sourceError).assertEqual('upstream failure');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_1800
     * @tc.name testStreamExplicitFullStackFlow018
     * @tc.desc Verify error cascade: middle Transform callback(error) on a specific chunk, accepted chunks before error are preserved, error message propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new CountingReadable(['good-1', 'bad-chunk', 'good-2']);
        let t = new ErrorOnChunkTransform('bad-chunk', 'middle transform failed');
        let w = new CollectWritable();
        let capturedError: string = '';
        let capturedAcceptedCount: int = 0;
        let settled: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let complete = (): void => {
            if (!settled) {
              settled = true;
              capturedAcceptedCount = t.acceptedChunks.length;
              resolve(undefined as void);
            }
          };
          t.on('error', (err: Error): void => {
            capturedError = err.message;
            complete();
          });
          connectStreams(r, t);
          t.pipe(w);
          setTimeout(complete, 3000);
        });
        expect(capturedError).assertEqual('middle transform failed');
        expect(capturedAcceptedCount).assertEqual(1);
        expect(t.acceptedChunks[0]).assertEqual('good-1');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_1900
     * @tc.name testStreamExplicitFullStackFlow019
     * @tc.desc Verify error cascade: downstream Writable doWrite callback(error) triggers error event, upstream Transform and Readable receive error notification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new CountingReadable(['data-1', 'data-2']);
        let t = new IdentityTransform();
        let w = new FailFirstWritable();
        let writableError: string = '';
        let transformError: string = '';
        let settled: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let complete = (): void => {
            if (!settled) {
              settled = true;
              resolve(undefined as void);
            }
          };
          w.on('error', (err: Error): void => {
            writableError = err.message;
            complete();
          });
          t.on('error', (err: Error): void => {
            transformError = err.message;
          });
          connectStreams(r, t);
          t.pipe(w);
          setTimeout(complete, 3000);
        });
        expect(writableError).assertEqual('downstream consumer crashed');
        expect(w.writeCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_2000
     * @tc.name testStreamExplicitFullStackFlow020
     * @tc.desc Verify pipeline interruption: unpipe mid-flow stops data flow to original target, target retains already-received data, source continues independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new CountingReadable(['alpha', 'beta', 'gamma', 'delta']);
        let w1 = new CollectWritable();
        let w2 = new CollectWritable();
        let unpiped: boolean = false;
        let capturedW1Count: int = 0;
        let capturedW2Count: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w2.on('finish', (): void => {
            capturedW1Count = w1.writeCount;
            capturedW2Count = w2.writeCount;
            resolve(undefined as void);
          });
          r.on('data', (chunk: Object): void => {
            let text: string = chunk.toString();
            if (!unpiped) {
              w1.write(text, 'utf8');
              if (w1.writeCount >= 2) {
                unpiped = true;
                r.unpipe(w1);
              }
            } else {
              w2.write(text, 'utf8');
            }
          });
          r.on('end', (): void => {
            w1.end();
            w2.end();
          });
          r.resume();
        });
        expect(capturedW1Count).assertEqual(2);
        expect(w1.received[0]).assertEqual('alpha');
        expect(w1.received[1]).assertEqual('beta');
        expect(capturedW2Count).assertEqual(2);
        expect(w2.received[0]).assertEqual('gamma');
        expect(w2.received[1]).assertEqual('delta');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_2100
     * @tc.name testStreamExplicitFullStackFlow021
     * @tc.desc Verify after unpipe both source and target operate independently: source can push new data, target can accept writes from another source without interference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r1 = new CountingReadable(['from-r1-a', 'from-r1-b']);
        let r2 = new CountingReadable(['from-r2-x', 'from-r2-y']);
        let w = new CollectWritable();
        let capturedWriteCount: int = 0;
        let capturedCollected: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedCollected = w.collected;
            resolve(undefined as void);
          });
          r1.on('data', (chunk: Object): void => {
            w.write(chunk.toString(), 'utf8');
          });
          r1.on('end', (): void => {
            r1.unpipe(w);
            connectStreams(r2, w);
          });
          r1.resume();
        });
        expect(capturedWriteCount).assertEqual(4);
        expect(w.received[0]).assertEqual('from-r1-a');
        expect(w.received[1]).assertEqual('from-r1-b');
        expect(w.received[2]).assertEqual('from-r2-x');
        expect(w.received[3]).assertEqual('from-r2-y');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_2200
     * @tc.name testStreamExplicitFullStackFlow022
     * @tc.desc Verify five-Transform chain (identity -> uppercase -> prefix -> filter -> aggregate) produces correct final output with ordered transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new CountingReadable(['hello', 'skip-this', 'world']);
        let t1 = new IdentityTransform();
        let t2 = new UppercaseTransform();
        let t3 = new PrefixTransform('T');
        let t4 = new FilterTransform('T2:');
        let t5 = new AggregateFlushTransform('|');
        let w = new CollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectStreams(r, t1);
          connectStreams(t1, t2);
          connectStreams(t2, t3);
          connectStreams(t3, t4);
          connectStreams(t4, t5);
          t5.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('T1:HELLO|T3:WORLD');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_2300
     * @tc.name testStreamExplicitFullStackFlow023
     * @tc.desc Verify FilterTransform in a chain drops matching chunks, downstream receives only non-filtered data with correct count and order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new CountingReadable(['keep-1', 'drop-1', 'keep-2', 'drop-2', 'keep-3']);
        let filter = new FilterTransform('drop-');
        let upper = new UppercaseTransform();
        let w = new CollectWritable();
        let capturedWriteCount: int = 0;
        let capturedCollected: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedCollected = w.collected;
            resolve(undefined as void);
          });
          connectStreams(r, filter);
          connectStreams(filter, upper);
          upper.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(3);
        expect(w.received[0]).assertEqual('KEEP-1');
        expect(w.received[1]).assertEqual('KEEP-2');
        expect(w.received[2]).assertEqual('KEEP-3');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_2400
     * @tc.name testStreamExplicitFullStackFlow024
     * @tc.desc Verify Duplex bidirectional simultaneous data flow: write-side data and external read-side push deliver through independent channels without mixing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new BidirectionalDuplex();
        let wOutput = new CollectWritable();
        let rOutput = new CollectWritable();
        let capturedWriteSideCount: int = 0;
        let capturedReadSideCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let finished: int = 0;
          let checkComplete = (): void => {
            finished++;
            if (finished === 2) {
              capturedWriteSideCount = wOutput.writeCount;
              capturedReadSideCount = rOutput.writeCount;
              resolve(undefined as void);
            }
          };
          wOutput.on('finish', checkComplete);
          rOutput.on('finish', checkComplete);
          let seen: int = 0;
          d.on('data', (chunk: Object): void => {
            let text: string = chunk.toString();
            if (text.startsWith('w2r:')) {
              wOutput.write(text.substring(4), 'utf8');
            } else if (text.startsWith('r2r:')) {
              rOutput.write(text.substring(4), 'utf8');
            }
            seen++;
            if (seen === 4) {
              wOutput.end();
              rOutput.end();
            }
          });
          d.resume();
          setTimeout((): void => {
            d.pushExternal('external-data-1');
            d.pushExternal('external-data-2');
            d.write('write-data-1', 'utf8');
            d.write('write-data-2', 'utf8');
            d.end();
          }, 0);
        });
        expect(capturedWriteSideCount).assertEqual(2);
        expect(wOutput.received[0]).assertEqual('write-data-1');
        expect(wOutput.received[1]).assertEqual('write-data-2');
        expect(capturedReadSideCount).assertEqual(2);
        expect(rOutput.received[0]).assertEqual('external-data-1');
        expect(rOutput.received[1]).assertEqual('external-data-2');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_EXPLICIT_PIPELINE_FLOW_2500
     * @tc.name testStreamExplicitFullStackFlow025
     * @tc.desc Verify Duplex as bidirectional pipe node: two independent Readable sources feed write and read sides, two Writable sinks receive separated output without cross-contamination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamExplicitFullStackFlow025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let writeSource = new CountingReadable(['w-alpha', 'w-beta']);
        let readSource = new CountingReadable(['r-alpha', 'r-beta']);
        let d = new RelayDuplex();
        let writeSink = new CollectWritable();
        let readSink = new CollectWritable();
        let capturedWriteSinkCount: int = 0;
        let capturedReadSinkCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let finished: int = 0;
          let checkComplete = (): void => {
            finished++;
            if (finished === 2) {
              capturedWriteSinkCount = writeSink.writeCount;
              capturedReadSinkCount = readSink.writeCount;
              resolve(undefined as void);
            }
          };
          writeSink.on('finish', checkComplete);
          readSink.on('finish', checkComplete);
          d.on('data', (chunk: Object): void => {
            let text: string = chunk.toString();
            if (text.startsWith('W:')) {
              writeSink.write(text.substring(2), 'utf8');
            } else if (text.startsWith('R:')) {
              readSink.write(text.substring(2), 'utf8');
            }
          });
          d.on('end', (): void => {
            writeSink.end();
            readSink.end();
          });
          d.resume();
          connectStreams(writeSource, d);
          readSource.on('data', (chunk: Object): void => {
            d.push('R:' + chunk.toString());
          });
          readSource.on('end', (): void => {
            setTimeout((): void => {
              d.push(null);
            }, 100);
          });
          readSource.resume();
        });
        expect(capturedWriteSinkCount).assertEqual(2);
        expect(writeSink.received[0]).assertEqual('w-alpha');
        expect(writeSink.received[1]).assertEqual('w-beta');
        expect(d.writeReceived.length).assertEqual(2);
        done();
      });
  });
}
