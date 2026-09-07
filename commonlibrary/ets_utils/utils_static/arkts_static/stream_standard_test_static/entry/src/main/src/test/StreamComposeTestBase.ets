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

import { buffer, stream, util } from '@kit.ArkTS';

function decodeWritableChunk(chunk: string | Uint8Array, encoding: string): string {
  if (typeof chunk === 'string') {
    return chunk as string;
  }
  let decoder: util.TextDecoder = util.TextDecoder.create(encoding);
  return decoder.decodeToString(chunk as Uint8Array);
}

function decodeReadableChunk(chunk: Object): string {
  if (typeof chunk === 'string') {
    return chunk as string;
  }
  let value: buffer.Buffer = chunk as buffer.Buffer;
  return value.toString('utf8');
}

export class FlowChunkReadable extends stream.Readable {
  private chunks: (string | Uint8Array)[] = [];
  private emitted: boolean = false;

  constructor(chunks: (string | Uint8Array)[]) {
    super();
    this.chunks = chunks;
  }

  doRead(size: int): void {
  }

  writeTo(target: stream.Writable): void {
    if (this.emitted) {
      return;
    }
    this.emitted = true;
    for (let index: int = 0; index < this.chunks.length; index++) {
      target.write(this.chunks[index], 'utf8');
    }
    this.push(null);
    target.end();
  }
}

export class FlowCollectWritable extends stream.Writable {
  public text: string = '';
  public chunks: string[] = [];
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let value: string = decodeWritableChunk(chunk, encoding);
    this.text += value;
    this.chunks.push(value);
    this.writeCount++;
    callback.unsafeCall();
  }
}

export class FlowByteWritable extends stream.Writable {
  public bytes: number[] = [];
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let value: Uint8Array;
    if (typeof chunk === 'string') {
      value = util.TextEncoder.create(encoding).encodeInto(chunk as string);
    } else {
      value = chunk as Uint8Array;
    }
    for (let index: int = 0; index < value.length; index++) {
      this.bytes.push(value[index]);
    }
    this.writeCount++;
    callback.unsafeCall();
  }
}

export class FlowUppercaseTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    let value: string = chunk.toString();
    this.push(value.toUpperCase());
    callback.unsafeCall();
  }
}

export class FlowPrefixTransform extends stream.Transform {
  private prefix: string = '';

  constructor(prefix: string) {
    super();
    this.prefix = prefix;
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    let value: string = chunk.toString();
    this.push(this.prefix + value);
    callback.unsafeCall();
  }
}

export class FlowDuplicateTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    this.push(chunk);
    callback.unsafeCall();
  }
}

export class FlowTrailerTransform extends stream.Transform {
  private trailer: string = '';

  constructor(trailer: string) {
    super();
    this.trailer = trailer;
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.push(this.trailer);
    callback.unsafeCall();
  }
}

export class FlowSequenceTransform extends stream.Transform {
  private sequence: int = 0;

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.sequence++;
    let value: string = chunk.toString();
    this.push(this.sequence.toString() + ':' + value + ';');
    callback.unsafeCall();
  }
}

export class FlowLineTransform extends stream.Transform {
  private pending: string = '';

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.pending += chunk.toString();
    let lineEnd: int = this.pending.indexOf('\n');
    while (lineEnd >= 0) {
      let line: string = this.pending.substring(0, lineEnd);
      if (line.endsWith('\r')) {
        line = line.substring(0, line.length - 1);
      }
      this.push(line + '|');
      this.pending = this.pending.substring(lineEnd + 1);
      lineEnd = this.pending.indexOf('\n');
    }
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    if (this.pending.length > 0) {
      this.push(this.pending + '|');
      this.pending = '';
    }
    callback.unsafeCall();
  }
}

export class FlowChecksumTransform extends stream.Transform {
  private checksum: int = 0;

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    let value: string = chunk.toString();
    for (let index: int = 0; index < value.length; index++) {
      this.checksum += value.charCodeAt(index);
    }
    this.push(value);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.push('#' + this.checksum.toString());
    callback.unsafeCall();
  }
}

export function connectReadableToWritable(source: FlowChunkReadable, target: stream.Writable): void {
  source.writeTo(target);
}

export function feedTransform(target: stream.Transform, chunks: (string | Uint8Array)[]): void {
  setTimeout((): void => {
    for (let index: int = 0; index < chunks.length; index++) {
      target.write(chunks[index], 'utf8');
    }
    target.end();
  }, 0);
}

export function connectTransformToWritable(source: stream.Transform, target: stream.Writable): void {
  source.pipe(target);
}

export function connectTransformToTransform(source: stream.Transform, target: stream.Transform): void {
  source.on('data', (chunk: Object): void => {
    let value: string = decodeReadableChunk(chunk);
    target.write(value, 'utf8');
  });
  source.on('end', (): void => {
    target.end();
  });
  source.resume();
}

export class ScenarioReadable extends stream.Readable {
  private chunks: string[] = [];
  private index: int = 0;
  private ended: boolean = false;
  public readCalls: int = 0;

  constructor(chunks: string[]) {
    super();
    this.chunks = chunks;
  }

  doRead(size: int): void {
    this.readCalls++;
    if (this.index < this.chunks.length) {
      this.push(this.chunks[this.index]);
      this.index++;
    } else if (!this.ended) {
      this.ended = true;
      this.push(null);
    }
  }
}

export class ScenarioCollectWritable extends stream.Writable {
  public records: string[] = [];
  public text: string = '';
  public writeCount: int = 0;
  public callbackCount: int = 0;
  private delay: int = 0;

