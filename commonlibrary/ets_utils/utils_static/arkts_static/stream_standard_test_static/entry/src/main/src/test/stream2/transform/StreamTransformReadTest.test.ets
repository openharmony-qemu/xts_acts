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
import { buffer, stream } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

class ReadTestTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class ReadNoPushTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamTransformReadTest(): void {
  describe('StreamTransformReadTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_0100
     * @tc.name testStreamTransformRead001
     * @tc.desc Verify read() returns pushed data after write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.write('hello', 'utf8');
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_0200
     * @tc.name testStreamTransformRead002
     * @tc.desc Verify read(1) returns first byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.write('abc', 'utf8');
      transform.pause();
      let data = transform.read(1);
      expect(data?.toString()).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_0300
     * @tc.name testStreamTransformRead003
     * @tc.desc Verify read(size) matching buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.write('data', 'utf8');
      transform.pause();
      let data = transform.read(4);
      expect(data?.toString()).assertEqual('data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_0400
     * @tc.name testStreamTransformRead004
     * @tc.desc Verify read() returns null on empty buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      let data = transform.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_0500
     * @tc.name testStreamTransformRead005
     * @tc.desc Verify read() returns null in flowing mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ReadTestTransform();
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (): void => {
            resolve(undefined as void);
          });
          transform.write('test', 'utf8');
        });
        let data = transform.read();
        expect(data).assertEqual(null);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_0600
     * @tc.name testStreamTransformRead006
     * @tc.desc Verify read returns null after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.end();
      transform.pause();
      let data = transform.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_0700
     * @tc.name testStreamTransformRead007
     * @tc.desc Verify doTransform without push returns null on read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadNoPushTransform();
      transform.write('x', 'utf8');
      transform.pause();
      let data = transform.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_0800
     * @tc.name testStreamTransformRead008
     * @tc.desc Verify read after gbk encoding write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.setDefaultEncoding('gbk');
      transform.write('中文', 'gbk');
      transform.pause();
      let data = transform.read();
      expect(data?.toString().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_0900
     * @tc.name testStreamTransformRead009
     * @tc.desc Verify read after multiple writes returns all data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.write('a', 'utf8');
      transform.write('b', 'utf8');
      transform.write('c', 'utf8');
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_1000
     * @tc.name testStreamTransformRead010
     * @tc.desc Verify read(0) returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.write('test', 'utf8');
      transform.pause();
      expect(transform.readableLength).assertEqual(4);
      let data0 = transform.read(0);
      expect(data0).assertEqual(null);
      expect(transform.readableLength).assertEqual(4);
      let data2 = transform.read(2);
      expect(data2?.toString()).assertEqual('te');
      expect(transform.readableLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_1100
     * @tc.name testStreamTransformRead011
     * @tc.desc Verify read with negative size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.write('test', 'utf8');
      transform.pause();
      let code: int = 0;
      try {
        transform.read(-1);
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_1200
     * @tc.name testStreamTransformRead012
     * @tc.desc Verify read with size at highWaterMark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      let data16384: string = '';
      for (let i: int = 0; i < 16384; i++) {
        data16384 += 'x';
      }
      transform.write(data16384, 'utf8');
      transform.pause();
      let data = transform.read(16384);
      expect(data?.toString()).assertEqual(data16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_1300
     * @tc.name testStreamTransformRead013
     * @tc.desc Verify read with size above highWaterMark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      let data16385: string = '';
      for (let i: int = 0; i < 16385; i++) {
        data16385 += 'x';
      }
      transform.write(data16385, 'utf8');
      transform.pause();
      let data = transform.read(16385);
      expect(data?.toString()).assertEqual(data16385);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_1400
     * @tc.name testStreamTransformRead014
     * @tc.desc Verify read with size exceeding buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ReadTestTransform();
        transform.write('hi', 'utf8');
        transform.pause();
        let data = transform.read(100);
        expect(data).assertEqual(null);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_1500
     * @tc.name testStreamTransformRead015
     * @tc.desc Verify read partial then read remaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.write('abcde', 'utf8');
      transform.pause();
      let first = transform.read(2);
      let second = transform.read();
      expect(first?.toString()).assertEqual('ab');
      expect(second?.toString()).assertEqual('cde');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_1600
     * @tc.name testStreamTransformRead016
     * @tc.desc Verify end(chunk) then read gets remaining data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.end('last', 'utf8');
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('last');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_1700
     * @tc.name testStreamTransformRead017
     * @tc.desc Verify push(null) then read returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.push(null);
      transform.pause();
      let data = transform.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_1800
     * @tc.name testStreamTransformRead018
     * @tc.desc Verify read after emoji write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.write('😀', 'utf8');
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_1900
     * @tc.name testStreamTransformRead019
     * @tc.desc Verify read of 16383 bytes data with size below highWaterMark drains the buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      let data16383: string = '';
      for (let i: int = 0; i < 16383; i++) {
        data16383 += 'a';
      }
      transform.write(data16383, 'utf8');
      transform.pause();
      expect(transform.readableLength).assertEqual(16383);
      let data = transform.read(16383);
      expect(data?.toString()).assertEqual(data16383);
      expect(transform.readableLength).assertEqual(0);
      expect(transform.read()).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_2000
     * @tc.name testStreamTransformRead020
     * @tc.desc Verify read reads all when push and write interleave
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.push('x');
      transform.write('y', 'utf8');
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('xy');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_2100
     * @tc.name testStreamTransformRead021
     * @tc.desc Verify read returns a single boundary chunk after an empty push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.push('');
      transform.push('one');
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('one');
      expect(transform.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_2200
     * @tc.name testStreamTransformRead022
     * @tc.desc Verify read() after push returns pushed chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.push('hello');
      let data = transform.read();
      expect(data?.toString()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_2300
     * @tc.name testStreamTransformRead023
     * @tc.desc Verify read() after multiple pushes returns chunks in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.push('a');
      transform.push('b');
      transform.push('c');
      expect(transform.read(1)?.toString()).assertEqual('a');
      expect(transform.read(1)?.toString()).assertEqual('b');
      expect(transform.read(1)?.toString()).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_2400
     * @tc.name testStreamTransformRead024
     * @tc.desc Verify read(0) returns null without consuming buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.push('hello');
      let data = transform.read(0);
      expect(data).assertEqual(null);
      expect(transform.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_2500
     * @tc.name testStreamTransformRead025
     * @tc.desc Verify read(negative) returns null without consuming buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.push('hello');
      let data = transform.read(-1);
      expect(data).assertEqual(null);
      expect(transform.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_2600
     * @tc.name testStreamTransformRead026
     * @tc.desc Verify read(size) with size exceeding buffer returns entire buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.push('hello');
      transform.push(null);
      let data = transform.read(100);
      expect(data?.toString()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_2700
     * @tc.name testStreamTransformRead027
     * @tc.desc Verify read() returns a Buffer with the exact byte content of a Uint8Array chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      transform.push(arr);
      let data = transform.read();
      expect(buffer.isBuffer(data as Object)).assertTrue();
      let bytes: buffer.Buffer = data as buffer.Buffer;
      expect(bytes.length).assertEqual(3);
      expect(bytes[0]).assertEqual(1);
      expect(bytes[1]).assertEqual(2);
      expect(bytes[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_2800
     * @tc.name testStreamTransformRead028
     * @tc.desc Verify read() in flowing mode returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ReadTestTransform();
        let readNullAtData: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (): void => {
            readNullAtData = (transform.read() === null);
            resolve(undefined as void);
          });
          transform.push('hello');
        });
        expect(readNullAtData).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_2900
     * @tc.name testStreamTransformRead029
     * @tc.desc Verify read() decreases readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.push('hello');
      expect(transform.readableLength).assertEqual(5);
      transform.read();
      expect(transform.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_3000
     * @tc.name testStreamTransformRead030
     * @tc.desc Verify read() does not affect writable* properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.push('hello');
      transform.read();
      expect(transform.writable).assertTrue();
      expect(transform.writableLength).assertEqual(0);
      expect(transform.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_3100
     * @tc.name testStreamTransformRead031
     * @tc.desc Verify read on a paused Transform keeps isPaused true and readable* configuration unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.push('hello');
      transform.read();
      expect(transform.isPaused()).assertTrue();
      expect(transform.readableHighWatermark).assertEqual(16384);
      expect(transform.readableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_3200
     * @tc.name testStreamTransformRead032
     * @tc.desc Verify read() after setEncoding decodes bytes to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.setEncoding('utf8');
      transform.pause();
      transform.push('中文');
      let data = transform.read();
      expect(data?.toString()).assertEqual('中文');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_3300
     * @tc.name testStreamTransformRead033
     * @tc.desc Verify read() after setEncoding('gbk') decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.setEncoding('gbk');
      transform.pause();
      transform.push('中文', 'gbk');
      let data = transform.read();
      expect(data?.toString()).assertEqual('中文');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_3400
     * @tc.name testStreamTransformRead034
     * @tc.desc Verify read() with emoji chunk decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.push('😀');
      let data = transform.read();
      expect(data?.toString()).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_3500
     * @tc.name testStreamTransformRead035
     * @tc.desc Verify read() after push empty string returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.push('');
      let data = transform.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_3600
     * @tc.name testStreamTransformRead036
     * @tc.desc Verify read() after push undefined does not change buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      let before = transform.readableLength;
      transform.push(undefined as Uint8Array | string | undefined | null);
      expect(transform.readableLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_3700
     * @tc.name testStreamTransformRead037
     * @tc.desc Verify read() multiple times after push consumes chunks in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.push('a');
      transform.push('b');
      transform.push('c');
      transform.push('d');
      expect(transform.read(1)?.toString()).assertEqual('a');
      expect(transform.read(1)?.toString()).assertEqual('b');
      expect(transform.read(1)?.toString()).assertEqual('c');
      expect(transform.read(1)?.toString()).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_3800
     * @tc.name testStreamTransformRead038
     * @tc.desc Verify read() readableEnded true after push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ReadTestTransform();
        let endedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            endedAtEnd = transform.readableEnded;
            resolve(undefined as void);
          });
          transform.push(null);
          transform.resume();
        });
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_3900
     * @tc.name testStreamTransformRead039
     * @tc.desc Verify readableEnded, readableLength and readableEncoding keep defaults before read() is called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      expect(transform.readableEnded).assertFalse();
      expect(transform.readableLength).assertEqual(0);
      expect(transform.readableEncoding).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_4000
     * @tc.name testStreamTransformRead040
     * @tc.desc Verify read() after pause keeps readableFlowing false and readableEncoding and readableEnded unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.read();
      expect(transform.readableFlowing).assertFalse();
      expect(transform.readableEncoding).assertEqual(null);
      expect(transform.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_4100
     * @tc.name testStreamTransformRead041
     * @tc.desc Verify read() after write triggers doTransform pushes data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.write('hello', 'utf8');
      let data = transform.read();
      expect(data?.toString()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_READ_4200
     * @tc.name testStreamTransformRead042
     * @tc.desc Verify read() after end triggers doTransform pushes end chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformRead042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ReadTestTransform();
      transform.pause();
      transform.end('last', 'utf8');
      let data = transform.read();
      expect(data?.toString()).assertEqual('last');
    });

  });
}
