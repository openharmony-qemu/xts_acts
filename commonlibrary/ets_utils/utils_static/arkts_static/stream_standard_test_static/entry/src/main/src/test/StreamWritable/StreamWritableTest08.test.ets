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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import { stream } from '@kit.ArkTS';
import Utils from '../Util.test';

class TestWritableCh01 extends stream.Writable {
  receivedChunks: string[] = []
  constructor() { super(); }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (typeof chunk === 'string') {
      this.receivedChunks.push(chunk as string);
    }
    callback.unsafeCall();
  }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    console.info("Writable chunks", chunks);
    for (const chunk of chunks) {
      if (chunk instanceof Uint8Array) {
        let result = '';
        for (let j = 0; j < chunk.length; j++) {
          result += String.fromCharCode(chunk[j].toInt());
        }
        this.receivedChunks.push(result);
      } else {
        this.receivedChunks.push(chunk);
      }
    }
    callback.unsafeCall();
  }
}

class TestWritableCh02 extends stream.Writable {
  receivedChunks: (string | Uint8Array)[] = [];
  doWritevCalled: boolean = false;
  constructor() { super(); }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    console.info("doWritev called with chunks count:", chunks.length);
    this.doWritevCalled = true;
    for (const chunk of chunks) {
      this.receivedChunks.push(chunk);
    }
    expect(chunks.length).assertEqual(2);
    callback.unsafeCall();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    console.info("doWrite called instead of doWritev");
    this.receivedChunks.push(chunk);
    callback.unsafeCall();
  }
}

class TestWritableCh03 extends stream.Writable {
  constructor() { super(); }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    console.info("Writable chunks", chunks);
    expect(chunks.length).assertEqual(0);
    callback.unsafeCall();
  }
}

class TestWritableCh04 extends stream.Writable {
  receivedData: string[] = [];
  doWritevCalled: boolean = false;
  constructor() { super(); }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    console.info("doWritev called with chunks count:", chunks.length);
    this.doWritevCalled = true;
    for (const chunk of chunks) {
      if (typeof chunk === 'string') {
        this.receivedData.push(chunk as string);
      } else if (chunk instanceof Uint8Array) {
        let result = '';
        for (let j = 0; j < chunk.length; j++) {
          result += String.fromCharCode(chunk[j].toInt());
        }
        this.receivedData.push(result);
      }
    }
    expect(chunks.length).assertEqual(2);
    callback.unsafeCall();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    console.info("doWrite called");
    if (typeof chunk === 'string') {
      this.receivedData.push(chunk as string);
    } else if (chunk instanceof Uint8Array) {
      let result = '';
      for (let i = 0; i < chunk.length; i++) {
        result += String.fromCharCode(chunk[i].toInt());
      }
      this.receivedData.push(result);
    }
    callback.unsafeCall();
  }
}

class TestWritableCh05 extends stream.Writable {
  receivedData: string[] = [];
  doWritevCalled: boolean = false;
  constructor() { super(); }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    console.info("doWritev called with chunks count:", chunks.length);
    this.doWritevCalled = true;
    for (const chunk of chunks) {
      if (typeof chunk === 'string') {
        this.receivedData.push(chunk as string);
      } else if (chunk instanceof Uint8Array) {
        let result = '';
        for (let j = 0; j < chunk.length; j++) {
          result += String.fromCharCode(chunk[j].toInt());
        }
        this.receivedData.push(result);
      }
    }
    expect(chunks.length).assertEqual(3);
    callback.unsafeCall();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    console.info("doWrite called");
    if (typeof chunk === 'string') {
      this.receivedData.push(chunk as string);
    } else if (chunk instanceof Uint8Array) {
      let result = '';
      for (let i = 0; i < chunk.length; i++) {
        result += String.fromCharCode(chunk[i].toInt());
      }
      this.receivedData.push(result);
    }
    callback.unsafeCall();
  }
}

class TestWritableCh06 extends stream.Writable {
  receivedChunks: Uint8Array[] = [];
  doWritevCalled: boolean = false;
  constructor() { super(); }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    console.info("doWritev called with chunks count:", chunks.length);
    this.doWritevCalled = true;
    for (const chunk of chunks) {
      if (chunk instanceof Uint8Array) {
        this.receivedChunks.push(chunk);
      } else if (typeof chunk === 'string') {
        const str = chunk;
        const uint8Array = new Uint8Array(str.length);
        for (let j = 0; j < str.length; j++) {
          uint8Array[j] = str.charCodeAt(j);
        }
        this.receivedChunks.push(uint8Array);
      }
    }
    expect(chunks.length).assertEqual(4);
    callback.unsafeCall();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    console.info("doWrite called");
    if (chunk instanceof Uint8Array) {
      this.receivedChunks.push(chunk);
    } else if (typeof chunk === 'string') {
      const str = chunk;
      const uint8Array = new Uint8Array(str.length);
      for (let i = 0; i < str.length; i++) {
        uint8Array[i] = str.charCodeAt(i);
      }
      this.receivedChunks.push(uint8Array);
    }
    callback.unsafeCall();
  }
}

