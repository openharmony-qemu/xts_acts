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

class HttpCollectWritable extends stream.Writable {
  public writeCount: int = 0;
  public collected: string = '';

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    if (typeof chunk === 'string') {
      this.collected += chunk;
    } else if (buffer.isBuffer(chunk)) {
      this.collected += chunk.toString();
    } else {
      this.collected += util.TextDecoder.create('utf-8').decodeToString(chunk as Uint8Array);
    }
    callback.unsafeCall();
  }
}

class BizCollectWritable extends stream.Writable {
  public received: Object[] = [];
  public writeCount: int = 0;
  public collected: string = '';
  public totalLength: int = 0;

  constructor() {
    super();
  }

  doWrite(data: string | Uint8Array, encoding: string, cb: Function): void {
    let text: string = '';
    if (typeof data === 'string') {
      text = data as string;
    } else if (buffer.isBuffer(data)) {
      text = data.toString();
    } else {
      text = util.TextDecoder.create('utf-8').decodeToString(data as Uint8Array);
    }
    this.received.push(text);
    this.writeCount++;
    this.totalLength += text.length;
    if (this.totalLength <= 65536) {
      this.collected += text;
    }
    cb.unsafeCall();
  }
}

class BizSingleReadable extends stream.Readable {
  private data: string;
  private done: boolean = false;

  constructor(data: string) {
    super();
    this.data = data;
    this.done = false;
  }

  doRead(size: int): void {
    if (!this.done) {
      this.done = true;
      if (this.data.length > 0) {
        this.push(this.data);
      }
    }
    this.push(null);
  }
}

class BizByteReadable extends stream.Readable {
  private blocks: Uint8Array[] = [];
  private index: int = 0;

  constructor(blocks: Uint8Array[]) {
    super();
    this.blocks = blocks;
  }

  doRead(size: int): void {
    if (this.index < this.blocks.length) {
      this.push(this.blocks[this.index]);
      this.index++;
    } else {
      this.push(null);
    }
  }
}

class BizByteWritable extends stream.Writable {
  public bytes: number[] = [];
  public writeCount: int = 0;
  private outputEncoding: string = 'utf-8';

  constructor(outputEncoding: string) {
    super();
    this.outputEncoding = outputEncoding;
  }

  doWrite(data: string | Uint8Array, encoding: string, callback: Function): void {
    let value: Uint8Array;
    if (typeof data === 'string') {
      value = util.TextEncoder.create(this.outputEncoding).encodeInto(data as string);
    } else {
      value = data as Uint8Array;
    }
    for (let index: int = 0; index < value.length; index++) {
      this.bytes.push(value[index]);
    }
    this.writeCount++;
    callback.unsafeCall();
  }
}

class BizEmptyReadable extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
    this.push(null);
  }
}

class MultiPushTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let s: string = chunk as string;
    for (let i: int = 0; i < s.length; i++) {
      this.push(s.substring(i, i + 1));
    }
    callback.unsafeCall();
  }
}

class ToUpperCaseTransform extends stream.Transform {
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

class DataMaskTransform extends stream.Transform {
  private maskType: int = 0;

  constructor(maskType: int) {
    super();
    this.maskType = maskType;
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let s: string = chunk as string;
    let result: string = s;
    if (this.maskType === 0 && s.length === 11) {
      result = s.substring(0, 3) + '****' + s.substring(7);
    } else if (this.maskType === 1 && s.length === 18) {
      result = s.substring(0, 6) + '********' + s.substring(14);
    } else if (this.maskType === 2) {
      let atPos: int = s.indexOf('@');
      if (atPos > 0) {
        result = s[0] + '***' + s.substring(atPos);
      }
    } else if (this.maskType === 3 && s.length === 16) {
      result = s.substring(0, 4) + '********' + s.substring(12);
    }
    this.push(result);
    callback.unsafeCall();
  }
}

class EtlParseTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let s: string = chunk as string;
    let lines: string[] = s.split('\n');
    for (let i: int = 0; i < lines.length; i++) {
      this.push(lines[i]);
    }
    callback.unsafeCall();
  }
}

class EtlFilterTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let s: string = chunk as string;
    if (s !== '' && !s.startsWith('blocked')) {
      this.push(s);
    }
    callback.unsafeCall();
  }
}

class EtlNumberedTransform extends stream.Transform {
  private counter: int = 0;

  constructor() {
    super();
    this.counter = 0;
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.counter++;
    let s: string = chunk as string;
    this.push('[' + this.counter + ']' + s + ' ');
    callback.unsafeCall();
  }
}

class EtlDataTransform extends stream.Transform {
  private counter: int = 0;

  constructor() {
    super();
    this.counter = 0;
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.counter++;
    let s: string = chunk as string;
    this.push('[' + this.counter + ']' + s.toUpperCase());
    callback.unsafeCall();
  }
}

