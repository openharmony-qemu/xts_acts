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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import stream from '@ohos.util.stream';
import Utils from '../Util.test';

function invokeCb(cb: Function): void {
  try { (cb as (error?: Error | null) => void)(); } catch (e) {}
}
function invokeCbErr(cb: Function, err: Error | null): void {
  try { (cb as (e?: Error | null) => void)(err); } catch (e) {}
}

interface GeneratedTypeLiteralInterface_1 {
  code?: number;
}


class TestDuplex_01 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    invokeCb(callback);
  }
}

class TestDuplex_02 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("");
    expect(encoding).assertEqual("utf8");
    invokeCb(callback);
  }
}

class TestDuplex_03 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("test");
    expect(encoding).assertEqual("utf-8");
    invokeCb(callback);
  }
}

class TestDuplex_04 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("test");
    expect(encoding).assertEqual("utf8");
    invokeCb(callback);
  }
}

class TestDuplex_05 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("test");
    expect(encoding).assertEqual("gb18030");
    invokeCb(callback);
  }
}

class TestDuplex_06 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("test");
    expect(encoding).assertEqual("gbk");
    invokeCb(callback);
  }
}

class TestDuplex_07 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("test");
    expect(encoding).assertEqual("gb2312");
    invokeCb(callback);
  }
}

class TestDuplex_08 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("test");
    expect(encoding).assertEqual("utf8");
    invokeCb(callback);
  }
}

class TestDuplex_09 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk instanceof Uint8Array).assertTrue();
    expect((chunk as Uint8Array)[0]).assertEqual(72);
    expect(encoding).assertEqual("utf-8");
    invokeCb(callback);
  }
}

class TestDuplex_10 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk instanceof Uint8Array).assertTrue();
    const arr: Uint8Array = chunk as Uint8Array;
    expect(arr.length).assertEqual(15);
    expect(arr[5]).assertEqual(0);
    expect(arr[6]).assertEqual(0);
    invokeCb(callback);
  }
}

class TestDuplex_11 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk instanceof Uint8Array).assertTrue();
    expect(encoding).assertEqual("gbk");
    invokeCb(callback);
  }
}

class TestDuplex_12 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk instanceof Uint8Array).assertTrue();
    invokeCb(callback);
  }
}

class TestDuplex_13 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
    invokeCb(callback);
  }
}

class TestDuplex_14 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk)
      .assertEqual("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
    invokeCb(callback);
  }
}

class TestDuplex_15 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("\x07\x08\x0C\x0A\x0D\x09\x0B\x5C\x27\x22\x3F\x00\x77\x78");
    invokeCb(callback);
  }
}

class TestDuplex_16 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("???????????????????♂???????");
    invokeCb(callback);
  }
}

class TestDuplex_17 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk.length).assertEqual(1000);
    invokeCb(callback);
  }
}

class TestDuplex_18 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk instanceof Uint8Array).assertTrue();
    const arr: Uint8Array = chunk as Uint8Array;
    expect(arr[0]).assertEqual(0);
    expect(arr[1]).assertEqual(255);
    invokeCb(callback);
  }
}

class TestDuplex_19 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk instanceof Uint8Array).assertTrue();
    const arr: Uint8Array = chunk as Uint8Array;
    expect(arr[0]).assertEqual(0);
    expect(arr[1]).assertEqual(255);
    invokeCb(callback);
  }
}

class TestDuplex_20 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk instanceof Uint8Array).assertTrue();
    const arr: Uint8Array = chunk as Uint8Array;
    expect(arr[0]).assertEqual(0);
    expect(arr[1]).assertEqual(0);
    expect(arr[2]).assertEqual(0);
    invokeCb(callback);
  }
}

class TestDuplex_21 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("test");
    invokeCb(callback);
  }
}

class TestDuplex_22 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    invokeCb(callback);
  }
}

class TestDuplex_23 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    throw new Error("doWrite error");
  }
}

class TestDuplex_24 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk instanceof Uint8Array).assertTrue();
    invokeCb(callback);
  }
}

