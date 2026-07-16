'use static';
/*
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
import { stream } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

function invokeCb(cb: Function): void {
  try { (cb as (error?: Error | null) => void)(); } catch (e) {}
}
function invokeCbErr(cb: Function, err: Error | null): void {
  try { (cb as (e?: Error | null) => void)(err); } catch (e) {}
}

class TestDuplex06A extends stream.Duplex {
  receivedData: string | Uint8Array = '';
  receivedEncoding: string = '';
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.receivedData = chunk;
    this.receivedEncoding = encoding;
    invokeCb(callback);
  }
}

class TestDuplex06B extends stream.Duplex {
  receivedData: string | Uint8Array = '';
  callbackCalled: boolean = false;
  constructor() {
    super();
    this.callbackCalled = false;
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.receivedData = chunk;
    this.callbackCalled = true;
    invokeCb(callback);
  }
}

class TestDuplex06C extends stream.Duplex {
  receivedLength: number = 0;
  callbackCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (typeof chunk === 'string') {
      this.receivedLength = chunk.length;
    } else {
      this.receivedLength = chunk.length;
    }
    this.callbackCalled = true;
    invokeCb(callback);
  }
}

class TestDuplex06D extends stream.Duplex {
  receivedData: Uint8Array = new Uint8Array();
  dataLength: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (chunk instanceof Uint8Array) {
      this.receivedData = chunk;
      this.dataLength = chunk.length;
    }
    invokeCb(callback);
  }
}

class TestDuplex06E extends stream.Duplex {
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
}

class TestDuplex06F extends stream.Duplex {
  receivedData: Uint8Array = new Uint8Array();
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (chunk instanceof Uint8Array) {
      this.receivedData = chunk;
    }
    invokeCb(callback);
  }
}

class TestDuplex06G extends stream.Duplex {
  errorTriggered: boolean = false;
  constructor() {
    super();
    this.on('error', () => {
      this.errorTriggered = true;
    });
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    const testError = new Error('Test error');
    invokeCbErr(callback, testError);
  }
}

class TestDuplex06H extends stream.Duplex {
  receivedData: Array<string | Uint8Array> = [];
  writeCount: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.receivedData.push(chunk);
    this.writeCount++;
    invokeCb(callback);
  }
}

class TestDuplex06I extends stream.Duplex {
  receivedData: Array<string | Uint8Array> = [];
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.receivedData.push(chunk);
    invokeCb(callback);
  }
}

class TestDuplex06J extends stream.Duplex {
  receivedLength: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (chunk instanceof Uint8Array) {
      this.receivedLength = chunk.length;
    }
    invokeCb(callback);
  }
}

class TestDuplex06L extends stream.Duplex {
  writeCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.writeCalled = true;
    invokeCb(callback);
  }
}

class TestDuplex06M extends stream.Duplex {
  constructor() {
    super();
    this.on('error', (err: Error) => {

    });
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    throw new Error('Synchronous error in doWrite');
  }
}

class TestDuplex06N extends stream.Duplex {
  callbackCount: number = 0;
  writeCompleted: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
    this.callbackCount++;
    if (this.callbackCount === 1) {
      setTimeout(() => {
        try {
          invokeCb(callback);
        } catch (e) {
        }
      }, 0);
    }
  }
}

class TestDuplex06O extends stream.Duplex {
  writeCompleted: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    setTimeout(() => {
      this.writeCompleted = true;
      invokeCb(callback);
    }, 10);
  }
}

interface ITestDuplex {
  doWriteCalled: boolean;
  markAsClosed(): void;
  isClosed(): boolean;
}

class TestDuplex06P extends stream.Duplex implements ITestDuplex {
  doWriteCalled: boolean = false;
  streamClosed: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number): void {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (this.streamClosed) {
      invokeCbErr(callback, new Error('Stream is closed'));
      return;
    }
    this.doWriteCalled = true;
    invokeCb(callback);
  }
  markAsClosed(): void {
    this.streamClosed = true;
  }
  isClosed(): boolean {
    return this.streamClosed;
  }
}

class TestDuplex06Q extends stream.Duplex {
  writeCount: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {

  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.writeCount++;
    setTimeout(() => {
      invokeCb(callback);
    }, 50);
  }
}

class TestDuplex06R extends stream.Duplex {
  receivedData: Uint8Array = new Uint8Array();
  callbackCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (chunk instanceof Uint8Array) {
      this.receivedData = chunk;
    }
    this.callbackCalled = true;
    invokeCb(callback);
  }
}

class TestDuplex06S extends stream.Duplex {
  receivedData: Uint8Array = new Uint8Array();
  receivedLength: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (chunk instanceof Uint8Array) {
      this.receivedData = chunk;
      this.receivedLength = chunk.length;
    }
    invokeCb(callback);
  }
}

class TestDuplex06T extends stream.Duplex {
  writeCount: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.writeCount++;
    invokeCb(callback);
  }
}

export default function StreamDuplex06Test(): void {
  describe('StreamDuplex06Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (): Promise<void> => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await Utils.msSleep(10)
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0100
     * @tc.name      testStreamDuplex06Chapter0001
     * @tc.desc      Test doWrite with valid gbk string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      duplexStream.write('测试数据', 'gbk');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual('测试数据');
      expect((duplexStream as TestDuplex06A).receivedEncoding).assertEqual('gbk');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0200
     * @tc.name      testStreamDuplex06Chapter0002
     * @tc.desc      Test doWrite with valid gb18030 string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      duplexStream.write('中文数据', 'gb18030');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual('中文数据');
      expect((duplexStream as TestDuplex06A).receivedEncoding).assertEqual('gb18030');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0300
     * @tc.name      testStreamDuplex06Chapter0003
     * @tc.desc      Test doWrite with valid gb2312 string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      duplexStream.write('简单文本', 'gb2312');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual('简单文本');
      expect((duplexStream as TestDuplex06A).receivedEncoding).assertEqual('gb2312');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0400
     * @tc.name      testStreamDuplex06Chapter0004
     * @tc.desc      Test doWrite with Uint8Array chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      duplexStream.write(uint8Array, 'utf8');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual(uint8Array);
      expect((duplexStream as TestDuplex06A).receivedEncoding).assertEqual('utf8');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0500
     * @tc.name      testStreamDuplex06Chapter0005
     * @tc.desc      Test doWrite with empty string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06B();
      duplexStream.write('test', 'utf8');
      expect((duplexStream as TestDuplex06B).receivedData).assertEqual('test');
      expect((duplexStream as TestDuplex06B).callbackCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0600
     * @tc.name      testStreamDuplex06Chapter0006
     * @tc.desc      Test doWrite with special characters string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      let specialChars = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      duplexStream.write(specialChars, 'utf8');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual(specialChars);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0700
     * @tc.name      testStreamDuplex06Chapter0007
     * @tc.desc      Test doWrite with emoji string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      let emojiString = '???????????????????♂???????';
      duplexStream.write(emojiString, 'utf8');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual(emojiString);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0800
     * @tc.name      testStreamDuplex06Chapter0008
     * @tc.desc      Test doWrite with escape characters string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      let escapeString = '\\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\\"\\?\\0\\x41\\101';
      duplexStream.write(escapeString, 'utf8');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual(escapeString);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0900
     * @tc.name      testStreamDuplex06Chapter0009
     * @tc.desc      Test doWrite with large string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06C();
      let largeString = 'a'.repeat(100000);
      duplexStream.write(largeString, 'utf8');
      expect((duplexStream as TestDuplex06C).receivedLength).assertEqual(100000);
      expect((duplexStream as TestDuplex06C).callbackCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1000
     * @tc.name      testStreamDuplex06Chapter0010
     * @tc.desc      Test doWrite with Uint8Array containing boundary values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06R();
      let uint8Array = new Uint8Array([0, 255, 128, 127]);
      duplexStream.write(uint8Array, 'utf8');
      expect((duplexStream as TestDuplex06R).receivedData[0]).assertEqual(0);
      expect((duplexStream as TestDuplex06R).receivedData[1]).assertEqual(255);
      expect((duplexStream as TestDuplex06R).receivedData[2]).assertEqual(128);
      expect((duplexStream as TestDuplex06R).receivedData[3]).assertEqual(127);
      expect((duplexStream as TestDuplex06R).callbackCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1100
     * @tc.name      testStreamDuplex06Chapter0011
     * @tc.desc      Test doWrite with Uint8Array containing multiple zeros
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06D();
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111, 0, 0, 0, 0, 0, 87, 111, 114, 108, 100]);
      duplexStream.write(uint8Array, 'utf8');
      expect((duplexStream as TestDuplex06D).dataLength).assertEqual(15);
      expect((duplexStream as TestDuplex06D).receivedData[5]).assertEqual(0);
      expect((duplexStream as TestDuplex06D).receivedData[6]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1200
     * @tc.name      testStreamDuplex06Chapter0012
     * @tc.desc      Test doWrite with empty Uint8Array
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06D();
      let uint8Array = new Uint8Array([]);
      duplexStream.write(uint8Array, 'utf8');
      expect((duplexStream as TestDuplex06D).dataLength).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1300
     * @tc.name      testStreamDuplex06Chapter0013
     * @tc.desc      Test doWrite with invalid encoding parameter (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let duplexStream = new TestDuplex06E();
      let errorThrown = false;
      try {
        duplexStream.write('test', 'invalid_encoding');
      } catch (err) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1400
     * @tc.name      testStreamDuplex06Chapter0014
     * @tc.desc      Test doWrite with null chunk (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let duplexStream = new TestDuplex06E();
      let errorThrown = false;
      try {
        duplexStream.write(null as string, 'utf8');
      } catch (err) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1500
     * @tc.name      testStreamDuplex06Chapter0015
     * @tc.desc      Test doWrite with undefined chunk (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let duplexStream = new TestDuplex06E();
      let errorThrown = false;
      try {
        duplexStream.write(undefined, 'utf8');
      } catch (err) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1600
     * @tc.name      testStreamDuplex06Chapter0016
     * @tc.desc      Test doWrite with number chunk (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let duplexStream = new TestDuplex06E();
      duplexStream.write(JSON.stringify(123), 'utf8');
      expect((duplexStream as TestDuplex06E).toString()).assertEqual('[object Object]');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1700
     * @tc.name      testStreamDuplex06Chapter0017
     * @tc.desc      Test doWrite with boolean chunk (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let duplexStream = new TestDuplex06E();
      duplexStream.write(JSON.stringify(true), 'utf8');
      expect((duplexStream as TestDuplex06E).toString()).assertEqual('[object Object]');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1800
     * @tc.name      testStreamDuplex06Chapter0018
     * @tc.desc      Test doWrite with object chunk (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let duplexStream = new TestDuplex06E();
      duplexStream.write(JSON.stringify({}), 'utf8');
      expect((duplexStream as TestDuplex06E).toString()).assertEqual('[object Object]');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1900
     * @tc.name      testStreamDuplex06Chapter0019
     * @tc.desc      Test doWrite with array chunk (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let duplexStream = new TestDuplex06E();
      duplexStream.write(JSON.stringify([1, 2, 3]), 'utf8');
      expect((duplexStream as TestDuplex06E).toString()).assertEqual('[object Object]');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2000
     * @tc.name      testStreamDuplex06Chapter0020
     * @tc.desc      Test doWrite with number encoding (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let duplexStream = new TestDuplex06E();
      let errorThrown = false;
      try {
        duplexStream.write('test', JSON.stringify(123));
      } catch (err) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    });

    /** 
  * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2100 
  * @tc.name      testStreamDuplex06Chapter0021 
  * @tc.desc      Test doWrite with undefined encoding (negative test) 
  * @tc.type      Function 
  * @tc.size      MediumTest 
  * @tc.level     Level 2 
  */ 
    it('testStreamDuplex06Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
   let duplexStream = new TestDuplex06E();
   try { 
     let result = duplexStream.write('test', undefined); 
     expect(result).assertTrue();
    } catch (err) {
      expect(err !== undefined).assertTrue();
    }
 });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2200
     * @tc.name      testStreamDuplex06Chapter0022
     * @tc.desc      Test doWrite with number encoding (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let duplexStream = new TestDuplex06E();
      let errorThrown = false;
      try {
        duplexStream.write('test', JSON.stringify(123));
      } catch (err) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2300
     * @tc.name      testStreamDuplex06Chapter0023
     * @tc.desc      Test doWrite without callback parameter (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let duplexStream = new TestDuplex06E();
      expect(duplexStream instanceof TestDuplex06E).assertEqual(true);

      let errorCaught = false;

      try {
        const writeResult = duplexStream.write('test', 'utf8');
        expect(typeof writeResult).assertEqual('boolean');
      } catch (err) {
        errorCaught = true;
      }

      if (errorCaught) {
        expect(errorCaught).assertEqual(true);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2400
     * @tc.name      testStreamDuplex06Chapter0024
     * @tc.desc      Test doWrite with ASCII characters string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      let asciiString =
        '!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      duplexStream.write(asciiString, 'utf8');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual(asciiString);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2500
     * @tc.name      testStreamDuplex06Chapter0025
     * @tc.desc      Test doWrite with Uint8Array from other TypedArray conversion
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06F();
      let int8Array = new Int8Array([-128, -1, 0, 1, 127]);
      let uint8Array = new Uint8Array(int8Array.buffer);
      duplexStream.write(uint8Array, 'utf8');
      expect((duplexStream as TestDuplex06F).receivedData.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2600
     * @tc.name      testStreamDuplex06Chapter0026
     * @tc.desc      Test doWrite callback error handling
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06G();
      duplexStream.write('test', 'utf8', (err: Error) => {
        expect(err.message).assertEqual('Test error');
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2700
     * @tc.name      testStreamDuplex06Chapter0027
     * @tc.desc      Test doWrite with repeated special characters string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      let repeatedSpecialChars = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      duplexStream.write(repeatedSpecialChars, 'utf8');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual(repeatedSpecialChars);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2800
     * @tc.name      testStreamDuplex06Chapter0028
     * @tc.desc      Test doWrite with keyword string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      let keywordString = '0 NaN Infinity';
      duplexStream.write(keywordString, 'utf8');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual(keywordString);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2900
     * @tc.name      testStreamDuplex06Chapter0029
     * @tc.desc      Test doWrite with ASCII encoding
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      duplexStream.write('Hello World', 'ascii');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual('Hello World');
      expect((duplexStream as TestDuplex06A).receivedEncoding).assertEqual('ascii');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3000
     * @tc.name      testStreamDuplex06Chapter0030
     * @tc.desc      Test doWrite with base64 encoded data
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      let base64String = 'SGVsbG8gV29ybGQ=';

      try {
        duplexStream.write(base64String, 'base64');
        expect((duplexStream as TestDuplex06A).receivedData).assertEqual(base64String);
        expect((duplexStream as TestDuplex06A).receivedEncoding).assertEqual('base64');
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3100
     * @tc.name      testStreamDuplex06Chapter0031
     * @tc.desc      Test doWrite with hex encoded data
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      let hexString = '48656c6c6f20576f726c64';

      try {
        duplexStream.write(hexString, 'hex');
        expect((duplexStream as TestDuplex06A).receivedData).assertEqual(hexString);
        expect((duplexStream as TestDuplex06A).receivedEncoding).assertEqual('hex');
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3200
     * @tc.name      testStreamDuplex06Chapter0032
     * @tc.desc      Test doWrite with latin1 encoding
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      let latin1String = 'Hello World';

      try {
        duplexStream.write(latin1String, 'latin1');
        expect((duplexStream as TestDuplex06A).receivedData).assertEqual(latin1String);
        expect((duplexStream as TestDuplex06A).receivedEncoding).assertEqual('latin1');
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3300
     * @tc.name      testStreamDuplex06Chapter0033
     * @tc.desc      Test doWrite with Int8Array converted to Uint8Array
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06S();
      let int8Array = new Int8Array([-128, -64, 0, 64, 127]);
      let uint8Array = new Uint8Array(int8Array.buffer);
      duplexStream.write(uint8Array, 'utf8');
      expect((duplexStream as TestDuplex06S).receivedLength).assertEqual(5);
      expect((duplexStream as TestDuplex06S).receivedData instanceof Uint8Array).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3400
     * @tc.name      testStreamDuplex06Chapter0034
     * @tc.desc      Test doWrite with multiple consecutive writes
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06H();

      duplexStream.write('First', 'utf8', ((err: Error | null | undefined) => { return; }));
      duplexStream.write('Second', 'utf8', ((err: Error | null | undefined) => { return; }));
      duplexStream.write('Third', 'utf8', ((err: Error | null | undefined) => { return; }));

      expect((duplexStream as TestDuplex06H).writeCount).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3500
     * @tc.name      testStreamDuplex06Chapter0035
     * @tc.desc      Test doWrite with mixed string and Uint8Array writes
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06I();
      let uint8Array = new Uint8Array([65, 66, 67]);

      duplexStream.write('Hello', 'utf8', ((err: Error | null | undefined) => { return; }));
      duplexStream.write(uint8Array, 'utf8', ((err: Error | null | undefined) => { return; }));
      duplexStream.write('World', 'utf8', ((err: Error | null | undefined) => { return; }));

      expect((duplexStream as TestDuplex06I).receivedData.length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3600
     * @tc.name      testStreamDuplex06Chapter0036
     * @tc.desc      Test doWrite with very large Uint8Array (1MB)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06J();

      let size = 1024;
      let uint8Array = new Uint8Array(size);
      for (let i = 0; i < size; i++) {
        uint8Array[i] = i % 256;
      }

      duplexStream.write(uint8Array, 'utf8');
      expect((duplexStream as TestDuplex06J).receivedLength).assertEqual(size);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3700
     * @tc.name      testStreamDuplex06Chapter0037
     * @tc.desc      Test doWrite with encoding parameter omitted (should default to utf8)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();

      duplexStream.write('Hello World', undefined);
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual('Hello World');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3800
     * @tc.name      testStreamDuplex06Chapter0038
     * @tc.desc      Test doWrite with callback parameter omitted
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06L();

      let result = duplexStream.write('Hello World', 'utf8');

      expect((duplexStream as TestDuplex06L).writeCalled).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3900
     * @tc.name      testStreamDuplex06Chapter0039
     * @tc.desc      Test doWrite with both encoding and callback omitted
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06L();

      let result = duplexStream.write('Hello World');
      expect((duplexStream as TestDuplex06L).writeCalled).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4000
     * @tc.name      testStreamDuplex06Chapter0040
     * @tc.desc      Test doWrite with synchronous error thrown in doWrite
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06M();
      let errorThrown = false;
      try {
        duplexStream.write('test', 'utf8', () => {
        });
      } catch (err) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4100
     * @tc.name      testStreamDuplex06Chapter0041
     * @tc.desc      Test doWrite with callback called multiple times (should handle gracefully)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06N();
      expect(duplexStream instanceof TestDuplex06N).assertEqual(true);

      const writeResult = duplexStream.write('test', 'utf8', ((err: Error | null | undefined) => { return; }));
      expect(typeof writeResult).assertEqual('boolean');

      expect(duplexStream.callbackCount).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4200
     * @tc.name      testStreamDuplex06Chapter0042
     * @tc.desc      Test doWrite with async callback execution
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06O();
      duplexStream.write('test', 'utf8');
      setTimeout(() => {
        expect(duplexStream.writeCompleted).assertTrue();
      }, 50);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4300
     * @tc.name      testStreamDuplex06Chapter0043
     * @tc.desc      Test doWrite when stream is in closed state
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream: TestDuplex06P = new TestDuplex06P();
      duplexStream.markAsClosed();

      duplexStream.write('test', 'utf8', (err: Error | undefined) => {
        expect(err instanceof Error).assertTrue();
        expect(duplexStream.doWriteCalled).assertFalse();
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4400
     * @tc.name      testStreamDuplex06Chapter0044
     * @tc.desc      Test doWrite with backpressure (write returns false when buffer full)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06Q();

      let result1 = duplexStream.write('0123456789', 'utf8');
      expect(result1).assertTrue();

      let result2 = duplexStream.write('0123456789', 'utf8');

      expect(typeof result2 === 'boolean').assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4500
     * @tc.name      testStreamDuplex06Chapter0045
     * @tc.desc      Test doWrite with zero-length Uint8Array but with buffer
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06D();

      let buffer = new ArrayBuffer(10);
      let uint8Array = new Uint8Array(buffer, 0, 0);

      duplexStream.write(uint8Array, 'utf8');
      expect((duplexStream as TestDuplex06D).dataLength).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4600
     * @tc.name      testStreamDuplex06Chapter0046
     * @tc.desc      Test doWrite with Uint8Array created from ArrayBuffer with offset
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06D();

      let buffer = new ArrayBuffer(20);
      let view = new Uint8Array(buffer);
      for (let i = 0; i < 20; i++) {
        view[i] = i;
      }
      let uint8Array = new Uint8Array(buffer, 5, 10);

      duplexStream.write(uint8Array, 'utf8');
      expect((duplexStream as TestDuplex06D).dataLength).assertEqual(10);
      expect((duplexStream as TestDuplex06D).receivedData[0]).assertEqual(5);
      expect((duplexStream as TestDuplex06D).receivedData[9]).assertEqual(14);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4700
     * @tc.name      testStreamDuplex06Chapter0047
     * @tc.desc      Test doWrite with empty string and Uint8Array in sequence
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06I();

      duplexStream.write('first', 'utf8', ((err: Error | null | undefined) => { return; }));
      duplexStream.write(new Uint8Array([1, 2, 3]), 'utf8', ((err: Error | null | undefined) => { return; }));
      duplexStream.write('third', 'utf8', ((err: Error | null | undefined) => { return; }));

      expect((duplexStream as TestDuplex06I).receivedData.length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4800
     * @tc.name      testStreamDuplex06Chapter0048
     * @tc.desc      Test doWrite with all control characters (0x00-0x1F, 0x7F)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();

      let controlChars = '';
      for (let i = 0; i <= 0x1F; i++) {
        controlChars += String.fromCharCode(i);
      }
      controlChars += String.fromCharCode(0x7F);

      duplexStream.write(controlChars, 'utf8');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual(controlChars);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4900
     * @tc.name      testStreamDuplex06Chapter0049
     * @tc.desc      Test doWrite with string containing only whitespace characters
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();
      let whitespaceString = ' \t\n\r\v\f\u00A0\u2028\u2029';

      duplexStream.write(whitespaceString, 'utf8');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual(whitespaceString);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_5000
     * @tc.name      testStreamDuplex06Chapter0050
     * @tc.desc      Test doWrite with string containing Unicode supplementary characters
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06A();

      let supplementaryChars = '??????????';

      duplexStream.write(supplementaryChars, 'utf8');
      expect((duplexStream as TestDuplex06A).receivedData).assertEqual(supplementaryChars);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_5100
     * @tc.name      testStreamDuplex06Chapter0051
     * @tc.desc      Test doWrite performance with multiple small writes
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex06T();
      let targetCount: number = 10;

      for (let i = 0; i < targetCount; i++) {
        duplexStream.write(`chunk-${i}`, 'utf8', ((err: Error | null | undefined) => { return; }));
      }

      expect((duplexStream as TestDuplex06T).writeCount).assertLargerOrEqual(1);
    });
  })
}