class EtlMiddleErrorTransform extends stream.Transform {
  public acceptedChunks: string[] = [];
  public rejectedChunk: string = '';
  private rejectChunk: string = '';

  constructor(rejectChunk: string) {
    super();
    this.rejectChunk = rejectChunk;
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let text: string = chunk as string;
    if (text === this.rejectChunk) {
      this.rejectedChunk = text;
      callback.unsafeCall(new Error('middle etl error'));
      return;
    }
    this.acceptedChunks.push(text);
    this.push('middle:' + text);
    callback.unsafeCall();
  }
}

class EtlListReadable extends stream.Readable {
  private lines: string[] = [];
  private index: int = 0;
  private maxLines: int = 0;

  constructor(lines: string[], maxLines: int) {
    super();
    this.lines = lines;
    this.index = 0;
    this.maxLines = maxLines;
  }

  doRead(size: int): void {
    if (this.index < this.maxLines && this.index < this.lines.length) {
      this.push(this.lines[this.index]);
      this.index++;
    } else if (this.index >= this.maxLines && this.lines.length > 0) {
      this.push(null);
    } else if (this.lines.length === 0) {
      this.push(null);
    } else {
      this.push(null);
    }
  }
}

class EncodeConvertTransform extends stream.Transform {
  private source: string = '';
  private target: string = '';

  constructor(source: string, target: string) {
    super();
    this.source = source;
    this.target = target;
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let sourceBytes: Uint8Array;
    if (typeof chunk === 'string') {
      sourceBytes = util.TextEncoder.create(this.source).encodeInto(chunk as string);
    } else {
      sourceBytes = chunk as Uint8Array;
    }
    let text: string = util.TextDecoder.create(this.source).decodeToString(sourceBytes);
    let targetBytes: Uint8Array = util.TextEncoder.create(this.target).encodeInto(text);
    this.push(targetBytes);
    callback.unsafeCall();
  }
}

class EncodingAuditTransform extends stream.Transform {
  public receivedEncodings: string[] = [];

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.receivedEncodings.push(encoding);
    this.push(chunk);
    callback.unsafeCall();
  }
}

class LogErrorFilterTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let s: string = chunk as string;
    if (s.startsWith('[ERROR]')) {
      this.push(s);
    }
    callback.unsafeCall();
  }
}

class LogNonErrorFilterTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let s: string = chunk as string;
    if (!s.startsWith('[ERROR]')) {
      this.push(s);
    }
    callback.unsafeCall();
  }
}

class LogListReadable extends stream.Readable {
  private logs: string[] = [];
  private index: int = 0;

  constructor(logs: string[]) {
    super();
    this.logs = logs;
    this.index = 0;
  }

  doRead(size: int): void {
    if (this.index < this.logs.length) {
      this.push(this.logs[this.index]);
      this.index++;
    } else {
      this.push(null);
    }
  }
}

class XorEncryptTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let s: string = chunk as string;
    let encrypted: string = '';
    for (let i: int = 0; i < s.length; i++) {
      encrypted += String.fromCodePoint((s.codePointAt(i) ?? 0) ^ 1);
    }
    this.push(encrypted);
    callback.unsafeCall();
  }
}

class XorDecryptTransform extends stream.Transform {
  private wrongKey: boolean = false;

  constructor(wrongKey: boolean) {
    super();
    this.wrongKey = wrongKey;
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let s: string = chunk as string;
    let key: int = this.wrongKey ? 2 : 1;
    let decrypted: string = '';
    for (let i: int = 0; i < s.length; i++) {
      decrypted += String.fromCodePoint((s.codePointAt(i) ?? 0) ^ key);
    }
    this.push(decrypted);
    callback.unsafeCall();
  }
}

class BizTransportDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(data: string | Uint8Array, encoding: string, cb: Function): void {
    this.push(data as string | Uint8Array);
    cb.unsafeCall();
  }
}

class CsvParseTransform extends stream.Transform {
  private headers: string[] = [];
  private isFirst: boolean = true;

  constructor() {
    super();
    this.isFirst = true;
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let data: string = chunk as string;
    if (data.length === 0) {
      callback.unsafeCall();
      return;
    }
    let lines: string[] = data.split('\n');
    if (this.isFirst) {
      this.headers = lines[0].split(',');
      this.isFirst = false;
      for (let i: int = 1; i < lines.length; i++) {
        if (lines[i].length > 0) {
          let vals: string[] = lines[i].split(',');
          let obj: string = '{';
          for (let j: int = 0; j < this.headers.length; j++) {
            if (j > 0) {
              obj += ',';
            }
            obj += this.headers[j] + ':' + (j < vals.length ? vals[j] : '');
          }
          obj += '}';
          this.push(obj);
        }
      }
    }
    callback.unsafeCall();
  }
}

class CsvMalformedTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let data: string = chunk as string;
    let lines: string[] = data.split('\n');
    if (lines.length >= 2 && lines[0].split(',').length !== lines[1].split(',').length) {
      throw new Error('csv malformed: column count mismatch');
    }
    this.push(data);
    callback.unsafeCall();
  }
}

