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

import { stream } from '@kit.ArkTS';


/**
 * Standard writable stream test base: records written chunks, encoding, and call count.
 */
export class WritableTestBase extends stream.Writable {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    this.writeCount++;
    callback.unsafeCall();
  }
}

/**
 * Calls the callback twice consecutively for testing error 10200037.
 */
export class WritableDoubleCb extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

/**
 * Calls the callback with an Error for testing the error event.
 */
export class WritableErrorCb extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error("write error"));
  }
}

/**
 * Standard readable stream test base: empty doRead, relying on manual push.
 */
export class ReadableTestBase extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

/**
 * doRead automatically pushes one data chunk and then ends.
 */
export class SinglePushReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("test");
    this.push(null);
  }
}

/**
 * doRead ends immediately because no data remains.
 */
export class EmptyReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push(null);
  }
}

/**
 * doRead throws an exception for testing the error event.
 */
export class ErrorThrowReadable extends ReadableTestBase {
  doRead(size: int): void {
    throw new Error("source error");
  }
}


/**
 * Writable that collects written data for pipe tests.
 */
export class CollectWritable extends stream.Writable {
  public received: Object[] = [];
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.received.push(chunk);
    this.writeCount++;
    callback.unsafeCall();
  }
}
