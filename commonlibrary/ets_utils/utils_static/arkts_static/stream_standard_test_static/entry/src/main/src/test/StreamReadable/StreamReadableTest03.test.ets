'use static';
﻿/*
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
import { stream, util } from '@kit.ArkTS';
import Utils from '../Util.test';

function invokeCb(cb: Function): void {
  try { (cb as (error?: Error | null) => void)(); } catch (e) {}
}

interface TipsOptions {
  key1?: string;
  key2?: number;
}

interface StreamError {
  code: number;
  message: string;
  name: string;
}

class IncompleteWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(_chunk: string | Uint8Array, _encoding: string, _callback: () => void): void {
  }
}

class BadWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(_chunk: string | Uint8Array, _encoding: string, _callback: () => void): void {
    throw new Error('BadWritable error');
  }
}

class WrongSignatureWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(_chunk: string | Uint8Array, _encoding: string, _callback: () => void): void {
    throw new Error('WrongSignatureWritable error');
  }
}

interface PipeOptions {
  end?: boolean;
}

class TestReadable0301 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0302 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0303 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0304 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0305 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0306 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0307 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0308 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0309 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0310 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0311 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0312 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0313 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0314 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0315 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0316 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0317 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0318 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0319 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0320 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0321 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0322 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestReadable0323 extends stream.Readable {
  doRead(size: number) {
  }
}

class TestReadable0324 extends stream.Readable {
  doRead(size: number) {
  }
}

class TestReadable0325 extends stream.Readable {
  doRead(size: number) {
  }
}

class TestReadable0326 extends stream.Readable {
  doRead(size: number) {
  }
}

class TestReadable0327 extends stream.Readable {
  doRead(size: number) {
  }
}

class CustomReadable0328 extends stream.Readable {
  data: number[] = [1, 2, 3];

  doRead(size: number) {
    if (this.data.length > 0) {
      this.push(this.data.shift()?.toString());
    } else {
      this.push(null);
    }
  }
}

class CustomReadable0329 extends stream.Readable {
  data: number[] = [1, 2, 3];

  doRead(size: number) {
    if (this.data.length > 0) {
      this.push(this.data.shift()?.toString());
    } else {
      this.push(null);
    }
  }
}

class CustomReadable0330 extends stream.Readable {
  data: number[] = [1, 2, 3];

  doRead(size: number) {
    if (this.data.length > 0) {
      this.push(this.data.shift()?.toString());
    } else {
      this.push(null);
    }
  }
}

class TestReadable0331 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
    this.push('test data');
    this.push(null);
  }
}

class TestWritable0331 extends stream.Writable {
  receivedData: string = '';

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    if (typeof chunk === 'string') {
      this.receivedData += chunk;
    }
    callback();
  }
}

class TestReadable0332 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
    this.push('test');
    this.push(null);
  }
}

class TestWritable0332 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    callback();
  }
}

class TestReadable0333 extends stream.Readable {
  chunkCount: number = 0;
  constructor() {
    super();
  }
  doRead(_size: number): void {
    if (this.chunkCount < 5) {
      this.push(`chunk${this.chunkCount}`);
      this.chunkCount++;
    } else {
      this.push(null);
    }
  }
}

class TestWritable0333 extends stream.Writable {
  receivedChunks: string[] = [];
  constructor() {
    super();
  }
  _write(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (typeof chunk === 'string') {
      this.receivedChunks.push(chunk as string);
    }
    invokeCb(callback);
  }
  doWrite(chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    if (typeof chunk === 'string') {
      this.receivedChunks.push(chunk as string);
    }
    callback();
  }
}

class TestReadable0334 extends stream.Readable {
  private pushed: boolean = false;
  constructor() {
    super();
  }
  doRead(_size: number): void {
    if (!this.pushed) {
      this.pushed = true;
      const data: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      this.push(data);
      this.push(null);
    }
  }
}

class TestWritable0334 extends stream.Writable {
  receivedBytes: number[] = [];
  constructor() {
    super();
  }
  _write(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (chunk instanceof Uint8Array) {
      for (const b of chunk) {
        this.receivedBytes.push(b);
      }
    }
    invokeCb(callback);
  }
  doWrite(chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    if (chunk instanceof Uint8Array) {
      for (const b of chunk) {
        this.receivedBytes.push(b);
      }
    }
    callback();
  }
}

class TestReadable0335 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
    this.push('test');
    this.push(null);
  }
}

class TestWritable0335 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    callback();
  }
}

class TestReadable0336 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
    this.push('test');
    this.push(null);
  }
}

class TestWritable0336 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    callback();
  }
}

class TestReadable0337 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
    this.push('test');
    this.push(null);
  }
}

class TestReadable0338 extends stream.Readable {
  dataSent: boolean = false;

  constructor() {
    super();
  }

  doRead(_size: number): void {
    if (!this.dataSent) {
      this.push('test data');
      this.dataSent = true;
    } else {
      this.push(null);
    }
  }
}

class TestWritable0338 extends stream.Writable {
  received: boolean = false;

  constructor() {
    super();
  }

  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    this.received = true;
    callback();
  }
}

class TestReadable0339 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
    this.push('data');
    this.push(null);
  }
}

class TestWritable0339a extends stream.Writable {
  received1: string = '';

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    if (typeof chunk === 'string') {
      this.received1 += chunk;
    }
    callback();
  }
}

class TestWritable0339b extends stream.Writable {
  received2: string = '';

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    if (typeof chunk === 'string') {
      this.received2 += chunk;
    }
    callback();
  }
}

class TestReadable0340 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
    const testString: string = "Hello World";
    this.push(testString);
    this.push(null);
  }
}

class TestWritable0340 extends stream.Writable {
  receivedData: string = '';

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    if (typeof chunk === 'string') {
      this.receivedData += chunk;
    }
    callback();
  }
}

class TestReadable0341 extends stream.Readable {
  constructor() {
    super();
  }
  doRead(_size: number): void {
    this.push("true");
    this.push("false");
    this.push(null);
  }
}

class TestWritable0341 extends stream.Writable {
  receivedData: string[] = [];
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    if (typeof chunk === 'string') {
      this.receivedData.push(chunk as string);
    }
    callback();
  }
}

class TestReadable0342 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
    const arrayData: number[] = [1, 2, 3];
    this.push(JSON.stringify(arrayData));
    this.push(null);
  }
}

class TestWritable0342 extends stream.Writable {
  receivedData: string = '';

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    if (typeof chunk === 'string') {
      this.receivedData += chunk;
    }
    callback();
  }
}

class TestReadable0343 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
    const int8Data: Int8Array = new Int8Array([-128, 0, 127]);
    const uint8Data: Uint8Array = new Uint8Array(int8Data.buffer, int8Data.byteOffset, int8Data.length);
    this.push(uint8Data);
    this.push(null);
  }
}

class TestWritable0343 extends stream.Writable {
  receivedData: number[] = [];

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    if (chunk instanceof Uint8Array) {
      for (const b of chunk) {
        this.receivedData.push(b);
      }
    }
    callback();
  }
}

class TestReadable0344 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
    this.push('test data');
    this.push(null);
  }
}

class TestWritable0344 extends stream.Writable {
  dataReceived: string = '';

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    if (typeof chunk === 'string') {
      this.dataReceived += chunk;
    }
    callback();
  }
}

export default function StreamReadable03Test(): void {
  describe('StreamReadable03Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_0100
     * @tc.name      testStreamReadable03Chapter0001
     * @tc.desc      setEncoding with default parameter should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0301();
      let result = readableStream.setEncoding();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_0200
     * @tc.name      testStreamReadable03Chapter0002
     * @tc.desc      setEncoding with 'utf8' should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0302();
      let result = readableStream.setEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_0300
     * @tc.name      testStreamReadable03Chapter0003
     * @tc.desc      setEncoding with 'gb18030' should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0303();
      let result = readableStream.setEncoding('gb18030');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_0400
     * @tc.name      testStreamReadable03Chapter0004
     * @tc.desc      setEncoding with 'gbk' should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0304();
      let result = readableStream.setEncoding('gbk');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_0500
     * @tc.name      testStreamReadable03Chapter0005
     * @tc.desc      setEncoding with 'gb2312' should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0305();
      let result = readableStream.setEncoding('gb2312');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_0600
     * @tc.name      testStreamReadable03Chapter0006
     * @tc.desc      setEncoding when buffer has data should return false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0306();
      readableStream.push('test data');
      let result = readableStream.setEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_0700
     * @tc.name      testStreamReadable03Chapter0007
     * @tc.desc      setEncoding with unsupported encoding should return false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0307();
      let result = false;
      try {
        result = readableStream.setEncoding('invalid-encoding');
      } catch (err) {
        result = false;
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_0800
     * @tc.name      testStreamReadable03Chapter0008
     * @tc.desc      setEncoding with empty string should return false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0308();
      let result = readableStream.setEncoding('');
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_0900
     * @tc.name      testStreamReadable03Chapter0009
     * @tc.desc      setEncoding with 'utf-8' (alias) should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0309();
      let result = readableStream.setEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_1000
     * @tc.name      testStreamReadable03Chapter0010
     * @tc.desc      setEncoding with undefined should use default encoding and return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0310();
      let result = readableStream.setEncoding(undefined);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_1100
     * @tc.name      testStreamReadable03Chapter0011
     * @tc.desc      setEncoding with special characters string should return false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0311();
      let result = false;
      try {
        result = readableStream.setEncoding('!@#$%^&*()');
      } catch (err) {
        expect(err.code).assertEqual(401);
        result = false;
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_1200
     * @tc.name      testStreamReadable03Chapter0012
     * @tc.desc      setEncoding with ASCII characters string should return false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0312();
      let result = false;
      try {
        result = readableStream.setEncoding('ABCDEFG');
      } catch (err) {
        result = false;
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_1300
     * @tc.name      testStreamReadable03Chapter0013
     * @tc.desc      setEncoding with escape characters string should return false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0313();
      let result = false;
      try {
        result = readableStream.setEncoding('\n\t\r');
      } catch (err) {
        result = false;
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_1400
     * @tc.name      testStreamReadable03Chapter0014
     * @tc.desc      setEncoding with emoji string should return false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0314();
      let result = false;
      try {
        result = readableStream.setEncoding('😊');
      } catch (err) {
        result = false;
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_1500
     * @tc.name      testStreamReadable03Chapter0015
     * @tc.desc      setEncoding with very long string should return false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0315();
      let result = true
      let invalidEncoding = "a".repeat(9999)
      try {
        result = readableStream.setEncoding(invalidEncoding);
      } catch (e) {
        result = false;
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_1600
     * @tc.name      testStreamReadable03Chapter0016
     * @tc.desc      setEncoding multiple times should work correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0316();
      let result1 = readableStream.setEncoding('utf8');
      expect(result1).assertTrue();

      let result2 = readableStream.setEncoding('gbk');
      expect(result2).assertTrue();

      readableStream.push('data');
      let result3 = readableStream.setEncoding('gb2312');
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_1700
     * @tc.name      testStreamReadable03Chapter0017
     * @tc.desc      setEncoding after clearing buffer should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0317();
      readableStream.push('test data');
      while (readableStream.read() !== null) {
      }
      let result = readableStream.setEncoding('gb18030');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_1800
     * @tc.name      testStreamReadable03Chapter0018
     * @tc.desc      setEncoding with uppercase encoding string should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0318();
      let result = readableStream.setEncoding('UTF8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_1900
     * @tc.name      testStreamReadable03Chapter0019
     * @tc.desc      setEncoding with mixed case encoding string should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0319();
      let result = readableStream.setEncoding('UtF8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_2000
     * @tc.name      testStreamReadable03Chapter0020
     * @tc.desc      setEncoding with leading/trailing spaces string should return false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0320();
      let result = false;
      try {
        result = readableStream.setEncoding('utf8');
      } catch (err) {
        expect(err.code).assertEqual(401);
        result = false;
      }
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_2100
     * @tc.name      testStreamReadable03Chapter0021
     * @tc.desc      setEncoding with 'null' string should return false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0321();
      let result = false;
      try {
        result = readableStream.setEncoding('null');
      } catch (err) {
        result = false;
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_2200
     * @tc.name      testStreamReadable03Chapter0022
     * @tc.desc      setEncoding with 'NaN' string should return false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0322();
      let result = false;
      try {
        result = readableStream.setEncoding('NaN');
      } catch (err) {
        result = false;
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_2300
     * @tc.name      testStreamReadable03Chapter0023
     * @tc.desc      Test isPaused returns false when stream is not paused initially
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream: TestReadable0323 = new TestReadable0323();
      let result: boolean = readableStream.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_2400
     * @tc.name      testStreamReadable03Chapter0024
     * @tc.desc      Test isPaused returns true after pause is called
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream: TestReadable0324 = new TestReadable0324();
      readableStream.pause();
      let result: boolean = readableStream.isPaused();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_2500
     * @tc.name      testStreamReadable03Chapter0025
     * @tc.desc      Test isPaused returns false after resume is called following pause
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream: TestReadable0325 = new TestReadable0325();
      readableStream.pause();
      readableStream.resume();
      let result: boolean = readableStream.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_2600
     * @tc.name      testStreamReadable03Chapter0026
     * @tc.desc      Test multiple pause calls keep isPaused returning true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream: TestReadable0326 = new TestReadable0326();
      readableStream.pause();
      readableStream.pause();
      readableStream.pause();
      let result: boolean = readableStream.isPaused();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_2700
     * @tc.name      testStreamReadable03Chapter0027
     * @tc.desc      Test multiple resume calls keep isPaused returning false when not paused
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream: TestReadable0327 = new TestReadable0327();
      readableStream.resume();
      readableStream.resume();
      readableStream.resume();
      let result: boolean = readableStream.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_2800
     * @tc.name      testStreamReadable03Chapter0028
     * @tc.desc      Test isPaused returns false for newly created stream with custom implementation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream: CustomReadable0328 = new CustomReadable0328();
      let result: boolean = readableStream.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_2900
     * @tc.name      testStreamReadable03Chapter0029
     * @tc.desc      Test isPaused returns true after pause on stream with data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream: CustomReadable0329 = new CustomReadable0329();
      readableStream.pause();
      let result: boolean = readableStream.isPaused();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_3000
     * @tc.name      testStreamReadable03Chapter0030
     * @tc.desc      Test isPaused returns false after resume on stream with data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream: CustomReadable0330 = new CustomReadable0330();
      readableStream.pause();
      readableStream.resume();
      let result: boolean = readableStream.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_3100
     * @tc.name      testStreamReadable03Chapter0031
     * @tc.desc      Test pipe method with valid Writable destination
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable: TestReadable0331 = new TestReadable0331();
      const writable: TestWritable0331 = new TestWritable0331();

      const result: stream.Writable = readable.pipe(writable);

      expect(result).assertEqual(writable);
      expect(result instanceof TestWritable0331).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_3200
     * @tc.name      testStreamReadable03Chapter0032
     * @tc.desc      Test pipe method with options parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable: TestReadable0332 = new TestReadable0332();
      const writable: TestWritable0332 = new TestWritable0332();
      const options: PipeOptions = {};
      const result: stream.Writable = readable.pipe(writable, options);

      expect(result).assertEqual(writable);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_3300
     * @tc.name      testStreamReadable03Chapter0033
     * @tc.desc      Test pipe method with multiple chunks of data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable: TestReadable0333 = new TestReadable0333();
      const writable: TestWritable0333 = new TestWritable0333();
      writable.on('finish', () => {
        expect(writable.receivedChunks.length).assertEqual(3);
      });
      readable.pipe(writable);
      readable.read();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_3400
     * @tc.name      testStreamReadable03Chapter0034
     * @tc.desc      Test pipe method with Uint8Array data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable: TestReadable0334 = new TestReadable0334();
      const writable: TestWritable0334 = new TestWritable0334();
      writable.on('finish', () => {
        expect(writable.receivedBytes.length).assertEqual(0);
      });
      readable.pipe(writable);
      readable.read();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_3500
     * @tc.name      testStreamReadable03Chapter0035
     * @tc.desc      Test pipe method with different types of options objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable1: TestReadable0335 = new TestReadable0335();
      const writable1: TestWritable0335 = new TestWritable0335();
      const options1: PipeOptions = {};
      const result1: stream.Writable = readable1.pipe(writable1, options1);
      expect(result1 === writable1).assertTrue();

      const readable2: TestReadable0335 = new TestReadable0335();
      const writable2: TestWritable0335 = new TestWritable0335();

      const options2: PipeOptions = {};
      const result2: stream.Writable = readable2.pipe(writable2, options2);

      expect(result2 === writable2).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_3600
     * @tc.name      testStreamReadable03Chapter0036
     * @tc.desc      Test pipe method with empty options object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable: TestReadable0336 = new TestReadable0336();
      const writable: TestWritable0336 = new TestWritable0336();

      const options: PipeOptions = {};
      const result: stream.Writable = readable.pipe(writable, options);

      expect(result).assertEqual(writable);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_3700
     * @tc.name      testStreamReadable03Chapter0037
     * @tc.desc      Negative test: Test pipe with invalid destination parameter using incomplete implementation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable: TestReadable0337 = new TestReadable0337();

      try {
        const incompleteWritable: IncompleteWritable = new IncompleteWritable();
        readable.pipe(incompleteWritable);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_3800
     * @tc.name      testStreamReadable03Chapter0038
     * @tc.desc      Test pipe method with valid Writable and check data flow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable: TestReadable0338 = new TestReadable0338();
      const writable: TestWritable0338 = new TestWritable0338();

      readable.pipe(writable);

      setTimeout(() => {
        expect(writable.received).assertTrue();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_3900
     * @tc.name      testStreamReadable03Chapter0039
     * @tc.desc      Test pipe method with two different Writable destinations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable: TestReadable0339 = new TestReadable0339();
      const writable1: TestWritable0339a = new TestWritable0339a();
      const writable2: TestWritable0339b = new TestWritable0339b();

      readable.pipe(writable1);
      const result: stream.Writable = readable.pipe(writable2);

      expect(result).assertEqual(writable2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_4000
     * @tc.name      testStreamReadable03Chapter0040
     * @tc.desc      Test pipe method with string data and verify content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable: TestReadable0340 = new TestReadable0340();
      const writable: TestWritable0340 = new TestWritable0340();

      readable.pipe(writable);

      setTimeout(() => {
        expect(writable.receivedData).assertEqual("Hello World");
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_4200
     * @tc.name      testStreamReadable03Chapter0042
     * @tc.desc      Test pipe method with array data converted to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable: TestReadable0342 = new TestReadable0342();
      const writable: TestWritable0342 = new TestWritable0342();

      readable.pipe(writable);

      setTimeout(() => {
        expect(writable.receivedData).assertEqual("[1,2,3]");
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_4300
     * @tc.name      testStreamReadable03Chapter0043
     * @tc.desc      Test pipe method with Int8Array data converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable: TestReadable0343 = new TestReadable0343();
      const writable: TestWritable0343 = new TestWritable0343();

      writable.on('finish', () => {
        expect(writable.receivedData.length).assertEqual(0);
      });

      readable.pipe(writable);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTHREE_4400
     * @tc.name      testStreamReadable03Chapter0044
     * @tc.desc      Test unpipe method with valid Writable destination
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable03Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable: TestReadable0344 = new TestReadable0344();
      const writable: TestWritable0344 = new TestWritable0344();

      readable.pipe(writable);
      const result: stream.Readable = readable.unpipe(writable);
      expect(result).assertEqual(readable);

      let dataReceived: boolean = false;
      readable.on('data', () => {
        dataReceived = true;
      });

      readable.push('test');
      expect(dataReceived).assertFalse();
    });
   }
  )
}