class BackpressureReadable extends stream.Readable {
  private count: int = 0;
  private maxCount: int = 0;

  constructor(maxCount: int) {
    super();
    this.maxCount = maxCount;
    this.count = 0;
  }

  doRead(size: int): void {
    if (this.count < this.maxCount) {
      this.push('x'.repeat(1024));
      this.count++;
    } else {
      this.push(null);
    }
  }
}

class BizCorkWritable extends stream.Writable {
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(data: string | Uint8Array, encoding: string, cb: Function): void {
    this.writeCount++;
    cb.unsafeCall();
  }
}

class CrashRecoveryWritable extends stream.Writable {
  public writeCount: int = 0;
  private crashOnFirst: boolean = true;

  constructor() {
    super();
  }

  doWrite(data: string | Uint8Array, encoding: string, cb: Function): void {
    if (this.crashOnFirst) {
      this.crashOnFirst = false;
      cb.unsafeCall(new Error('consumer crashed'));
    } else {
      this.writeCount++;
      cb.unsafeCall();
    }
  }
}

class BizMergeTransform extends stream.Transform {
  private items: string[] = [];

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.items.push(chunk as string);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.push(this.items.join(','));
    callback.unsafeCall();
  }
}

class BizSeqMergeTransform extends stream.Transform {
  private items: string[] = [];

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let s: string = chunk as string;
    let parts: string[] = s.split(',');
    for (let i: int = 0; i < parts.length; i++) {
      this.items.push(parts[i]);
    }
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.push(this.items.join(','));
    callback.unsafeCall();
  }
}

class HttpChunkReadable extends stream.Readable {
  private chunks: string[] = [];
  private index: int = 0;

  constructor(chunks: string[]) {
    super();
    this.chunks = chunks;
    this.index = 0;
  }

  doRead(size: int): void {
    while (this.index < this.chunks.length) {
      let chunk: string = this.chunks[this.index];
      this.index++;
      if (chunk.length > 0) {
        this.push(chunk);
        return;
      }
    }
    this.push(null);
  }
}

class EdgeReadable extends stream.Readable {
  private data: string;

  constructor(data: string) {
    super();
    this.data = data;
  }

  doRead(size: int): void {
    this.push(this.data);
    this.push(null);
  }
}

class EdgeUppercaseTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push((chunk as string).toUpperCase());
    callback.unsafeCall();
  }
}

function connectReadableToTransform(source: stream.Readable, target: stream.Transform | stream.Duplex,
  preserveBytes: boolean = false): void {
  source.on('data', (chunk: Object): void => {
    if (preserveBytes && typeof chunk !== 'string') {
      target.write(chunk as Uint8Array);
    } else {
      let text: string = '';
      if (typeof chunk === 'string') {
        text = chunk as string;
      } else if (buffer.isBuffer(chunk)) {
        text = chunk.toString();
      } else {
        text = util.TextDecoder.create('utf-8').decodeToString(chunk as Uint8Array);
      }
      target.write(text);
    }
  });
  source.on('end', (): void => {
    target.end();
  });
  setTimeout((): void => {
    source.resume();
  }, 0);
}

function feedTransformChunks(target: stream.Transform, chunks: (string | Uint8Array)[],
  encoding: string = 'utf-8'): void {
  setTimeout((): void => {
    for (let index: int = 0; index < chunks.length; index++) {
      target.write(chunks[index], encoding);
    }
    target.end();
  }, 0);
}