  constructor(delay: int = 0) {
    super();
    this.delay = delay;
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let value: string = chunk.toString();
    this.records.push(value);
    this.text += value;
    this.writeCount++;
    if (this.delay > 0) {
      setTimeout((): void => {
        this.callbackCount++;
        callback.unsafeCall();
      }, this.delay);
    } else {
      this.callbackCount++;
      callback.unsafeCall();
    }
  }
}

export class ScenarioAsyncTransform extends stream.Transform {
  private prefix: string = '';
  private delay: int = 0;
  private flushValue: string = '';
  public transformCount: int = 0;
  public flushCount: int = 0;
  public inputRecords: string[] = [];
  public callOrder: string[] = [];

  constructor(prefix: string, delay: int = 0, flushValue: string = '') {
    super();
    this.prefix = prefix;
    this.delay = delay;
    this.flushValue = flushValue;
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    let value: string = chunk.toString();
    this.inputRecords.push(value);
    this.callOrder.push('start:' + value);
    this.transformCount++;
    this.callOrder.push('data:' + value);
    this.push(this.prefix + value);
    setTimeout((): void => {
      callback.unsafeCall();
    }, this.delay);
  }

  doFlush(callback: Function): void {
    if (this.flushValue.length === 0) {
      callback.unsafeCall();
      return;
    }
    this.flushCount++;
    this.callOrder.push('flush:' + this.flushValue);
    this.push(this.flushValue);
    callback.unsafeCall();
  }
}

export class ScenarioDuplex extends stream.Duplex {
  private prefix: string = '';
  public records: string[] = [];
  public writeCount: int = 0;

  constructor(prefix: string = '') {
    super();
    this.prefix = prefix;
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let value: string = chunk.toString();
    this.records.push(value);
    this.writeCount++;
    this.push(this.prefix + value);
    callback.unsafeCall();
  }
}

export class ThirdBatchByteReadable extends stream.Readable {
  private blocks: Uint8Array[] = [];
  private index: int = 0;
  private ended: boolean = false;

  constructor(blocks: Uint8Array[]) {
    super();
    this.blocks = blocks;
  }

  doRead(size: int): void {
    if (this.index < this.blocks.length) {
      this.push(this.blocks[this.index]);
      this.index++;
    } else if (!this.ended) {
      this.ended = true;
      this.push(null);
    }
  }
}

export class ThirdBatchTextReadable extends stream.Readable {
  private chunks: string[] = [];
  private index: int = 0;
  private ended: boolean = false;

  constructor(chunks: string[]) {
    super();
    this.chunks = chunks;
  }

  doRead(size: int): void {
    if (this.index < this.chunks.length) {
      this.push(this.chunks[this.index]);
      this.index++;
    } else if (!this.ended) {
      this.ended = true;
      this.push(null);
    }
  }
}

export class ThirdBatchEchoTransform extends stream.Transform {
  public input: string[] = [];
  public encodings: string[] = [];

  doTransform(chunk: string, encoding: string, callback: Function): void {
    let value: string = chunk.toString();
    this.input.push(value);
    this.encodings.push(encoding);
    this.push(value);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

export class ThirdBatchTextWritable extends stream.Writable {
  public records: string[] = [];
  public text: string = '';
  public writeCount: int = 0;
  public callbackCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let value: string;
    if (typeof chunk === 'string') {
      value = chunk as string;
    } else {
      value = util.TextDecoder.create(encoding).decodeToString(chunk as Uint8Array);
    }
    this.records.push(value);
    this.text += value;
    this.writeCount++;
    this.callbackCount++;
    callback.unsafeCall();
  }
}

export class ThirdBatchCheckpointWritable extends stream.Writable {
  public records: string[] = [];
  public text: string = '';
  public checkpoints: int[] = [];
  public writeCount: int = 0;
  private checkpointEvery: int = 1;

  constructor(checkpointEvery: int = 1) {
    super();
    this.checkpointEvery = checkpointEvery;
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let value: string = chunk.toString();
    this.records.push(value);
    this.text += value;
    this.writeCount++;
    if (this.writeCount % this.checkpointEvery === 0) {
      this.checkpoints.push(this.text.length);
    }
    callback.unsafeCall();
  }
}

export function connectEncodingFlow(source: ThirdBatchByteReadable, transform: ThirdBatchEchoTransform,
  sink: ThirdBatchTextWritable, encoding: string): void {
  source.on('data', (chunk: Object): void => {
    if (typeof chunk === 'string') {
      transform.write(chunk as string, encoding);
    } else {
      transform.write(chunk as Uint8Array, encoding);
    }
  });
  source.on('end', (): void => {
    transform.end();
  });
  transform.on('data', (chunk: Object): void => {
    if (typeof chunk === 'string') {
      sink.write(chunk as string, encoding);
    } else {
      sink.write(chunk as Uint8Array, encoding);
    }
  });
  transform.on('end', (): void => {
    sink.end();
  });
  transform.resume();
  source.resume();
}

export function connectCheckpointFlow(source: ThirdBatchTextReadable,
  sink: ThirdBatchCheckpointWritable): void {
  source.on('data', (chunk: Object): void => {
    sink.write(chunk.toString(), 'utf8');
  });
  source.on('end', (): void => {
    sink.end();
  });
  source.resume();
}

/**
 * Reports a failure through the doWrite completion callback once the configured
 * chunk index is reached, so error-flow cases can inject a deterministic fault.
 */
export class FlowFailingWritable extends stream.Writable {
  public text: string = '';
  public writeCount: int = 0;
  private failAt: int = 1;
  private reason: string = '';

  constructor(failAt: int, reason: string) {
    super();
    this.failAt = failAt;
    this.reason = reason;
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    if (this.writeCount >= this.failAt) {
      callback.unsafeCall(new Error(this.reason));
      return;
    }
    this.text += decodeWritableChunk(chunk, encoding);
    callback.unsafeCall();
  }
}
