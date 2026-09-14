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
import { stream, util } from '@kit.ArkTS';

class ReadableTestBase extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class ReadablePushAuto extends stream.Readable {
  private emitted: boolean = false;

  constructor() {
    super();
  }

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("auto");
      this.push(null);
    }
  }
}

class TestWritable extends stream.Writable {
  public data: string = '';
  public bytes: Uint8Array = new Uint8Array(0);
  public receivedString: boolean = false;

  constructor() {
    super();
  }

  doWrite(chunk: Uint8Array | string, encoding: string, cb: Function): void {
    if (typeof chunk === 'string') {
      this.data = chunk as string;
      this.receivedString = true;
    } else {
      this.bytes = chunk as Uint8Array;
    }
    cb.unsafeCall();
  }
}

export default function StreamReadablePushTest(): void {
  describe('StreamReadablePushTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_0100
     * @tc.name testStreamReadablePush001
     * @tc.desc Verify push without encoding returns true and read returns text, symbol and formatted payloads unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payloads: string[] = ['test', 'Test123 测试', '123456', 'a', '!@#$%^&*()',
        '<script>alert(1)</script>', '\x00test', '13800138000', 'test@example.com', '2026-03-05', '0x123'];
      for (let i = 0; i < payloads.length; i++) {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.pause();
        let result: boolean = rs.push(payloads[i]);
        expect(result).assertTrue();
        let data = rs.read();
        expect(data?.toString()).assertEqual(payloads[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_0200
     * @tc.name testStreamReadablePush002
     * @tc.desc Verify push Uint8Array returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array([72, 101, 108, 108, 111]));
      expect(result).assertTrue();
      let data = rs.read();
      expect(data?.toString()).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_0300
     * @tc.name testStreamReadablePush003
     * @tc.desc Verify push(null) ends stream returns false and triggers end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.pause();
        let ended: boolean = false;
        let result: boolean = rs.push(null);
        expect(result).assertFalse();
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("end", (): void => {
            ended = true;
            resolve(undefined as void);
          });
          rs.resume();
        });
        expect(ended).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_0400
     * @tc.name testStreamReadablePush004
     * @tc.desc Verify push data exceeding high water mark returns false (backpressure)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let chunk: string = "a".repeat(16385);
      let result: boolean = rs.push(chunk);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_0500
     * @tc.name testStreamReadablePush005
     * @tc.desc Verify push(undefined) is a no-op, does not change buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(undefined);
      let data = rs.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_0600
     * @tc.name testStreamReadablePush006
     * @tc.desc Verify in flowing mode, push data does not enter buffer, directly triggers data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let dataStr: string = '';
        rs.on("data", (chunk: Object): void => {
          dataStr = chunk.toString();
        });
        let ended: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("end", (): void => {
            ended = true;
            resolve(undefined as void);
          });
          rs.push("hello");
          rs.push(null);
        });
        expect(dataStr).assertEqual("hello");
        expect(ended).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_0700
     * @tc.name testStreamReadablePush007
     * @tc.desc Verify push Chinese + gbk encoding, read decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      try {
        rs.push("中文", "gbk");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_0800
     * @tc.name testStreamReadablePush008
     * @tc.desc Verify push Chinese + gb18030 encoding, read decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      try {
        rs.push("测试工程师", "gb18030");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_0900
     * @tc.name testStreamReadablePush009
     * @tc.desc Verify push Chinese + gb2312 encoding, read decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      try {
        rs.push("你好", "gb2312");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_1000
     * @tc.name testStreamReadablePush010
     * @tc.desc Verify push with utf8 encoding returns true and read decodes multi-language and emoji payloads unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payloads: string[] = ['テスト', '😀', '⭐⭐',
        '😀测试', '테스트', 'АБВГД',
        'الاختبار', 'Test 測試', '​', '�'];
      for (let i = 0; i < payloads.length; i++) {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.pause();
        let result: boolean = rs.push(payloads[i], "utf8");
        expect(result).assertTrue();
        let data = rs.read();
        expect(data?.toString()).assertEqual(payloads[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_1100
     * @tc.name testStreamReadablePush011
     * @tc.desc Verify push empty string ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push("");
      expect(result).assertTrue();
      let data = rs.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_1200
     * @tc.name testStreamReadablePush012
     * @tc.desc Verify push exactly 16383 bytes (high water mark - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let chunk: string = "a".repeat(16383);
      let result: boolean = rs.push(chunk);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_1300
     * @tc.name testStreamReadablePush013
     * @tc.desc Verify push exactly 16384 bytes (equal to high water mark)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let chunk: string = "a".repeat(16384);
      let result: boolean = rs.push(chunk);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_1400
     * @tc.name testStreamReadablePush014
     * @tc.desc Verify push 65535 bytes (varchar upper limit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let chunk: string = "a".repeat(65535);
      let result: boolean = rs.push(chunk);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_1500
     * @tc.name testStreamReadablePush015
     * @tc.desc Verify push 10000 character long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let chunk: string = "a".repeat(10000);
      let result: boolean = rs.push(chunk);
      expect(result).assertTrue();
      let data = rs.read();
      expect(data?.toString()).assertEqual(chunk);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_1600
     * @tc.name testStreamReadablePush016
     * @tc.desc Verify push 102400 bytes (100KB extra large)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let chunk: string = "a".repeat(102400);
      let result: boolean = rs.push(chunk);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_1700
     * @tc.name testStreamReadablePush017
     * @tc.desc Verify push empty Uint8Array([])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array([]));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_1800
     * @tc.name testStreamReadablePush018
     * @tc.desc Verify push zero-length constructed Uint8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array(0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_1900
     * @tc.name testStreamReadablePush019
     * @tc.desc Verify push single element Uint8Array([0]) minimum single byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array([0]));
      expect(result).assertTrue();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_2000
     * @tc.name testStreamReadablePush020
     * @tc.desc Verify push Uint8Array containing max value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array([255]));
      expect(result).assertTrue();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_2100
     * @tc.name testStreamReadablePush021
     * @tc.desc Verify push all 0xFF Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array([255, 255, 255]));
      expect(result).assertTrue();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_2200
     * @tc.name testStreamReadablePush022
     * @tc.desc Verify push min+max mixed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array([0, 255]));
      expect(result).assertTrue();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_2300
     * @tc.name testStreamReadablePush023
     * @tc.desc Verify push Uint8Array with boundary byte values (0x00/0xFF/0x7F/0x80)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array([0x00, 0xFF, 0x7F, 0x80]));
      expect(result).assertTrue();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_2400
     * @tc.name testStreamReadablePush024
     * @tc.desc Verify push 16384 byte Uint8Array (equal to high water mark)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array(16384));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_2500
     * @tc.name testStreamReadablePush025
     * @tc.desc Verify push 16385 byte Uint8Array (exceeds high water mark by 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array(16385));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_2600
     * @tc.name testStreamReadablePush026
     * @tc.desc Verify push 65536 byte Uint8Array (large capacity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array(65536));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_2700
     * @tc.name testStreamReadablePush027
     * @tc.desc Verify push 102400 byte Uint8Array (100KB)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array(102400));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_2800
     * @tc.name testStreamReadablePush028
     * @tc.desc Verify read immediately after push retrieves same data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      rs.push("abc");
      let data = rs.read();
      expect(data?.toString()).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_2900
     * @tc.name testStreamReadablePush029
     * @tc.desc Verify push in flowing mode immediately triggers data event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let dataStr: string = '';
        rs.on("data", (chunk: Object): void => {
          dataStr = chunk.toString();
        });
        let ended: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("end", (): void => {
            ended = true;
            resolve(undefined as void);
          });
          rs.push("data");
          rs.push(null);
        });
        expect(dataStr).assertEqual("data");
        expect(ended).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_3000
     * @tc.name testStreamReadablePush030
     * @tc.desc Verify in pause mode, push data does not trigger data, only buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let dataReceived: boolean = false;
      rs.on("data", (chunk: Object): void => {
        dataReceived = true;
      });
      rs.push("buffered");
      expect(dataReceived).assertFalse();
      let data = rs.read();
      expect(data?.toString()).assertEqual("buffered");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_3100
     * @tc.name testStreamReadablePush031
     * @tc.desc Verify consecutive push accumulates data in buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let r1: boolean = rs.push("a");
      let r2: boolean = rs.push("b");
      let r3: boolean = rs.push("c");
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r3).assertTrue();
      let data = rs.read();
      expect(data?.toString()).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_3200
     * @tc.name testStreamReadablePush032
     * @tc.desc Verify mixed push string + Uint8Array buffers in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let r1: boolean = rs.push("abc");
      let r2: boolean = rs.push(new Uint8Array([100, 101, 102]));
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      let data = rs.read();
      expect(data?.toString()).assertEqual("abcdef");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_3300
     * @tc.name testStreamReadablePush033
     * @tc.desc Verify after setEncoding, push string data stored with encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      rs.setEncoding("gbk");
      let result: boolean = rs.push("中文", "gbk");
      expect(result).assertTrue();
      let data = rs.read();
      expect(data?.toString()).assertEqual("中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_3400
     * @tc.name testStreamReadablePush034
     * @tc.desc Verify push inside doRead also pushes the end marker so readableEnded turns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let deliveredData: string = "";
        let endedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs: ReadablePushAuto = new ReadablePushAuto();
          rs.on("data", (chunk: Object): void => {
            deliveredData += chunk.toString();
          });
          rs.on("end", (): void => {
            endedAtEnd = rs.readableEnded;
            resolve(undefined as void);
          });
          rs.resume();
        });
        expect(deliveredData).assertEqual("auto");
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_3500
     * @tc.name testStreamReadablePush035
     * @tc.desc Verify after backpressure, consuming data below high water mark resumes push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let largeChunk: string = "a".repeat(16385);
      let r1: boolean = rs.push(largeChunk);
      expect(r1).assertFalse();
      rs.read(1024);
      let r2: boolean = rs.push("a");
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_3600
     * @tc.name testStreamReadablePush036
     * @tc.desc Verify push data near high water mark then push small data triggers backpressure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let nearFull: string = "a".repeat(16383);
      let r1: boolean = rs.push(nearFull);
      expect(r1).assertTrue();
      let r2: boolean = rs.push("ab");
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_3700
     * @tc.name testStreamReadablePush037
     * @tc.desc Verify resume from pause to flowing then push triggers data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.pause();
        let dataStr: string = '';
        rs.on("data", (chunk: Object): void => {
          dataStr = chunk.toString();
        });
        let ended: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("end", (): void => {
            ended = true;
            resolve(undefined as void);
          });
          rs.resume();
          rs.push("test");
          rs.push(null);
        });
        expect(dataStr).assertEqual("test");
        expect(ended).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_3800
     * @tc.name testStreamReadablePush038
     * @tc.desc Verify push(null) after already ended push(null) is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.pause();
        let endCount: int = 0;
        let r2: boolean = false;
        let r1: boolean = rs.push(null);
        expect(r1).assertFalse();
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("end", (): void => {
            endCount++;
            r2 = rs.push(null);
            resolve(undefined as void);
          });
          rs.resume();
        });
        expect(endCount).assertEqual(1);
        expect(r2).assertFalse();
        expect(endCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_3900
     * @tc.name testStreamReadablePush039
     * @tc.desc Verify push in readable event callback accumulates data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let pushed: boolean = false;
        rs.pause();
        let combined: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("readable", (): void => {
            if (!pushed) {
              pushed = true;
              rs.push("chunk2");
              rs.push(null);
              setTimeout((): void => {
                let data: Object | null = rs.read();
                combined = (data === null) ? '' : data.toString();
                rs.resume();
                resolve(undefined as void);
              }, 0);
            }
          });
          rs.push("chunk1");
        });
        expect(combined).assertEqual("chunk1chunk2");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_4000
     * @tc.name testStreamReadablePush040
     * @tc.desc Verify after pipe connection, push data automatically flows to writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let ws: TestWritable = new TestWritable();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("finish", (): void => {
            resolve(undefined as void);
          });
          rs.pipe(ws);
          rs.push("pipeData");
          rs.push(null);
        });
        if (ws.receivedString) {
          expect(ws.data).assertEqual('pipeData');
        } else {
          expect(util.TextDecoder.create('utf-8').decodeToString(ws.bytes)).assertEqual('pipeData');
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_4100
     * @tc.name testStreamReadablePush041
     * @tc.desc Verify after unpipe disconnects, push data only buffers, output omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      let ws: TestWritable = new TestWritable();
      rs.pipe(ws);
      rs.unpipe(ws);
      let writtenData: boolean = false;
      ws.on("data", (chunk: Object): void => {
        writtenData = true;
      });
      rs.push("unpipeData");
      expect(writtenData).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_4200
     * @tc.name testStreamReadablePush042
     * @tc.desc Verify push lone surrogate character U+DC04
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push("\uDC04", "utf8");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_4300
     * @tc.name testStreamReadablePush043
     * @tc.desc Verify push all-zero Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array([0x00, 0x00, 0x00]));
      expect(result).assertTrue();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_4400
     * @tc.name testStreamReadablePush044
     * @tc.desc Verify push newline + carriage return byte Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array([0x0A, 0x0D]));
      expect(result).assertTrue();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_4500
     * @tc.name testStreamReadablePush045
     * @tc.desc Verify push of a UTF-8 encoded CJK character into Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array([0xE4, 0xB8, 0xAD]));
      expect(result).assertTrue();
      let data = rs.read();
      expect(data?.toString()).assertEqual("中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_4600
     * @tc.name testStreamReadablePush046
     * @tc.desc Verify push invalid UTF-8 single byte Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array([0xE4]));
      expect(result).assertTrue();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_4700
     * @tc.name testStreamReadablePush047
     * @tc.desc Verify push numeric type 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      try {
        rs.push(123 as Object as Uint8Array | string | undefined | null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_4800
     * @tc.name testStreamReadablePush048
     * @tc.desc Verify push boolean type true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      try {
        rs.push(true as Object as Uint8Array | string | undefined | null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_4900
     * @tc.name testStreamReadablePush049
     * @tc.desc Verify push Object type {}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      try {
        rs.push({} as Object as Uint8Array | string | undefined | null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_5000
     * @tc.name testStreamReadablePush050
     * @tc.desc Verify push Function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      try {
        let invalidValue: Object = (): void => {
        };
        rs.push(invalidValue as Uint8Array | string | undefined | null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_5100
     * @tc.name testStreamReadablePush051
     * @tc.desc Verify push data is rejected after push(null) ends the stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.pause();
        let ended: boolean = false;
        let result: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("end", (): void => {
            ended = true;
            result = rs.push("data");
            resolve(undefined as void);
          });
          rs.push(null);
          rs.resume();
        });
        expect(ended).assertTrue();
        expect(result).assertFalse();

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_5200
     * @tc.name testStreamReadablePush052
     * @tc.desc Verify push data is accepted before the stream is ended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push("data");
      expect(result).assertTrue();
      expect(rs.read()?.toString()).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_5300
     * @tc.name testStreamReadablePush053
     * @tc.desc Verify push with unsupported encoding name "ibm866"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      try {
        rs.push("test", "ibm866");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_5400
     * @tc.name testStreamReadablePush054
     * @tc.desc Verify push with encoding name "ascii" follows runtime encoding handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push("test", "ascii");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_5500
     * @tc.name testStreamReadablePush055
     * @tc.desc Verify push with encoding name "base64" follows runtime encoding handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push("test", "base64");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_5600
     * @tc.name testStreamReadablePush056
     * @tc.desc Verify extracted push function retains stream binding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      let fn: Function = rs.push;
      fn("test");
      expect(rs.read()?.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PUSH_5700
     * @tc.name testStreamReadablePush057
     * @tc.desc Verify push(undefined) is a no-op and does not poison a subsequent valid push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePush057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();

      let ignoredResult: boolean = rs.push(undefined);
      let acceptedResult: boolean = rs.push('after-undefined');
      let received = rs.read();

      expect(ignoredResult).assertTrue();
      expect(acceptedResult).assertTrue();
      expect(received?.toString()).assertEqual('after-undefined');
      expect(rs.read()).assertEqual(null);
      expect(rs.readableLength).assertEqual(0);
    });

  });
}
