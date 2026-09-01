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

class DuplexTestBase extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DuplexPushAuto extends stream.Duplex {
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

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DuplexNoDoRead extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamDuplexReadTest(): void {
  describe('StreamDuplexReadTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_0100
     * @tc.name testStreamDuplexRead001
     * @tc.desc Verify omitted size reads all string data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("test");
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("test");
      expect(ds.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_0200
     * @tc.name testStreamDuplexRead002
     * @tc.desc Verify passing size=1 reads the first byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("abc");
      ds.pause();
      let data = ds.read(1);
      expect(data?.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_0300
     * @tc.name testStreamDuplexRead003
     * @tc.desc Verify passing size exactly equal to buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("data");
      ds.pause();
      let data = ds.read(4);
      expect(data?.toString()).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_0400
     * @tc.name testStreamDuplexRead004
     * @tc.desc Verify reading Uint8Array type buffer data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push(new Uint8Array([72, 101, 108, 108, 111]));
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_0500
     * @tc.name testStreamDuplexRead005
     * @tc.desc Verify read returns null on empty buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      let data = ds.read();
      expect(data).assertEqual(null);
      expect(ds.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_0600
     * @tc.name testStreamDuplexRead006
     * @tc.desc Verify read returns null in flowing mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataStr: string = "";
      await new Promise<void>((resolve: (value: void) => void): void => {
        ds.push("test");
        ds.on("data", (chunk: Object): void => {
          dataStr = chunk.toString();
          resolve(undefined as void);
        });
        ds.push(null);
      });
      expect(dataStr).assertEqual("test");
      let data = ds.read();
      expect(data).assertEqual(null);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_0700
     * @tc.name testStreamDuplexRead007
     * @tc.desc Verify read returns null after push(null) ends the stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push(null);
      let data = ds.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_0800
     * @tc.name testStreamDuplexRead008
     * @tc.desc Verify Uint8Array buffer returns buffer.Buffer type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push(new Uint8Array([116, 101, 115, 116]));
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_0900
     * @tc.name testStreamDuplexRead009
     * @tc.desc Verify read drains gbk decoded data fully and a further read returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("gbk");
      ds.pause();
      ds.push(new Uint8Array([0xD6, 0xD0, 0xCE, 0xC4]));
      let data = ds.read();
      expect(data?.toString()).assertEqual("中文");
      expect(ds.readableLength).assertEqual(0);
      let drained = ds.read();
      expect(drained).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_1000
     * @tc.name testStreamDuplexRead010
     * @tc.desc Verify reading Chinese data under gb18030 encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("gb18030");
      ds.push(new Uint8Array([0xB2, 0xE2, 0xCA, 0xD4]));
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_1100
     * @tc.name testStreamDuplexRead011
     * @tc.desc Verify UTF-8 uppercase encoding variant reading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("UTF-8");
      ds.push("hello");
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_1200
     * @tc.name testStreamDuplexRead012
     * @tc.desc Verify read() returns null for int boundary and very large or small size values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [2147483647, -2147483648, 2147483646, -2147483647, 999999999, -999999999];
      let payloads: string[] = ["hello", "hello", "data", "data", "hello", "hello"];
      for (let i = 0; i < sizes.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.push(payloads[i]);
        ds.pause();
        let data = ds.read(sizes[i]);
        expect(data).assertEqual(null);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_1300
     * @tc.name testStreamDuplexRead013
     * @tc.desc Verify size=1 minimum positive reads single byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("a");
      ds.pause();
      let data = ds.read(1);
      expect(data?.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_1400
     * @tc.name testStreamDuplexRead014
     * @tc.desc Verify size=1024 less than buffered data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let chunk: string = "";
      for (let i: int = 0; i < 2048; i++) {
        chunk += "a";
      }
      ds.push(chunk);
      ds.pause();
      let data = ds.read(1024);
      expect(data?.toString().length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_1500
     * @tc.name testStreamDuplexRead015
     * @tc.desc Verify size=16384 exactly high water mark size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push(new Uint8Array(16384));
      ds.pause();
      let data = ds.read(16384);
      expect(data?.toString().length).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_1600
     * @tc.name testStreamDuplexRead016
     * @tc.desc Verify read() returns null when requested size exceeds buffered data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16385, 65536, 102400];
      let byteLens: int[] = [16384, 0, 1024];
      for (let i = 0; i < sizes.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        if (byteLens[i] == 0) {
          ds.push("hello");
        } else {
          ds.push(new Uint8Array(byteLens[i]));
        }
        ds.pause();
        let data = ds.read(sizes[i]);
        expect(data).assertEqual(null);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_1700
     * @tc.name testStreamDuplexRead017
     * @tc.desc Verify size=INT_MAX with binary input returns no readable chunk in pause mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push(new Uint8Array([116, 101, 115, 116]));
      ds.pause();
      let data = ds.read(2147483647);
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_1800
     * @tc.name testStreamDuplexRead018
     * @tc.desc Verify normal read in pause mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("hello");
      ds.pause();
      expect(ds.isPaused()).assertTrue();
      let data = ds.read();
      expect(data?.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_1900
     * @tc.name testStreamDuplexRead019
     * @tc.desc Verify two consecutive reads: first valid, second null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("abc");
      ds.pause();
      let d1 = ds.read();
      expect(d1?.toString()).assertEqual("abc");
      let d2 = ds.read();
      expect(d2).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_2000
     * @tc.name testStreamDuplexRead020
     * @tc.desc Verify read(2) twice exactly consumes 4-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("abcd");
      ds.pause();
      let d1 = ds.read(2);
      expect(d1?.toString()).assertEqual("ab");
      let d2 = ds.read(2);
      expect(d2?.toString()).assertEqual("cd");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_2100
     * @tc.name testStreamDuplexRead021
     * @tc.desc Verify reading data in readable event callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let readDataStr: string = "";
      await new Promise<void>((resolve: (value: void) => void): void => {
        ds.pause();
        ds.on("readable", (): void => {
          let readData: Object | null = ds.read();
          readDataStr = readData === null ? "" : readData.toString();
          resolve(undefined as void);
        });
        ds.push("test");
      });
      expect(readDataStr).assertEqual("test");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_2200
     * @tc.name testStreamDuplexRead022
     * @tc.desc Verify reading Chinese data correctly decoded after setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("gbk");
      ds.push(new Uint8Array([0xB2, 0xE2, 0xCA, 0xD4, 0xB9, 0xA4, 0xB3, 0xCC, 0xCA, 0xA6]));
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("测试工程师");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_2300
     * @tc.name testStreamDuplexRead023
     * @tc.desc Verify read still retrieves data after resume then pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("data");
      ds.resume();
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_2400
     * @tc.name testStreamDuplexRead024
     * @tc.desc Verify read with specified size leaves exactly 0 remaining in buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("abc");
      ds.pause();
      let data = ds.read(3);
      expect(data?.toString()).assertEqual("abc");
      let remaining = ds.read();
      expect(remaining).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_2500
     * @tc.name testStreamDuplexRead025
     * @tc.desc Verify flowing mode on("data") callback calling read returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let readInCallback: Object | null = null;
      ds.on("data", (chunk: Object): void => {
        readInCallback = ds.read();
      });
      ds.push("test");
      expect(readInCallback).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_2600
     * @tc.name testStreamDuplexRead026
     * @tc.desc Verify read reduces backpressure after push exceeds highWaterMark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      let chunk: string = "";
      for (let i: int = 0; i < 16385; i++) {
        chunk += "a";
      }
      ds.push(chunk);
      for (let i: int = 0; i < 16; i++) {
        let data = ds.read(1024);
        expect(data?.toString().length).assertEqual(1024);
      }
      let r2: boolean = ds.push("a");
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_2700
     * @tc.name testStreamDuplexRead027
     * @tc.desc Verify doRead implementation is automatically called during read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexPushAuto = new DuplexPushAuto();
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("auto");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_2800
     * @tc.name testStreamDuplexRead028
     * @tc.desc Verify reading buffers containing emoji, mixed text, special symbols, XSS string and null character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputs: string[] = ["😀", "⭐⭐", "😀测试", "!@#$%^&*()",
        "<script>alert(1)</script>", "\x00test"];
      for (let i = 0; i < inputs.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.push(inputs[i]);
        ds.pause();
        let data = ds.read();
        expect(data?.toString()).assertEqual(inputs[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_2900
     * @tc.name testStreamDuplexRead029
     * @tc.desc Verify reading buffers containing Japanese, Korean, Russian and Arabic characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputs: string[] = ["テスト", "테스트", "тест", "الاختبار"];
      for (let i = 0; i < inputs.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.push(inputs[i]);
        ds.pause();
        let data = ds.read();
        expect(data?.toString()).assertEqual(inputs[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_3000
     * @tc.name testStreamDuplexRead030
     * @tc.desc Verify reading Chinese text with GBK, GB18030 and GB2312 encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ["GBK", "GB18030", "GB2312"];
      let bytes: Uint8Array[] = [new Uint8Array([0xB2, 0xE2, 0xCA, 0xD4]),
        new Uint8Array([0xD6, 0xD0, 0xCE, 0xC4]), new Uint8Array([0xD6, 0xD0, 0xCE, 0xC4])];
      let expected: string[] = ["测试", "中文", "中文"];
      for (let i = 0; i < encodings.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.setEncoding(encodings[i]);
        ds.push(bytes[i]);
        ds.pause();
        let data = ds.read();
        expect(data?.toString()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_3100
     * @tc.name testStreamDuplexRead031
     * @tc.desc Verify buffer containing phone number string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("13800138000");
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("13800138000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_3200
     * @tc.name testStreamDuplexRead032
     * @tc.desc Verify buffer containing email address string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("test@example.com");
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("test@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_3300
     * @tc.name testStreamDuplexRead033
     * @tc.desc Verify buffer containing zero-width space reading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("a​b");
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("a​b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_3400
     * @tc.name testStreamDuplexRead034
     * @tc.desc Verify read() returns null after stream ended in flowing mode with data and end events
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let useEndEvent: boolean[] = [false, true];
      for (let i = 0; i < useEndEvent.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        let dataStr: string = "";
        let waitEnd: boolean = useEndEvent[i];
        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on("data", (chunk: Object): void => {
            dataStr = chunk.toString();
            if (!waitEnd) {
              resolve(undefined as void);
            }
          });
          ds.on("end", (): void => {
            if (waitEnd) {
              resolve(undefined as void);
            }
          });
          ds.push("test");
          ds.push(null);
        });
        expect(dataStr).assertEqual("test");
        let data = ds.read();
        expect(data).assertEqual(null);
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_3500
     * @tc.name testStreamDuplexRead035
     * @tc.desc Verify reading directly from subclass without doRead and no manual push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexNoDoRead = new DuplexNoDoRead();
      let data = ds.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_3600
     * @tc.name testStreamDuplexRead036
     * @tc.desc Verify read(0) does not consume a buffered chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds = new DuplexTestBase();
      ds.push('zero');
      ds.pause();
      let before = ds.readableLength;
      let zeroData = ds.read(0);
      expect(zeroData).assertEqual(null);
      expect(ds.readableLength).assertEqual(before);
      expect(ds.read()?.toString()).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_3700
     * @tc.name testStreamDuplexRead037
     * @tc.desc Verify read after write keeps both sides independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("read-side");
      ds.pause();
      ds.write("write-side");
      let data = ds.read();
      expect(data?.toString()).assertEqual("read-side");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_3800
     * @tc.name testStreamDuplexRead038
     * @tc.desc Verify write does not pollute the readable buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.write("write-only");
      let data = ds.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_3900
     * @tc.name testStreamDuplexRead039
     * @tc.desc Verify read after write-side end still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.end();
      ds.push("after-end");
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("after-end");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_4000
     * @tc.name testStreamDuplexRead040
     * @tc.desc Verify readable properties are accessible on a Duplex instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      expect(ds.readable).assertTrue();
      expect(ds.readableLength).assertEqual(0);
      expect(ds.readableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_4100
     * @tc.name testStreamDuplexRead041
     * @tc.desc Verify readableLength increases after push and decreases after read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      expect(ds.readableLength).assertEqual(0);
      ds.push("abc");
      expect(ds.readableLength).assertEqual(3);
      ds.read(1);
      expect(ds.readableLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_4200
     * @tc.name testStreamDuplexRead042
     * @tc.desc Verify readableHighWatermark remains 16384 after setting UTF-8 encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("utf8");
      expect(ds.readableHighWatermark).assertEqual(16384);
      expect(ds.readableEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_4300
     * @tc.name testStreamDuplexRead043
     * @tc.desc Verify readableFlowing state transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      expect(ds.readableFlowing).assertEqual(null);
      ds.resume();
      expect(ds.readableFlowing).assertTrue();
      ds.pause();
      expect(ds.readableFlowing).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_4400
     * @tc.name testStreamDuplexRead044
     * @tc.desc Verify readableEncoding changes to gbk after setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("gbk");
      expect(ds.readableEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_4500
     * @tc.name testStreamDuplexRead045
     * @tc.desc Verify readableEncoding persists across two successive read calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("gbk");
      ds.pause();
      ds.push("first");
      let firstData = ds.read();
      expect(firstData?.toString()).assertEqual("first");
      expect(ds.readableEncoding).assertEqual("gbk");
      ds.push("second");
      let secondData = ds.read();
      expect(secondData?.toString()).assertEqual("second");
      expect(ds.readableEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_4600
     * @tc.name testStreamDuplexRead046
     * @tc.desc Verify readableEnded is false initially and true after push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let readableEnded: boolean = false;
      expect(ds.readableEnded).assertFalse();
      await new Promise<void>((resolve: (value: void) => void): void => {
        ds.on("end", (): void => {
          readableEnded = ds.readableEnded;
          resolve(undefined as void);
        });
        ds.resume();
        ds.push(null);
      });
      expect(readableEnded).assertTrue();

      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_READ_4700
     * @tc.name testStreamDuplexRead047
     * @tc.desc Verify read returns a string when encoding is set and a buffer otherwise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexRead047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push(new Uint8Array([0x68, 0x69]));
      ds.pause();
      let raw = ds.read();
      expect(raw?.toString()).assertEqual("hi");
    });
  });
}