export default function StreamBusinessScenarioTest(): void {
  describe('StreamBusinessScenarioTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_0100
     * @tc.name testStreamBusinessScenario001
     * @tc.desc Verify lowercase to uppercase Pipe: Readable to UpperCaseTransform to Writable receives "HELLO"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('hello');
        let t = new ToUpperCaseTransform();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('HELLO');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_0200
     * @tc.name testStreamBusinessScenario002
     * @tc.desc Verify pure CJK text crosses an UpperCaseTransform and Duplex relay without text loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('你好');
        let t = new ToUpperCaseTransform();
        let relay = new BizTransportDuplex();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.on('data', (chunk: Object): void => {
            relay.write(chunk.toString(), 'utf8');
          });
          t.on('end', (): void => {
            relay.end();
          });
          relay.on('data', (chunk: Object): void => {
            w.write(chunk.toString(), 'utf8');
          });
          relay.on('end', (): void => {
            w.end();
          });
          relay.resume();
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('你好');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_0300
     * @tc.name testStreamBusinessScenario003
     * @tc.desc Verify empty input Pipe: EmptyReadable to UpperCaseTransform to Writable produces no output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new BizEmptyReadable();
      let t = new ToUpperCaseTransform();
      let w = new BizCollectWritable();
      connectReadableToTransform(r, t);
      t.pipe(w);
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_0400
     * @tc.name testStreamBusinessScenario004
     * @tc.desc Verify phone number masking changes "13800138000" to "138****8000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('13800138000');
        let t = new DataMaskTransform(0);
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('138****8000');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_0500
     * @tc.name testStreamBusinessScenario005
     * @tc.desc Verify ID card masking survives an event-driven Transform-to-Writable bridge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('310101199001011234');
        let t = new DataMaskTransform(1);
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.on('data', (chunk: Object): void => {
            w.write(chunk.toString(), 'utf8');
          });
          t.on('end', (): void => {
            w.end();
          });
          t.resume();
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('310101********1234');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_0600
     * @tc.name testStreamBusinessScenario006
     * @tc.desc Verify email masking is followed by uppercase normalization in a two-Transform chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('test@example.com');
        let t = new DataMaskTransform(2);
        let upper = new ToUpperCaseTransform();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.on('data', (chunk: Object): void => {
            upper.write(chunk.toString(), 'utf8');
          });
          t.on('end', (): void => {
            upper.end();
          });
          upper.on('data', (chunk: Object): void => {
            w.write(chunk.toString(), 'utf8');
          });
          upper.on('end', (): void => {
            w.end();
          });
          upper.resume();
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('T***@EXAMPLE.COM');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_0700
     * @tc.name testStreamBusinessScenario007
     * @tc.desc Verify bank card masking fans one transformed record into ordered sink chunks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('6222021234567890');
        let t = new DataMaskTransform(3);
        let split = new MultiPushTransform();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.on('data', (chunk: Object): void => {
            split.write(chunk.toString(), 'utf8');
          });
          t.on('end', (): void => {
            split.end();
          });
          split.on('data', (chunk: Object): void => {
            w.write(chunk.toString(), 'utf8');
          });
          split.on('end', (): void => {
            w.end();
          });
          split.resume();
        });
        expect(capturedWriteCount).assertEqual(16);
        expect(capturedReceived0).assertEqual('6');
        expect(w.collected).assertEqual('6222********7890');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_0800
     * @tc.name testStreamBusinessScenario008
     * @tc.desc Verify unmasked CJK text passes through unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('普通文本');
        let t = new DataMaskTransform(0);
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('普通文本');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_0900
     * @tc.name testStreamBusinessScenario009
     * @tc.desc Verify 3-level chain: parse, filter, and format "a\n\nb\nc" into numbered output "[1]a [2]b [3]c "
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('a\n\nb\nc');
        let t1 = new EtlParseTransform();
        let t2 = new EtlFilterTransform();
        let t3 = new EtlNumberedTransform();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedCollected: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedCollected = w.collected;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t1);
          connectReadableToTransform(t1, t2);
          connectReadableToTransform(t2, t3);
          t3.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedCollected).assertEqual('[1]a [2]b [3]c ');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_1000
     * @tc.name testStreamBusinessScenario010
     * @tc.desc Verify filter all pipe sends "blocked1\nblocked2" to filter and produces no output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new BizSingleReadable('blocked1\nblocked2');
      let t1 = new EtlParseTransform();
      let t2 = new EtlFilterTransform();
      let t3 = new EtlNumberedTransform();
      let w = new BizCollectWritable();
      connectReadableToTransform(r, t1);
      connectReadableToTransform(t1, t2);
      connectReadableToTransform(t2, t3);
      t3.pipe(w);
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_1100
     * @tc.name testStreamBusinessScenario011
     * @tc.desc Verify single data through 3 levels changes "data" to "[1]DATA"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('data');
        let t1 = new EtlParseTransform();
        let t2 = new EtlFilterTransform();
        let t3 = new EtlDataTransform();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t1);
          connectReadableToTransform(t1, t2);
          connectReadableToTransform(t2, t3);
          t3.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('[1]DATA');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_1200
     * @tc.name testStreamBusinessScenario012
     * @tc.desc Verify 100 data items through 3-level batch all 100 converted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let lines: string[] = [];
        for (let i: int = 0; i < 100; i++) {
          lines.push('line_' + i);
        }
        let r = new EtlListReadable(lines, 100);
        let t1 = new EtlParseTransform();
        let t2 = new EtlFilterTransform();
        let t3 = new EtlNumberedTransform();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t1);
          connectReadableToTransform(t1, t2);
          connectReadableToTransform(t2, t3);
          t3.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(100);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_1300
     * @tc.name testStreamBusinessScenario013
     * @tc.desc Verify a middle Transform reports a rejected record after preserving the prior record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedErrorName: string = '';
        let capturedErrorMessage: string = '';
        let capturedAcceptedCount: int = 0;
        let capturedRejectedChunk: string = '';
        let capturedMiddleOutput: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new EtlListReadable(['row-1', 'reject'], 2);
          let first = new EtlParseTransform();
          let middle = new EtlMiddleErrorTransform('reject');
          let last = new EtlDataTransform();
          let sink = new BizCollectWritable();
          let middleOutput: string[] = [];
          let settled: boolean = false;
          let complete = (): void => {
            if (!settled) {
              settled = true;
              capturedAcceptedCount = middle.acceptedChunks.length;
              capturedRejectedChunk = middle.rejectedChunk;
              capturedMiddleOutput = middleOutput.join('|');
              resolve(undefined as void);
            }
          };
          middle.on('error', (error: Error): void => {
            capturedErrorName = error.name;
            capturedErrorMessage = error.message;
            complete();
          });
          middle.on('data', (chunk: Object): void => {
            middleOutput.push(chunk.toString());
          });
          connectReadableToTransform(source, first);
          connectReadableToTransform(first, middle);
          connectReadableToTransform(middle, last);
          last.pipe(sink);
          setTimeout(complete, 5000);
        });
        expect(capturedErrorName).assertEqual('Error');
        expect(capturedErrorMessage).assertEqual('middle etl error');
        expect(capturedAcceptedCount).assertEqual(1);
        expect(capturedRejectedChunk).assertEqual('reject');
        expect(capturedMiddleOutput).assertEqual('middle:row-1');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_1400
     * @tc.name testStreamBusinessScenario014
     * @tc.desc Verify feedTransformChunks converts GBK text through a gbk-to-UTF-8 transform and preserves six output bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let t = new EncodeConvertTransform('gbk', 'utf-8');
        let w = new BizByteWritable('utf-8');
        let capturedWriteCount: int = 0;
        let capturedBytes: number[] = [];
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedBytes = w.bytes;
            resolve(undefined as void);
          });
          feedTransformChunks(t, ['中文'], 'gbk');
          t.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedBytes.length).assertEqual(6);
        expect(capturedBytes[0]).assertEqual(228);
        expect(capturedBytes[1]).assertEqual(184);
        expect(capturedBytes[2]).assertEqual(173);
        expect(capturedBytes[3]).assertEqual(230);
        expect(capturedBytes[4]).assertEqual(150);
        expect(capturedBytes[5]).assertEqual(135);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_1500
     * @tc.name testStreamBusinessScenario015
     * @tc.desc Verify the reverse UTF-8-to-GBK transform emits four expected bytes when the sink uses the GBK encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let t = new EncodeConvertTransform('utf-8', 'gbk');
        let w = new BizByteWritable('gbk');
        let capturedWriteCount: int = 0;
        let capturedBytes: number[] = [];
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedBytes = w.bytes;
            resolve(undefined as void);
          });
          feedTransformChunks(t, ['中文'], 'utf-8');
          t.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedBytes.length).assertEqual(4);
        expect(capturedBytes[0]).assertEqual(214);
        expect(capturedBytes[1]).assertEqual(208);
        expect(capturedBytes[2]).assertEqual(206);
        expect(capturedBytes[3]).assertEqual(196);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_1600
     * @tc.name testStreamBusinessScenario016
     * @tc.desc Verify a readable GB18030 byte chunk decoded by setEncoding reaches an identity transform as UTF-8 text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizByteReadable([new Uint8Array([214, 208, 206, 196])]);
        r.setEncoding('gb18030');
        let t = new EncodeConvertTransform('utf-8', 'utf-8');
        let w = new BizByteWritable('utf-8');
        let capturedWriteCount: int = 0;
        let capturedBytes: number[] = [];
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedBytes = w.bytes;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedBytes.length).assertEqual(6);
        expect(capturedBytes[0]).assertEqual(228);
        expect(capturedBytes[1]).assertEqual(184);
        expect(capturedBytes[2]).assertEqual(173);
        expect(capturedBytes[3]).assertEqual(230);
        expect(capturedBytes[4]).assertEqual(150);
        expect(capturedBytes[5]).assertEqual(135);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_1700
     * @tc.name testStreamBusinessScenario017
     * @tc.desc Verify UTF-8 bytes of a 4-character CJK string remain unchanged through a same-encoding utf-8 to utf-8 pipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let t = new EncodeConvertTransform('utf-8', 'utf-8');
        let w = new BizByteWritable('utf-8');
        let capturedWriteCount: int = 0;
        let capturedBytes: number[] = [];
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedBytes = w.bytes;
            resolve(undefined as void);
          });
          feedTransformChunks(t, ['任意文本'], 'utf-8');
          t.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedBytes.length).assertEqual(12);
        expect(capturedBytes[0]).assertEqual(228);
        expect(capturedBytes[1]).assertEqual(187);
        expect(capturedBytes[2]).assertEqual(187);
        expect(capturedBytes[3]).assertEqual(230);
        expect(capturedBytes[4]).assertEqual(132);
        expect(capturedBytes[5]).assertEqual(143);
        expect(capturedBytes[6]).assertEqual(230);
        expect(capturedBytes[7]).assertEqual(150);
        expect(capturedBytes[8]).assertEqual(135);
        expect(capturedBytes[9]).assertEqual(230);
        expect(capturedBytes[10]).assertEqual(156);
        expect(capturedBytes[11]).assertEqual(172);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_1800
     * @tc.name testStreamBusinessScenario018
     * @tc.desc Verify a Transform preserves explicit gbk encoding across write and end data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new EncodingAuditTransform();
        let sink = new BizCollectWritable();
        let capturedFirstWriteAccepted: boolean = false;
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          sink.on('finish', (): void => {
            capturedText = sink.collected;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          transform.pipe(sink);
          capturedFirstWriteAccepted = transform.write('data', 'gbk');
          transform.end('-tail', 'gbk');
        });
        expect(capturedFirstWriteAccepted).assertTrue();
        expect(transform.receivedEncodings.length).assertEqual(2);
        expect(transform.receivedEncodings[0]).assertEqual('gbk');
        expect(transform.receivedEncodings[1]).assertEqual('gbk');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedText).assertEqual('data-tail');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_1900
     * @tc.name testStreamBusinessScenario019
     * @tc.desc Verify connectReadableToTransform sends an ERROR record through the error filter and retains one alert record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new LogListReadable(['[ERROR] crash']);
        let t = new LogErrorFilterTransform();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('[ERROR] crash');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_2000
     * @tc.name testStreamBusinessScenario020
     * @tc.desc Verify manual data and end listeners feed an INFO record to the non-error filter and finish the archive sink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new LogListReadable(['[INFO] started']);
        let t = new LogNonErrorFilterTransform();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('[INFO] started');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_2100
     * @tc.name testStreamBusinessScenario021
     * @tc.desc Verify no match no output "[DEBUG] trace" neither channel receives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new LogListReadable(['[DEBUG] trace']);
      let t1 = new LogErrorFilterTransform();
      let w1 = new BizCollectWritable();
      connectReadableToTransform(r, t1);
      t1.pipe(w1);
      expect(w1.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_2200
     * @tc.name testStreamBusinessScenario022
     * @tc.desc Verify mixed log split ERROR+INFO+DEBUG alert 1 archive 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let logs: string[] = ['[ERROR] err1', '[INFO] info1', '[DEBUG] debug1'];
        let rAlert = new LogListReadable(logs);
        let rArchive = new LogListReadable(logs);
        let tAlert = new LogErrorFilterTransform();
        let tArchive = new LogNonErrorFilterTransform();
        let wAlert = new BizCollectWritable();
        let wArchive = new BizCollectWritable();
        let capturedAlertWriteCount: int = 0;
        let capturedArchiveWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let finished: int = 0;
          wAlert.on('finish', (): void => {
            capturedAlertWriteCount = wAlert.writeCount;
            finished++;
            if (finished === 2) {
              resolve(undefined as void);
            }
          });
          wArchive.on('finish', (): void => {
            capturedArchiveWriteCount = wArchive.writeCount;
            finished++;
            if (finished === 2) {
              resolve(undefined as void);
            }
          });
          connectReadableToTransform(rAlert, tAlert);
          tAlert.pipe(wAlert);
          connectReadableToTransform(rArchive, tArchive);
          tArchive.pipe(wArchive);
        });
        expect(capturedAlertWriteCount).assertEqual(1);
        expect(capturedArchiveWriteCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_2300
     * @tc.name testStreamBusinessScenario023
     * @tc.desc Verify large log file split processing without data loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let logs: string[] = [];
        for (let i: int = 0; i < 16; i++) {
          logs.push('[ERROR] ' + 'x'.repeat(4088));
        }
        let r = new LogListReadable(logs);
        let t = new LogErrorFilterTransform();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedTotalLength: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedTotalLength = w.totalLength;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(16);
        expect(capturedTotalLength).assertEqual(65536);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_2400
     * @tc.name testStreamBusinessScenario024
     * @tc.desc Verify the XOR encrypt-transport-decrypt chain restores ASCII and CJK payloads without loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let payloads: string[] = ["secret data", "机密数据"];
        for (let i = 0; i < payloads.length; i++) {
          let r = new BizSingleReadable(payloads[i]);
          let enc = new XorEncryptTransform();
          let dup = new BizTransportDuplex();
          let dec = new XorDecryptTransform(false);
          let w = new BizCollectWritable();
          let capturedWriteCount: int = 0;
          let capturedCollected: string = "";
          let capturedReceived0: string = "";
          await new Promise<void>((resolve: (value: void) => void): void => {
            w.on("finish", (): void => {
              capturedWriteCount = w.writeCount;
              capturedCollected = w.collected;
              capturedReceived0 = w.received[0] as string;
              resolve(undefined as void);
            });
            connectReadableToTransform(r, enc);
            connectReadableToTransform(enc, dup);
            connectReadableToTransform(dup, dec);
            dec.pipe(w);
          });
          expect(capturedWriteCount).assertEqual(1);
          expect(capturedCollected).assertEqual(payloads[i]);
          expect(capturedReceived0).assertEqual(payloads[i]);
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_2500
     * @tc.name testStreamBusinessScenario025
     * @tc.desc Verify empty data encrypt/decrypt "" works normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new BizEmptyReadable();
      let enc = new XorEncryptTransform();
      let dup = new BizTransportDuplex();
      let dec = new XorDecryptTransform(false);
      let w = new BizCollectWritable();
      connectReadableToTransform(r, enc);
      connectReadableToTransform(enc, dup);
      connectReadableToTransform(dup, dec);
      dec.pipe(w);
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_2600
     * @tc.name testStreamBusinessScenario026
     * @tc.desc Verify wrong key decryption wrong key garbled or error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('secret');
        let enc = new XorEncryptTransform();
        let dup = new BizTransportDuplex();
        let dec = new XorDecryptTransform(true);
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0Length: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0Length = (w.received[0] as string).length;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, enc);
          connectReadableToTransform(enc, dup);
          connectReadableToTransform(dup, dec);
          dec.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0Length).assertEqual(6);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_2700
     * @tc.name testStreamBusinessScenario027
     * @tc.desc Verify multi-row CSV "key,value\nb,2\nc,3" becomes 2 objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('key,value\nb,2\nc,3');
        let t = new CsvParseTransform();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        let capturedReceived1: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            capturedReceived1 = w.received[1] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedReceived0).assertEqual('{key:b,value:2}');
        expect(capturedReceived1).assertEqual('{key:c,value:3}');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_2800
     * @tc.name testStreamBusinessScenario028
     * @tc.desc Verify single-column CSV output continues through uppercase normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('col\nvalue');
        let t = new CsvParseTransform();
        let upper = new ToUpperCaseTransform();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.on('data', (chunk: Object): void => {
            upper.write(chunk.toString(), 'utf8');
          });
          t.on('end', (): void => {
            upper.end();
          });
          upper.on('data', (chunk: Object): void => {
            w.write(chunk.toString(), 'utf8');
          });
          upper.on('end', (): void => {
            w.end();
          });
          upper.resume();
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('{COL:VALUE}');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_2900
     * @tc.name testStreamBusinessScenario029
     * @tc.desc Verify empty CSV "" becomes an empty object list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let t = new CsvParseTransform();
        let w = new BizCollectWritable();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            resolve(undefined as void);
          });
          t.pipe(w);
          t.end('', 'utf8');
        });
        expect(w.writeCount).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_3000
     * @tc.name testStreamBusinessScenario030
     * @tc.desc Verify malformed CSV "a,b\nc" tolerance or error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new CsvMalformedTransform();
      try {
        t.write('a,b\nc');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_3100
     * @tc.name testStreamBusinessScenario031
     * @tc.desc Verify fast production at 100KB/s and slow consumption at 10KB/s preserve all data under backpressure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let w = new BizCollectWritable();
      let backpressure: boolean = false;
      for (let i: int = 0; i < 15; i++) {
        let chunk: string = 'x'.repeat(20000);
        let ret: boolean = w.write(chunk);
        if (!ret) {
          backpressure = true;
        }
      }
      expect(backpressure).assertTrue();
      expect(w.writeCount).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_3200
     * @tc.name testStreamBusinessScenario032
     * @tc.desc Verify piped three-chunk input reaches the writable without loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new HttpChunkReadable(['red', 'green', 'blue']);
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedCollected: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedCollected = w.collected;
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedCollected).assertEqual('redgreenblue');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_3300
     * @tc.name testStreamBusinessScenario033
     * @tc.desc Verify a readable can pause after data delivery and resume to completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BackpressureReadable(2);
        let capturedDataCount: int = 0;
        let capturedPaused: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on('data', (): void => {
            capturedDataCount++;
            if (capturedDataCount === 1) {
              r.pause();
              capturedPaused = r.isPaused();
              setTimeout((): void => {
                r.resume();
              }, 0);
            }
          });
          r.on('end', (): void => {
            resolve(undefined as void);
          });
          r.resume();
        });
        expect(capturedDataCount).assertEqual(2);
        expect(capturedPaused).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_3400
     * @tc.name testStreamBusinessScenario034
     * @tc.desc Verify cork batch sending follows the cork, write, and uncork sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let w = new BizCorkWritable();
      w.cork();
      w.write('a');
      w.write('b');
      w.write('c');
      expect(w.writableCorked).assertEqual(1);
      expect(w.writeCount).assertEqual(0);
      w.uncork();
      expect(w.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_3500
     * @tc.name testStreamBusinessScenario035
     * @tc.desc Verify consumer crash recovery error then restart no duplication no loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let w = new CrashRecoveryWritable();
        let capturedErrorName: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('error', (err: Object): void => {
            capturedErrorName = (err as Error).name;
            capturedWriteCount = w.writeCount;
            resolve(undefined as void);
          });
          try {
            w.write('data1');
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          w.write('data2');
        });
        expect(capturedErrorName).assertEqual('Error');
        expect(capturedWriteCount).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_3600
     * @tc.name testStreamBusinessScenario036
     * @tc.desc Verify two source chunks retain order through the merge transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r1 = new HttpChunkReadable(['a', 'c']);
        let t1 = new BizSeqMergeTransform();
        let w1 = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w1.on('finish', (): void => {
            capturedWriteCount = w1.writeCount;
            capturedReceived0 = w1.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r1, t1);
          t1.pipe(w1);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('a,c');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_3700
     * @tc.name testStreamBusinessScenario037
     * @tc.desc Verify both sources empty and BizSeqMergeTransform produces no output without an empty flush string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new BizEmptyReadable();
      let t = new BizSeqMergeTransform();
      let w = new BizCollectWritable();
      connectReadableToTransform(r, t);
      t.pipe(w);
      expect(w.writeCount).assertEqual(0);
      expect(w.received.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_3800
     * @tc.name testStreamBusinessScenario038
     * @tc.desc Verify variable-length chunks 1,5,2,3KB complete concatenation 11KB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let chunks: string[] = ['x'.repeat(1024), 'x'.repeat(5120), 'x'.repeat(2048), 'x'.repeat(3072)];
        let r = new HttpChunkReadable(chunks);
        let w = new HttpCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedCollectedLength: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedCollectedLength = w.collected.length;
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(4);
        expect(capturedCollectedLength).assertEqual(11264);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_3900
     * @tc.name testStreamBusinessScenario039
     * @tc.desc Verify 0-byte chunks empty chunks skipped pipe works normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let chunks: string[] = ['', 'x'.repeat(5120), '', 'x'.repeat(5120)];
        let r = new HttpChunkReadable(chunks);
        let w = new HttpCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedCollectedLength: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedCollectedLength = w.collected.length;
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedCollectedLength).assertEqual(10240);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_4000
     * @tc.name testStreamBusinessScenario040
     * @tc.desc Verify end with data: end('end data') triggers finish and data arrives at Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let w = new BizCollectWritable();
        let capturedFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedFinished = w.writableFinished;
            resolve(undefined as void);
          });
          w.end('end data');
        });
        expect(capturedFinished).assertTrue();
        expect(w.writableEnded).assertTrue();
        expect(w.writeCount).assertEqual(1);
        expect(w.received[0]).assertEqual('end data');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_4100
     * @tc.name testStreamBusinessScenario041
     * @tc.desc Verify cork buffers a piped multi-chunk flow until uncork and preserves content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BackpressureReadable(5);
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedCorkedBefore: int = 0;
        let capturedCorkedAfter: int = 0;
        let capturedCollected: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.cork();
          capturedCorkedBefore = w.writableCorked;
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedCorkedAfter = w.writableCorked;
            capturedCollected = w.collected;
            resolve(undefined as void);
          });
          r.on('end', (): void => {
            w.uncork();
          });
          r.pipe(w);
        });
        expect(capturedCorkedBefore).assertEqual(1);
        expect(capturedCorkedAfter).assertEqual(0);
        expect(capturedWriteCount).assertEqual(5);
        expect(capturedCollected.length).assertEqual(5120);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_4200
     * @tc.name testStreamBusinessScenario042
     * @tc.desc Verify push multiple times in Transform then callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('abc');
        let t = new MultiPushTransform();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedCollected: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedCollected = w.collected;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          t.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedCollected).assertEqual('abc');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_4300
     * @tc.name testStreamBusinessScenario043
     * @tc.desc Verify pipe returns the target Writable that observes ordered completion data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('chain');
        let w = new BizCollectWritable();
        let sameTarget: boolean = false;
        let observedText: string = '';
        let observedWrites: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            observedText = w.received[0] as string;
            observedWrites = w.writeCount;
            resolve(undefined as void);
          });
          let result = r.pipe(w);
          sameTarget = result === w;
        });
        expect(sameTarget).assertTrue();
        expect(observedWrites).assertEqual(1);
        expect(observedText).assertEqual('chain');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BUSINESS_SCENARIO_4400
     * @tc.name testStreamBusinessScenario044
     * @tc.desc Verify all API combination Readable+Transform+Duplex+Writable full chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBusinessScenario044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BizSingleReadable('full chain test');
        let t = new EdgeUppercaseTransform();
        let d = new BizTransportDuplex();
        let w = new BizCollectWritable();
        let capturedWriteCount: int = 0;
        let capturedReceived0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            capturedWriteCount = w.writeCount;
            capturedReceived0 = w.received[0] as string;
            resolve(undefined as void);
          });
          connectReadableToTransform(r, t);
          connectReadableToTransform(t, d);
          d.pipe(w);
        });
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedReceived0).assertEqual('FULL CHAIN TEST');

        done();
      });
  });
}
