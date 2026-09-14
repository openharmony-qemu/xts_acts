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
import { BusinessError } from '@kit.BasicServicesKit';

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

export default function StreamReadableReadTest(): void {
  describe('StreamReadableReadTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_0100
     * @tc.name testStreamReadableRead001
     * @tc.desc Verify passing size=1 reads the first byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push("abc");
      rs.pause();
      let data = rs.read(1);
      expect(data?.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_0200
     * @tc.name testStreamReadableRead002
     * @tc.desc Verify passing size exactly equal to buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push("data");
      rs.pause();
      let data = rs.read(4);
      expect(data?.toString()).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_0300
     * @tc.name testStreamReadableRead003
     * @tc.desc Verify reading Uint8Array type buffer data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push(new Uint8Array([72, 101, 108, 108, 111]));
      rs.pause();
      let data = rs.read();
      expect(data?.toString()).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_0400
     * @tc.name testStreamReadableRead004
     * @tc.desc Verify read returns null on empty buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let data = rs.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_0500
     * @tc.name testStreamReadableRead005
     * @tc.desc Verify read returns null in flowing mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let chunkStr: string = "";
        let endRead: Object | null = new Object();
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs: ReadableTestBase = new ReadableTestBase();
          rs.push("test");
          rs.on("data", (chunk: Object): void => {
            chunkStr = chunk.toString();
          });
          rs.on("end", (): void => {
            endRead = rs.read();
            resolve(undefined as void);
          });
          rs.push(null);
        });
        expect(chunkStr).assertEqual("test");
        expect(endRead).assertEqual(null);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_0600
     * @tc.name testStreamReadableRead006
     * @tc.desc Verify read returns null after push(null) ends the stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      rs.push(null);
      let data = rs.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_0700
     * @tc.name testStreamReadableRead007
     * @tc.desc Verify Uint8Array buffer returns buffer.Buffer type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push(new Uint8Array([116, 101, 115, 116]));
      rs.pause();
      let data = rs.read();
      expect(data?.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_0800
     * @tc.name testStreamReadableRead008
     * @tc.desc Verify read decodes GBK-family bytes with gbk, GB18030, GB2312 and uppercase GBK encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ['gbk', 'GB18030', 'GB2312', 'GBK'];
      let payloads: Uint8Array[] = [new Uint8Array([0xD6, 0xD0, 0xCE, 0xC4]), new Uint8Array([0xD6, 0xD0, 0xCE, 0xC4]),
        new Uint8Array([0xD6, 0xD0, 0xCE, 0xC4]), new Uint8Array([0xB2, 0xE2, 0xCA, 0xD4])];
      let expected: string[] = ['中文', '中文', '中文', '测试'];
      for (let i = 0; i < encodings.length; i++) {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.setEncoding(encodings[i]);
        rs.push(payloads[i]);
        rs.pause();
        let data = rs.read();
        expect(data?.toString()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_0900
     * @tc.name testStreamReadableRead009
     * @tc.desc Verify reading Chinese data under gb18030 encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.setEncoding("gb18030");
      rs.push(new Uint8Array([0xB2, 0xE2, 0xCA, 0xD4]));
      rs.pause();
      let data = rs.read();
      expect(data?.toString()).assertEqual("测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_1000
     * @tc.name testStreamReadableRead010
     * @tc.desc Verify UTF-8 uppercase encoding variant reading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.setEncoding("UTF-8");
      rs.push("hello");
      rs.pause();
      let data = rs.read();
      expect(data?.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_1100
     * @tc.name testStreamReadableRead011
     * @tc.desc Verify read with negative sizes including INT_MIN boundary values returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [-1, -2147483648, -2147483647, -999999999];
      for (let i = 0; i < sizes.length; i++) {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.push('test');
        rs.pause();
        let data = rs.read(sizes[i]);
        expect(data).assertEqual(null);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_1200
     * @tc.name testStreamReadableRead012
     * @tc.desc Verify read with sizes larger than the buffered data returns null for INT_MAX and other large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [2147483647, 2147483646, 65536, 16383, 999999999];
      for (let i = 0; i < sizes.length; i++) {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.push('hello');
        rs.pause();
        let data = rs.read(sizes[i]);
        expect(data).assertEqual(null);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_1300
     * @tc.name testStreamReadableRead013
     * @tc.desc Verify size=1 minimum positive reads single byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push("a");
      rs.pause();
      let data = rs.read(1);
      expect(data?.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_1400
     * @tc.name testStreamReadableRead014
     * @tc.desc Verify size=1024 less than buffered data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      let chunk: string = "";
      for (let i: int = 0; i < 2048; i++) {
        chunk += "a";
      }
      rs.push(chunk);
      rs.pause();
      let data = rs.read(1024);
      expect(data?.toString().length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_1500
     * @tc.name testStreamReadableRead015
     * @tc.desc Verify size=16384 exactly high water mark size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push(new Uint8Array(16384));
      rs.pause();
      let data = rs.read(16384);
      expect(data?.toString().length).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_1600
     * @tc.name testStreamReadableRead016
     * @tc.desc Verify read returns null when the requested size exceeds the pushed Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pushSizes: int[] = [16384, 1024];
      let readSizes: int[] = [16385, 102400];
      for (let i = 0; i < pushSizes.length; i++) {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.push(new Uint8Array(pushSizes[i]));
        rs.pause();
        let data = rs.read(readSizes[i]);
        expect(data).assertEqual(null);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_1700
     * @tc.name testStreamReadableRead017
     * @tc.desc Verify read without size reads all buffered string data in paused mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push("hello");
      rs.pause();
      expect(rs.isPaused()).assertTrue();
      let data = rs.read();
      expect(data?.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_1800
     * @tc.name testStreamReadableRead018
     * @tc.desc Verify two consecutive reads: first valid, second null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push("abc");
      rs.pause();
      let d1 = rs.read();
      expect(d1?.toString()).assertEqual("abc");
      let d2 = rs.read();
      expect(d2).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_1900
     * @tc.name testStreamReadableRead019
     * @tc.desc Verify read(2) twice exactly consumes 4-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push("abcd");
      rs.pause();
      let d1 = rs.read(2);
      expect(d1?.toString()).assertEqual("ab");
      let d2 = rs.read(2);
      expect(d2?.toString()).assertEqual("cd");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_2000
     * @tc.name testStreamReadableRead020
     * @tc.desc Verify reading data in readable event callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.pause();
        let readDataStr: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("readable", (): void => {
            let readData = rs.read();
            readDataStr = readData?.toString() ?? "";
            resolve(undefined as void);
          });
          rs.push("test");
          rs.push(null);
        });
        expect(readDataStr).assertEqual("test");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_2100
     * @tc.name testStreamReadableRead021
     * @tc.desc Verify reading Chinese data correctly decoded after setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.setEncoding("gbk");
      rs.push(new Uint8Array([0xB2, 0xE2, 0xCA, 0xD4, 0xB9, 0xA4, 0xB3, 0xCC, 0xCA, 0xA6]));
      rs.pause();
      let data = rs.read();
      expect(data?.toString()).assertEqual("测试工程师");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_2200
     * @tc.name testStreamReadableRead022
     * @tc.desc Verify read still retrieves data after resume then pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push("data");
      rs.resume();
      rs.pause();
      let data = rs.read();
      expect(data?.toString()).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_2300
     * @tc.name testStreamReadableRead023
     * @tc.desc Verify read with specified size leaves exactly 0 remaining in buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push("abc");
      rs.pause();
      let data = rs.read(3);
      expect(data?.toString()).assertEqual("abc");
      let remaining = rs.read();
      expect(remaining).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_2400
     * @tc.name testStreamReadableRead024
     * @tc.desc Verify flowing mode on("data") callback calling read returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      let readInCallback: Object | null = null;
      rs.on("data", (chunk: Object): void => {
        readInCallback = rs.read();
      });
      rs.push("test");
      expect(readInCallback).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_2500
     * @tc.name testStreamReadableRead025
     * @tc.desc Verify read reduces backpressure after push exceeds highWaterMark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let chunk: string = "";
      for (let i: int = 0; i < 16385; i++) {
        chunk += "a";
      }
      rs.push(chunk);
      for (let i: int = 0; i < 16; i++) {
        let data = rs.read(1024);
        expect(data?.toString().length).assertEqual(1024);
      }
      let r2: boolean = rs.push("a");
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_2600
     * @tc.name testStreamReadableRead026
     * @tc.desc Verify doRead implementation is automatically called during read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadablePushAuto = new ReadablePushAuto();
      rs.pause();
      let data = rs.read();
      expect(data?.toString()).assertEqual("auto");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_2700
     * @tc.name testStreamReadableRead027
     * @tc.desc Verify read() returns pushed multi-language, emoji, symbol and special-character payloads unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payloads: string[] = ['😀', '⭐⭐', '😀测试',
        '!@#$%^&*()', '<script>alert(1)</script>', '\x00test', 'テスト',
        '테스트', 'тест',
        'الاختبار', '13800138000', 'test@example.com',
        'a​b'];
      for (let i = 0; i < payloads.length; i++) {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.push(payloads[i]);
        rs.pause();
        let data = rs.read();
        expect(data?.toString()).assertEqual(payloads[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_2800
     * @tc.name testStreamReadableRead028
     * @tc.desc Verify read(0) does not consume a buffered chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push('zero');
      rs.pause();
      let before = rs.readableLength;
      let zeroData = rs.read(0);
      expect(zeroData).assertEqual(null);
      expect(rs.readableLength).assertEqual(before);
      expect(rs.read()?.toString()).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_2900
     * @tc.name testStreamReadableRead029
     * @tc.desc Verify a comprehensive flow on a single Readable: push multiple chunks, pause, consume by size with read(), resume, and finally receive data and end events, with all buffered data read in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new ReadableTestBase();
        rs.pause();
        let endFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            endFired = true;
            resolve(undefined as void);
          });
          rs.push('a');
          rs.push('b');
          rs.push('c');
          let first: string = rs.read(1)?.toString() ?? '';
          expect(first).assertEqual('a');
          expect(rs.isPaused()).assertTrue();
          let rest = rs.read();
          expect(rest?.toString()).assertEqual('bc');
          expect(rs.read()).assertEqual(null);
          rs.resume();
          rs.push(null);
        });
        expect(endFired).assertTrue();
        expect(rs.readableEnded).assertTrue();

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_READ_3000
     * @tc.name testStreamReadableRead030
     * @tc.desc Verify setEncoding decoding of Chinese bytes on a single Readable: the paused stream decodes the pushed gbk bytes via read(), and push(null) thereafter ends the buffered data so read() returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableRead030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rs = new ReadableTestBase();
        rs.pause();
        rs.setEncoding('gbk');
        rs.push(new Uint8Array([0xD6, 0xD0, 0xCE, 0xC4]));
        let decoded = rs.read();
        expect(decoded?.toString()).assertEqual('中文');
        rs.push(null);
        expect(rs.read()).assertEqual(null);
      });
  });
}