class TestWritableCh07 extends stream.Writable {
  callbackCalled: boolean = false;
  constructor() { super(); }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    console.info("Writable chunks", chunks);
    expect(chunks.length).assertEqual(1);
    for (const chunk of chunks) {
      if (typeof chunk === 'string') {
        expect(chunk).assertEqual('test');
      }
    }
    this.callbackCalled = true;
    callback.unsafeCall();
  }
}

class TestWritableCh08 extends stream.Writable {
  receivedData: string[] = [];
  doWritevCalled: boolean = false;
  constructor() { super(); }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    console.info("doWritev called with chunks length:", chunks.length);
    this.doWritevCalled = true;
    for (const chunk of chunks) {
      if (typeof chunk === 'string') {
        this.receivedData.push(chunk as string);
      } else if (chunk instanceof Uint8Array) {
        let result = '';
        for (let j = 0; j < chunk.length; j++) {
          result += String.fromCharCode(chunk[j].toInt());
        }
        this.receivedData.push(result);
      }
    }
    expect(chunks.length).assertEqual(10);
    callback.unsafeCall();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    console.info("doWrite called");
    if (typeof chunk === 'string') {
      this.receivedData.push(chunk as string);
    } else if (chunk instanceof Uint8Array) {
      let result = '';
      for (let i = 0; i < chunk.length; i++) {
        result += String.fromCharCode(chunk[i].toInt());
      }
      this.receivedData.push(result);
    }
    callback.unsafeCall();
  }
}

class TestWritableCh09 extends stream.Writable {
  callbackExecutionCount: number = 0;
  constructor() { super(); }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
    this.callbackExecutionCount++;
  }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    console.info("Writable chunks count:", chunks.length);
    callback.unsafeCall();
    this.callbackExecutionCount++;
  }
}

class TestWritableCh10 extends stream.Writable {
  receivedData: string[] = [];
  doWritevCalled: boolean = false;
  constructor() { super(); }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    console.info("doWritev called with chunks length:", chunks.length);
    this.doWritevCalled = true;
    for (const chunk of chunks) {
      if (typeof chunk === 'string') {
        this.receivedData.push(chunk as string);
      } else if (chunk instanceof Uint8Array) {
        let result = '';
        for (let j = 0; j < chunk.length; j++) {
          result += String.fromCharCode(chunk[j].toInt());
        }
        this.receivedData.push(result);
      }
    }
    expect(chunks.length).assertEqual(3);
    setTimeout((): void => { callback.unsafeCall(); }, 0);
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    console.info("doWrite called");
    if (typeof chunk === 'string') {
      this.receivedData.push(chunk as string);
    } else if (chunk instanceof Uint8Array) {
      let result = '';
      for (let i = 0; i < chunk.length; i++) {
        result += String.fromCharCode(chunk[i].toInt());
      }
      this.receivedData.push(result);
    }
    setTimeout((): void => { callback.unsafeCall(); }, 0);
  }
}

