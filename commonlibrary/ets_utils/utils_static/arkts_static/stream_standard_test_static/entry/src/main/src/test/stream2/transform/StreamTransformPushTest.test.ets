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
import { stream } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

class PushTestTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class PushNoPushTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class PushMultiPushTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push('A');
    this.push('B');
    this.push('C');
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.push('flushData');
    callback.unsafeCall();
  }
}

export default function StreamTransformPushTest(): void {
  describe('StreamTransformPushTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_0100
     * @tc.name testStreamTransformPush001
     * @tc.desc Verify push inside doTransform pushes data to readable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PushTestTransform();
        let output: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (data: Object): void => {
            output = data.toString();
          });
          transform.on('end', (): void => {
            resolve(undefined as void);
          });
          transform.resume();
          transform.write('hello', 'utf8');
          transform.end();
        });
        expect(output).assertEqual('hello');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_0200
     * @tc.name testStreamTransformPush002
     * @tc.desc Verify doTransform multiple pushes emit in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PushMultiPushTransform();
        let outputs: string[] = [];
        let outputsLenAtEnd: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (data: Object): void => {
            outputs.push(data.toString());
          });
          transform.on('end', (): void => {
            outputsLenAtEnd = outputs.length;
            resolve(undefined as void);
          });
          transform.resume();
          transform.write('x', 'utf8');
          transform.end();
        });
        expect(outputsLenAtEnd).assertEqual(4);
        expect(outputs[0]).assertEqual('A');
        expect(outputs[1]).assertEqual('B');
        expect(outputs[2]).assertEqual('C');
        expect(outputs[3]).assertEqual('flushData');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_0300
     * @tc.name testStreamTransformPush003
     * @tc.desc Verify push increases readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.push('test');
      transform.pause();
      expect(transform.readableLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_0400
     * @tc.name testStreamTransformPush004
     * @tc.desc Verify push(null) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      let result = transform.push(null);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_0500
     * @tc.name testStreamTransformPush005
     * @tc.desc Verify push(null) triggers end event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PushTestTransform();
        let endedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            endedAtEnd = transform.readableEnded;
            resolve(undefined as void);
          });
          transform.resume();
          transform.push(null);
        });
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_0600
     * @tc.name testStreamTransformPush006
     * @tc.desc Verify doTransform without push sends no data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushNoPushTransform();
      let dataCalled: boolean = false;
      transform.on('data', (): void => {
        dataCalled = true;
      });
      transform.write('x', 'utf8');
      expect(dataCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_0700
     * @tc.name testStreamTransformPush007
     * @tc.desc Verify push(undefined) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      let code: int = 0;
      try {
        transform.push(undefined as Uint8Array | string | undefined | null);
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_0800
     * @tc.name testStreamTransformPush008
     * @tc.desc Verify push empty string is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      let code: int = 0;
      try {
        transform.push('');
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_0900
     * @tc.name testStreamTransformPush009
     * @tc.desc Verify push after push(null) is ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.push(null);
      let result = transform.push('after');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_1000
     * @tc.name testStreamTransformPush010
     * @tc.desc Verify doFlush push sends data on end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PushMultiPushTransform();
        let output: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (data: Object): void => {
            output += data.toString();
          });
          transform.on('end', (): void => {
            resolve(undefined as void);
          });
          transform.resume();
          transform.write('x', 'utf8');
          transform.end();
        });
        expect(output).assertEqual('ABCflushData');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_1100
     * @tc.name testStreamTransformPush011
     * @tc.desc Verify push(large data) may return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      let largeData: string = '';
      for (let i: int = 0; i < 20000; i++) {
        largeData += 'x';
      }
      transform.pause();
      let result = transform.push(largeData);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_1200
     * @tc.name testStreamTransformPush012
     * @tc.desc Verify push accepts a zero-length constructed Uint8Array(0), returns true and keeps readableLength at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      let result = transform.push(new Uint8Array(0));
      expect(result).assertTrue();
      expect(transform.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_1300
     * @tc.name testStreamTransformPush013
     * @tc.desc Verify push 10000 character long string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      let longStr: string = '';
      for (let i: int = 0; i < 10000; i++) {
        longStr += 'a';
      }
      let result = transform.push(longStr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_1400
     * @tc.name testStreamTransformPush014
     * @tc.desc Verify mixed string and Uint8Array pushes preserve order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.push('a');
      transform.push(new Uint8Array([98]));
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('ab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_1500
     * @tc.name testStreamTransformPush015
     * @tc.desc Verify push null after data emits end in flowing mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PushTestTransform();
        let output: string = '';
        let endedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (data: Object): void => {
            output = data.toString();
          });
          transform.on('end', (): void => {
            endedAtEnd = transform.readableEnded;
            resolve(undefined as void);
          });
          transform.resume();
          transform.push('before-end');
          transform.push(null);
        });
        expect(output).assertEqual('before-end');
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_1600
     * @tc.name testStreamTransformPush016
     * @tc.desc Verify direct push emits data in flowing mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PushTestTransform();
        let dataAtData: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (data: Object): void => {
            dataAtData = data.toString();
            resolve(undefined as void);
          });
          transform.push('flowing');
        });
        expect(dataAtData).assertEqual('flowing');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_1700
     * @tc.name testStreamTransformPush017
     * @tc.desc Verify consecutive pushes are read in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.push('one');
      transform.push('two');
      transform.push('three');
      transform.pause();
      let first = transform.read();
      let second = transform.read();
      let third = transform.read();
      expect(first?.toString()).assertEqual('onetwothree');
      expect(second).assertEqual(null);
      expect(third).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_1800
     * @tc.name testStreamTransformPush018
     * @tc.desc Verify push after null does not increase readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.push(null);
      let before = transform.readableLength;
      let result = transform.push('ignored');
      expect(result).assertFalse();
      expect(transform.readableLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_1900
     * @tc.name testStreamTransformPush019
     * @tc.desc Verify push empty string does not add readable length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      let before = transform.readableLength;
      let result = transform.push('');
      expect(result).assertTrue();
      expect(transform.readableLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_2000
     * @tc.name testStreamTransformPush020
     * @tc.desc Verify push returns true for plain English, Chinese-English mixed, numeric, single character and emoji strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['hello', '中文Hello', '12345', 'a', '😀😃😄'];
      for (let i = 0; i < chunks.length; i++) {
        let transform = new PushTestTransform();
        let result = transform.push(chunks[i]);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_2100
     * @tc.name testStreamTransformPush021
     * @tc.desc Verify push Japanese + utf8 encoding, read decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.push('こんにちは', 'utf8');
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('こんにちは');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_2200
     * @tc.name testStreamTransformPush022
     * @tc.desc Verify push returns true for Uint8Array of min byte, max byte, all 0xFF, mixed bytes and high water mark minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: Uint8Array[] = [new Uint8Array([0]), new Uint8Array([255]),
        new Uint8Array([0xFF, 0xFF, 0xFF]), new Uint8Array([0x00, 0xFF, 0x7F, 0x80]),
        new Uint8Array(16383)];
      for (let i = 0; i < chunks.length; i++) {
        let transform = new PushTestTransform();
        let result = transform.push(chunks[i]);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_2300
     * @tc.name testStreamTransformPush023
     * @tc.desc Verify push returns false for Uint8Array of 16384, 16385 and 65535 bytes which reach or exceed the high water mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16384, 16385, 65535];
      for (let i = 0; i < sizes.length; i++) {
        let transform = new PushTestTransform();
        let result = transform.push(new Uint8Array(sizes[i]));
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_2400
     * @tc.name testStreamTransformPush024
     * @tc.desc Verify push does not affect writable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.push('hello');
      expect(transform.writable).assertTrue();
      expect(transform.writableLength).assertEqual(0);
      expect(transform.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_2500
     * @tc.name testStreamTransformPush025
     * @tc.desc Verify push leaves isPaused and all readable* properties unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.push('hello');
      expect(transform.isPaused()).assertFalse();
      expect(transform.readableEnded).assertFalse();
      expect(transform.readableEncoding).assertEqual(null);
      expect(transform.readableHighWatermark).assertEqual(16384);
      expect(transform.readableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_2600
     * @tc.name testStreamTransformPush026
     * @tc.desc Verify push readableLength increased by pushed string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.pause();
      transform.push('hello');
      expect(transform.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_2700
     * @tc.name testStreamTransformPush027
     * @tc.desc Verify push readableLength increased by pushed Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.pause();
      transform.push(new Uint8Array([1, 2, 3, 4, 5]));
      expect(transform.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_2800
     * @tc.name testStreamTransformPush028
     * @tc.desc Verify push multiple chunks accumulate readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.pause();
      transform.push('a');
      transform.push('b');
      transform.push('c');
      expect(transform.readableLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_2900
     * @tc.name testStreamTransformPush029
     * @tc.desc Verify push in flowing mode does not accumulate readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PushTestTransform();
        let lenAtEnd: number = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (): void => {
          });
          transform.on('end', (): void => {
            lenAtEnd = transform.readableLength;
            resolve(undefined as void);
          });
          transform.push('hello');
          transform.push(null);
        });
        expect(lenAtEnd).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_3000
     * @tc.name testStreamTransformPush030
     * @tc.desc Verify push null after data sets readableEnded true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PushTestTransform();
        let endedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            endedAtEnd = transform.readableEnded;
            resolve(undefined as void);
          });
          transform.push('hello');
          transform.push(null);
          transform.resume();
        });
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_3100
     * @tc.name testStreamTransformPush031
     * @tc.desc Verify push null readableEnded true immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PushTestTransform();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_3200
     * @tc.name testStreamTransformPush032
     * @tc.desc Verify push after readable ended does not increase readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.push(null);
      transform.push('after');
      expect(transform.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_3300
     * @tc.name testStreamTransformPush033
     * @tc.desc Verify push inside doTransform sends data to readable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushMultiPushTransform();
      transform.pause();
      transform.write('x');
      expect(transform.readableLength).assertEqual(3);
      let data = transform.read();
      expect(data?.toString()).assertEqual('ABC');
      expect(transform.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PUSH_3400
     * @tc.name testStreamTransformPush034
     * @tc.desc Verify push undefined is a no-op, does not change buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPush034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PushTestTransform();
      transform.pause();
      let before = transform.readableLength;
      transform.push(undefined as Uint8Array | string | undefined | null);
      expect(transform.readableLength).assertEqual(before);
    });

  });
}