class TestDuplex_25 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk instanceof Uint8Array).assertTrue();
    expect((chunk as Uint8Array).length).assertEqual(0);
    invokeCb(callback);
  }
}

class TestDuplex_26 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("0");
    invokeCb(callback);
  }
}

class TestDuplex_27 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk).assertEqual("!!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
    invokeCb(callback);
  }
}

class TestDuplex_28 extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(chunk instanceof Uint8Array).assertTrue();
    const arr: Uint8Array = chunk as Uint8Array;
    expect(arr.length).assertEqual(4);
    invokeCb(callback);
  }
}

export default function StreamDuplex02Test(): void {
  describe('StreamDuplex02Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0100
     * @tc.name      testStreamDuplex02Chapter0001
     * @tc.desc      Test end with no arguments returns Writable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_01 = new TestDuplex_01();
      const result: stream.Writable = duplexStream.end();
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0200
     * @tc.name      testStreamDuplex02Chapter0002
     * @tc.desc      Test end with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_02 = new TestDuplex_02();
      const result: stream.Writable = duplexStream.end("");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0300
     * @tc.name      testStreamDuplex02Chapter0003
     * @tc.desc      Test end with string chunk using default encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_03 = new TestDuplex_03();
      const result: stream.Writable = duplexStream.end("test");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0400
     * @tc.name      testStreamDuplex02Chapter0004
     * @tc.desc      Test end with string chunk and utf8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_04 = new TestDuplex_04();
      const result: stream.Writable = duplexStream.end("test", "utf8");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0500
     * @tc.name      testStreamDuplex02Chapter0005
     * @tc.desc      Test end with string chunk and gb18030 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_05 = new TestDuplex_05();
      const result: stream.Writable = duplexStream.end("test", "gb18030");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0600
     * @tc.name      testStreamDuplex02Chapter0006
     * @tc.desc      Test end with string chunk and gbk encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_06 = new TestDuplex_06();
      const result: stream.Writable = duplexStream.end("test", "gbk");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0700
     * @tc.name      testStreamDuplex02Chapter0007
     * @tc.desc      Test end with string chunk and gb2312 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_07 = new TestDuplex_07();
      const result: stream.Writable = duplexStream.end("test", "gb2312");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0800
     * @tc.name      testStreamDuplex02Chapter0008
     * @tc.desc      Test end with string chunk, encoding and callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_08 = new TestDuplex_08();
      const result: stream.Writable = duplexStream.end("test", "utf8", () => {
      });
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0900
     * @tc.name      testStreamDuplex02Chapter0009
     * @tc.desc      Test end with Uint8Array chunk
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_09 = new TestDuplex_09();
      const uint8Array: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1000
     * @tc.name      testStreamDuplex02Chapter0010
     * @tc.desc      Test end with Uint8Array containing zero-padded elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_10 = new TestDuplex_10();
      const uint8Array: Uint8Array = new Uint8Array([72, 101, 108, 108, 111, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1100
     * @tc.name      testStreamDuplex02Chapter0011
     * @tc.desc      Test end with Uint8Array chunk and gbk encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_11 = new TestDuplex_11();
      const uint8Array: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      const result: stream.Writable = duplexStream.end(uint8Array, "gbk");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1200
     * @tc.name      testStreamDuplex02Chapter0012
     * @tc.desc      Test end with Uint8Array chunk, encoding and callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_12 = new TestDuplex_12();
      const uint8Array: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      const result: stream.Writable = duplexStream.end(uint8Array, "utf8", () => {
      });
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1300
     * @tc.name      testStreamDuplex02Chapter0013
     * @tc.desc      Test end with special characters string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_13 = new TestDuplex_13();
      const result: stream.Writable = duplexStream.end("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1400
     * @tc.name      testStreamDuplex02Chapter0014
     * @tc.desc      Test end with full printable ASCII string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_14 = new TestDuplex_14();
      const asciiString: string =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const result: stream.Writable = duplexStream.end(asciiString);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1500
     * @tc.name      testStreamDuplex02Chapter0015
     * @tc.desc      Test end with escape characters string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_15 = new TestDuplex_15();
      const escapeString: string = "\x07\x08\x0C\x0A\x0D\x09\x0B\x5C\x27\x22\x3F\x00\x77\x78";
      const result: stream.Writable = duplexStream.end(escapeString);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1600
     * @tc.name      testStreamDuplex02Chapter0016
     * @tc.desc      Test end with emoji string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_16 = new TestDuplex_16();
      const emojiString: string = "???????????????????♂???????";
      const result: stream.Writable = duplexStream.end(emojiString);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1700
     * @tc.name      testStreamDuplex02Chapter0017
     * @tc.desc      Test end with large string of 1000 characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_17 = new TestDuplex_17();
      const largeString: string = "a".repeat(1000);
      const result: stream.Writable = duplexStream.end(largeString);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1800
     * @tc.name      testStreamDuplex02Chapter0018
     * @tc.desc      Test end with Uint8Array containing boundary values 0 and 255
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_18 = new TestDuplex_18();
      const uint8Array: Uint8Array = new Uint8Array([0, 255]);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1900
     * @tc.name      testStreamDuplex02Chapter0019
     * @tc.desc      Test end with Uint8ClampedArray converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_19 = new TestDuplex_19();
      const clampedArray: Uint8ClampedArray = new Uint8ClampedArray([-1, 256]);
      const uint8Array: Uint8Array = new Uint8Array(clampedArray);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2000
     * @tc.name      testStreamDuplex02Chapter0020
     * @tc.desc      Test end with Uint8Array from NaN, Infinity and -Infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_20 = new TestDuplex_20();
      const sourceArray: number[] = [NaN, Infinity, -Infinity];
      const uint8Array: Uint8Array = new Uint8Array(sourceArray);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2100
     * @tc.name      testStreamDuplex02Chapter0021
     * @tc.desc      Test end after cork and verify writableCorked resets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_21 = new TestDuplex_21();
      duplexStream.cork();
      const result: stream.Writable = duplexStream.end("test");
      expect(result instanceof stream.Writable).assertTrue();
      expect(duplexStream.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2200
     * @tc.name      testStreamDuplex02Chapter0022
     * @tc.desc      Test end with unsupported encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_22 = new TestDuplex_22();
      try {
        const result: stream.Writable = duplexStream.end("test", "unsupported");
        expect(result instanceof stream.Writable).assertTrue();
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2300
     * @tc.name      testStreamDuplex02Chapter0023
     * @tc.desc      Test end when doWrite throws an error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_23 = new TestDuplex_23();
      let endSucceeded = false;

      try {
        duplexStream.end("test");
        endSucceeded = true;
      } catch (err) {
        expect(err.code).assertEqual(0);
      }

      expect(endSucceeded).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2400
     * @tc.name      testStreamDuplex02Chapter0024
     * @tc.desc      Test end with BigInt64Array converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_24 = new TestDuplex_24();
      const bigIntArray: BigInt64Array = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
      const uint8Array: Uint8Array = new Uint8Array(bigIntArray.buffer);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2500
     * @tc.name      testStreamDuplex02Chapter0025
     * @tc.desc      Test end with empty Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_25 = new TestDuplex_25();
      const uint8Array: Uint8Array = new Uint8Array([]);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2600
     * @tc.name      testStreamDuplex02Chapter0026
     * @tc.desc      Test end with single character string "0"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_26 = new TestDuplex_26();
      const result: stream.Writable = duplexStream.end("0");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2700
     * @tc.name      testStreamDuplex02Chapter0027
     * @tc.desc      Test end with repeated special characters string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_27 = new TestDuplex_27();
      const repeatedSpecial: string = "!!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      const result: stream.Writable = duplexStream.end(repeatedSpecial);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2800
     * @tc.name      testStreamDuplex02Chapter0028
     * @tc.desc      Test end with Uint16Array converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: TestDuplex_28 = new TestDuplex_28();
      const uint16Array: Uint16Array = new Uint16Array([0, 65535]);
      const uint8Array: Uint8Array = new Uint8Array(uint16Array.buffer);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });
  });
}