export default function StreamWritable08Test(): void {
  describe('StreamWritable08Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(10)
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0100
     * @tc.name      testStreamWritable08Chapter0001
     * @tc.desc      Test doWritev with multiple string writes and uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writableStream = new TestWritableCh01();
      writableStream.write('data1', 'utf8');
      writableStream.write('data2', 'utf8');
      expect(writableStream.receivedChunks.length).assertEqual(2);
      expect(writableStream.receivedChunks[0]).assertEqual('data1');
      expect(writableStream.receivedChunks[1]).assertEqual('data2');
      writableStream.uncork();
      writableStream.end();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0200
     * @tc.name      testStreamWritable08Chapter0002
     * @tc.desc      Test cork and uncork with Uint8Array writes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writableStream = new TestWritableCh02();
      const uint8Array1 = new Uint8Array([72, 101, 108, 108, 111]);
      const uint8Array2 = new Uint8Array([72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]);

      writableStream.cork();
      writableStream.write(uint8Array1);
      writableStream.write(uint8Array2);
      writableStream.uncork();

      setTimeout((): void => {
        expect(writableStream.receivedChunks.length > 0).assertTrue();

        if (writableStream.receivedChunks.length >= 2) {
          expect(writableStream.receivedChunks.length).assertEqual(2);
        }

        writableStream.end();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0300
     * @tc.name      testStreamWritable08Chapter0003
     * @tc.desc      Test uncork and end with no data written
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writableStream = new TestWritableCh03();
      expect(writableStream instanceof TestWritableCh03).assertTrue()
      writableStream.uncork();
      writableStream.end();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0400
     * @tc.name      testStreamWritable08Chapter0004
     * @tc.desc      Test cork with special characters and escape strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writableStream = new TestWritableCh04();

      writableStream.cork();
      writableStream.write('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~', 'utf8');
      writableStream.write('Hello\nWorld\tTest\r', 'utf8');
      writableStream.uncork();

      setTimeout((): void => {
        expect(writableStream.receivedData.length).assertEqual(2);

        if (writableStream.receivedData.length >= 2) {
          expect(writableStream.receivedData[0]).assertEqual('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
          expect(writableStream.receivedData[1]).assertEqual('Hello\nWorld\tTest\r');
        }

        writableStream.end();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0500
     * @tc.name      testStreamWritable08Chapter0005
     * @tc.desc      Test cork with Unicode emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writableStream = new TestWritableCh05();

      writableStream.cork();
      writableStream.write('\u{1F446}', 'utf8');
      writableStream.write('\u{1F385}', 'utf8');
      writableStream.write('\u{1F93C}\u200D\u2642\uFE0F', 'utf8');
      writableStream.uncork();

      setTimeout((): void => {
        expect(writableStream.receivedData.length).assertEqual(3);

        if (writableStream.receivedData.length >= 3) {
          expect(writableStream.receivedData[0]).assertEqual('\u{1F446}');
          expect(writableStream.receivedData[1]).assertEqual('\u{1F385}');
          expect(writableStream.receivedData[2]).assertEqual('\u{1F93C}\u200D\u2642\uFE0F');
        }

        writableStream.end();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0600
     * @tc.name      testStreamWritable08Chapter0006
     * @tc.desc      Test cork with Uint8Array boundary values 0 and 255
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writableStream = new TestWritableCh06();

      writableStream.cork();
      writableStream.write(new Uint8Array([0]), 'utf8');
      writableStream.write(new Uint8Array([255]), 'utf8');

      const arr1 = new Uint8Array(1);
      arr1[0] = 255;
      writableStream.write(arr1, 'utf8');

      const arr2 = new Uint8Array(1);
      arr2[0] = 0;
      writableStream.write(arr2, 'utf8');
      writableStream.uncork();

      setTimeout((): void => {
        expect(writableStream.receivedChunks.length).assertEqual(4);

        if (writableStream.receivedChunks.length >= 4) {
          expect(writableStream.receivedChunks[0][0]).assertEqual(0);
          expect(writableStream.receivedChunks[1][0]).assertEqual(255);
          expect(writableStream.receivedChunks[2][0]).assertEqual(255);
          expect(writableStream.receivedChunks[3][0]).assertEqual(0);
        }

        writableStream.end();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0700
     * @tc.name      testStreamWritable08Chapter0007
     * @tc.desc      Test doWritev with single string write and callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writableStream = new TestWritableCh07();
      writableStream.write('test', 'utf8');
      writableStream.uncork();
      writableStream.end();

      setTimeout((): void => {
        expect(writableStream.callbackCalled).assertTrue();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0800
     * @tc.name      testStreamWritable08Chapter0008
     * @tc.desc      Test cork with 10 consecutive writes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writableStream = new TestWritableCh08();

      writableStream.cork();
      for (let i = 0; i < 10; i++) {
        writableStream.write(`data${i}`, 'utf8');
      }
      writableStream.uncork();

      setTimeout((): void => {
        expect(writableStream.receivedData.length).assertEqual(10);

        for (let i = 0; i < writableStream.receivedData.length; i++) {
          expect(writableStream.receivedData[i]).assertEqual(`data${i}`);
        }

        writableStream.end();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0900
     * @tc.name      testStreamWritable08Chapter0009
     * @tc.desc      Test async doWritev with delayed callback execution
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const writableStream = new TestWritableCh09();
      writableStream.write('chunk1', 'utf8');
      writableStream.write('chunk2', 'utf8');
      writableStream.write('chunk3', 'utf8');
      writableStream.uncork();
      writableStream.end();
      await new Promise<void>((resolve: (value: void) => void) => {
        setTimeout((): void => {
          console.info("Callback execution count:", writableStream.callbackExecutionCount);
          expect(writableStream.callbackExecutionCount).assertEqual(3);
          resolve(undefined as void);
        }, 100);
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_1000
     * @tc.name      testStreamWritable08Chapter0010
     * @tc.desc      Test end with data and corked writes with _writev override
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const writableStream = new TestWritableCh10();
      await new Promise<void>((resolve: (value: void) => void) => {
        writableStream.end('empty', 'utf8', (): void => {
          resolve(undefined as void);
        });
      });
      await new Promise<void>((resolve: (value: void) => void) => {
        setTimeout((): void => {
          const writableStream2 = new TestWritableCh10();
          writableStream2.cork();
          writableStream2.write('empty1', 'utf8');
          writableStream2.write('empty2', 'utf8');
          writableStream2.write('non-empty', 'utf8');
          writableStream2.uncork();
          setTimeout((): void => {
            expect(writableStream2.receivedData.length).assertEqual(3);
            if (writableStream2.receivedData.length >= 3) {
              expect(writableStream2.receivedData[0]).assertEqual('empty1');
              expect(writableStream2.receivedData[1]).assertEqual('empty2');
              expect(writableStream2.receivedData[2]).assertEqual('non-empty');
            }
            writableStream2.end();
            resolve(undefined as void);
          }, 100);
        }, 50);
      });
    });
  })
}
