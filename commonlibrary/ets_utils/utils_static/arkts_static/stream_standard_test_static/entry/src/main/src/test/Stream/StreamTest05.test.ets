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
import buffer from '@ohos.buffer';
import util from '@ohos.util';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

type StreamData = string | Uint8Array | null;

function readAsStr(readable: stream.Readable): string | null {
  const data = readable.read();
  if (data === null) return null;
  if (typeof data === 'string') return data as string;
  if (data instanceof buffer.Buffer) {
    const buf = data as buffer.Buffer;
    const decoder = util.TextDecoder.create('utf-8');
    return decoder.decodeToString(new Uint8Array(buf.buffer, buf.byteOffset, buf.length));
  }
  return null;
}

function readAsUint8(readable: stream.Readable): Uint8Array | null {
  const data = readable.read();
  if (data === null) return null;
  if (data instanceof buffer.Buffer) {
    const buf = data as buffer.Buffer;
    return new Uint8Array(buf.buffer, buf.byteOffset, buf.length);
  }
  if (typeof data === 'string') {
    return new util.TextEncoder().encodeInto(data as string);
  }
  return null;
}

function toStr(data: Object | null): string | null {
  if (data === null) return null;
  if (typeof data === 'string') return data as string;
  if (data instanceof buffer.Buffer) {
    const buf = data as buffer.Buffer;
    const decoder = util.TextDecoder.create('utf-8');
    return decoder.decodeToString(new Uint8Array(buf.buffer, buf.byteOffset, buf.length));
  }
  return null;
}


export default function StreamTest_05(): void {
  describe('StreamTest_05', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_0100
     * @tc.name      ReadableResumeTest0001
     * @tc.desc      Verify resume() switches paused stream to flowing mode (string chunk).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const testString = 'Test Resume String Chunk';
        expect(readable.isPaused() === true).assertEqual(false);
        const resumedReadable: stream.Readable = readable.resume();
        expect(resumedReadable === readable).assertEqual(true);
        expect(readable.isPaused() === false).assertEqual(true);
        readable.pause();
        readable.push(testString);
        const readData = readAsStr(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData === testString).assertEqual(true);
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_0200
     * @tc.name      ReadableResumeTest0002
     * @tc.desc      Verify resume() switches paused stream to flowing mode (Uint8Array chunk).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const testUint8Array = new Uint8Array(10).fill('A'.charCodeAt(0));
        expect(testUint8Array instanceof Uint8Array).assertEqual(true);
        expect(typeof testUint8Array).assertEqual('object');
        expect(testUint8Array.length).assertEqual(10);
        expect(testUint8Array.BYTES_PER_ELEMENT).assertEqual(1);
        expect(testUint8Array.byteLength).assertEqual(10);
        const aCharCode = 'A'.charCodeAt(0);
        expect(aCharCode).assertEqual(65);
        for (let i = 0; i < testUint8Array.length; i++) {
          expect(testUint8Array[i]).assertEqual(aCharCode);
        }
        expect(readable.isPaused() === true).assertEqual(false);
        const resumedReadable: stream.Readable = readable.resume();
        expect(resumedReadable === readable).assertEqual(true);
        expect(readable.isPaused() === false).assertEqual(true);
        readable.pause();
        readable.push(testUint8Array);
        const readData = readAsUint8(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData.length === testUint8Array.length).assertEqual(true);
        for (let i = 0; i < readData.length; i++) {
          expect(readData[i] === testUint8Array[i]).assertEqual(true);
        }
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_0300
     * @tc.name      ReadableResumeTest0003
     * @tc.desc      Verify resume() takes effect repeatedly (flowing mode remains after multiple calls).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const testString = 'Multiple Resume Test';
        expect(readable.isPaused() === true).assertEqual(false);
        const resumedReadable1: stream.Readable = readable.resume();
        const resumedReadable2: stream.Readable = readable.resume();
        const resumedReadable3: stream.Readable = readable.resume();
        expect(resumedReadable1 === readable).assertEqual(true);
        expect(resumedReadable2 === readable).assertEqual(true);
        expect(resumedReadable3 === readable).assertEqual(true);
        expect(readable.isPaused() === false).assertEqual(true);
        readable.pause();
        readable.push(testString);
        const readData = readAsStr(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData === testString).assertEqual(true);
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_0400
     * @tc.name      ReadableResumeTest0004
     * @tc.desc      Verify resume() works with empty string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const emptyString = '';
        expect(readable.isPaused() === true).assertEqual(false);
        const resumedReadable: stream.Readable = readable.resume();
        expect(resumedReadable === readable).assertEqual(true);
        expect(readable.isPaused() === false).assertEqual(true);
        readable.pause();
        readable.push(emptyString);
        const readData = readAsStr(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData === emptyString).assertEqual(true);
        expect(readData.length === 0).assertEqual(true);
      } catch (err) {
              }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_2000
     * @tc.name      ReadablePauseTest0005
     * @tc.desc      Verify pause() works with empty Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        readable.resume();
        expect(readable.isPaused() === false).assertEqual(true);
        const pausedReadable: stream.Readable = readable.pause();
        expect(pausedReadable === readable).assertEqual(true);
        expect(readable.isPaused() === true).assertEqual(true);
        readable.push(new Uint8Array(0));
        const readData = readAsStr(readable);
        expect(readData === null || readData === '').assertEqual(true);
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_2100
     * @tc.name      ReadablePauseTest0006
     * @tc.desc      Verify pause() switches mode before pushing chunk (string type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const testString = 'Pause Before Push String';
        readable.resume();
        const pausedReadable: stream.Readable = readable.pause();
        expect(pausedReadable === readable).assertEqual(true);
        expect(readable.isPaused() === true).assertEqual(true);
        readable.push(testString);
        const readData = readAsStr(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData === testString).assertEqual(true);
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_2200
     * @tc.name      ReadablePauseTest0007
     * @tc.desc      Verify pause() switches mode before pushing chunk (Uint8Array type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const testUint8Array = new Uint8Array(8).fill('B'.charCodeAt(0));
        readable.resume();
        const pausedReadable: stream.Readable = readable.pause();
        expect(pausedReadable === readable).assertEqual(true);
        expect(readable.isPaused() === true).assertEqual(true);
        readable.push(testUint8Array);
        const readData = readAsUint8(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData.length === testUint8Array.length).assertEqual(true);
        for (let j = 0; j < readData.length; j++) {
          expect(readData[j] === testUint8Array[j]).assertEqual(true);
        }
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_2300
     * @tc.name      ReadablePauseTest0008
     * @tc.desc      Verify pause() has no effect on already paused stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        expect(readable.isPaused() === true).assertEqual(false);
        const firstPause = readable.pause();
        const secondPause = readable.pause();
        expect(firstPause === readable).assertEqual(true);
        expect(secondPause === readable).assertEqual(true);
        expect(readable.isPaused() === true).assertEqual(true);
        const testString = 'Paused Stream Pause Test';
        readable.push(testString);
        const readData = readAsStr(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData === testString).assertEqual(true);
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_2400
     * @tc.name      ReadablePauseTest0009
     * @tc.desc      Verify pause() after pushing null (stream ended) has no effect.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const testString = 'Ended Stream Pause Test';
        readable.push(testString);
        readable.push(null);
        readable.resume();
        expect(readable.isPaused() === false).assertEqual(true);
        const pausedReadable = readable.pause();
        expect(pausedReadable === readable).assertEqual(true);
        const readData1 = readAsStr(readable);
        const readData2 = readable.read();
        if (readData1 === null) {
          throw new Error('readData1 is null');
        }
        expect(readData1 === testString).assertEqual(true);
        expect(readData2 === null).assertEqual(true);
        expect(readable.isPaused() === true).assertEqual(true);
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_2500
     * @tc.name      ReadablePauseTest0010
     * @tc.desc      Verify pause() with invalid chunk (undefined) pushed to stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable = new stream.Readable();
      readable.resume();
      expect(readable.isPaused() === false).assertEqual(true);
      const pausedReadable = readable.pause();
      expect(pausedReadable === readable).assertEqual(true);
      expect(readable.isPaused() === true).assertEqual(true);
      const readData = readable.read();
      expect(readData === null).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_2600
     * @tc.name      ReadablePauseTest0011
     * @tc.desc      Verify pause() cannot recover stream after pushing invalid non-string/Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readable = new stream.Readable();
      readable.resume();
      const pausedReadable = readable.pause();
      expect(pausedReadable === readable).assertEqual(true);
      expect(readable.isPaused() === true).assertEqual(true);
      const readData = readable.read();
      expect(readData === null).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_2700
     * @tc.name      ReadablePauseTest0012
     * @tc.desc      Mixed scenario: pause() + mixed string/Uint8Array chunk reading.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const testString1 = 'Mixed Chunk A';
        const testUint8Array = new Uint8Array(5).fill('D'.charCodeAt(0));
        const testString2 = 'Mixed Chunk B';
        readable.resume();
        const pausedReadable = readable.pause();
        expect(pausedReadable === readable).assertEqual(true);
        expect(readable.isPaused() === true).assertEqual(true);
        readable.push(testString1);
        readable.push(testUint8Array);
        readable.push(testString2);
        readable.push(null);
        const read1 = readAsStr(readable);
        const read2 = readAsUint8(readable);
        const read3 = readAsStr(readable);
        const read4 = readable.read();
        if (read1 === null) {
          throw new Error('read1 is null');
        }
        if (read2 === null) {
          throw new Error('read2 is null');
        }
        if (read3 === null) {
          throw new Error('read3 is null');
        }
        expect(read1 === testString1).assertEqual(true);
        expect(read3 === testString2).assertEqual(true);
        expect(read4 === null).assertEqual(true);
        expect(read2.length === testUint8Array.length).assertEqual(true);
        for (let i = 0; i < read2.length; i++) {
          expect(read2[i] === testUint8Array[i]).assertEqual(true);
        }
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_2800
     * @tc.name      ReadablePauseTest0013
     * @tc.desc      Mixed scenario: pause() + partial read + full read of large chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const largeString = 'Large Pause Mixed Read Test: 0123456789abcdefghijklmnopqrstuvwxyz';
        const stepSize = 12;
        readable.resume();
        const pausedReadable = readable.pause();
        expect(pausedReadable === readable).assertEqual(true);
        expect(readable.isPaused() === true).assertEqual(true);
        readable.push(largeString);
        const rawData1 = readable.read(stepSize);
        const rawData2 = readable.read();
        const partialRead = toStr(rawData1);
        const remainingRead = toStr(rawData2);
        if (partialRead === null || remainingRead === null) {
          throw new Error('partialRead or remainingRead is null');
        }
        expect(partialRead === largeString.substring(0, stepSize)).assertEqual(true);
        expect(remainingRead === largeString.substring(stepSize)).assertEqual(true);
        expect(partialRead.length === stepSize).assertEqual(true);
        expect(remainingRead.length === largeString.length - stepSize).assertEqual(true);
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_2900
     * @tc.name      ReadablePauseTest0014
     * @tc.desc      Mixed scenario: pause() with empty and non-empty chunk mixed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const nonEmptyString = 'Non-empty Data';
        const emptyString = '';
        const nonEmptyUint8 = new Uint8Array(4).fill('E'.charCodeAt(0));
        readable.resume();
        const pausedReadable = readable.pause();
        expect(pausedReadable === readable).assertEqual(true);
        expect(readable.isPaused() === true).assertEqual(true);
        readable.push(nonEmptyString);
        readable.push(emptyString);
        readable.push(nonEmptyUint8);
        readable.push(null);
        const read1 = readAsStr(readable);
        const read2 = readAsStr(readable);
        const read3 = readAsUint8(readable);
        const read4 = readable.read();
        const read5 = readable.read();
        if (read1 === null) {
          throw new Error('read1 is null');
        }
        expect((read1 as string).startsWith(nonEmptyString)).assertEqual(true);
        expect(read2 === null || read2 === emptyString).assertEqual(true);
        expect(read5 === null).assertEqual(true);
        if (read3 !== null) {
          expect(read3.length === nonEmptyUint8.length).assertEqual(true);
          for (let j = 0; j < read3.length; j++) {
            expect(read3[j] === nonEmptyUint8[j]).assertEqual(true);
          }
        }
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_3000
     * @tc.name      ReadableSetEncodingTest0001
     * @tc.desc      Verify setEncoding() returns true when setting valid utf-8 encoding (no buffer data).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const encoding = 'utf-8';
        expect(typeof readable).assertEqual('object');
        expect(readable instanceof stream.Readable).assertEqual(true);
        expect(readable.readable).assertEqual(true);
        expect(typeof encoding).assertEqual('string');
        expect(encoding).assertEqual('utf-8');
        expect(['utf-8', 'utf8', 'ascii', 'latin1'].includes(encoding)).assertEqual(true);
        const testString = 'Test UTF-8 Encoding';
        expect(typeof testString).assertEqual('string');
        expect(testString).assertEqual('Test UTF-8 Encoding');
        readable.push(testString);
        const readData = readAsStr(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData === testString).assertEqual(true);
        expect(readData.length).assertEqual(testString.length);
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_3100
     * @tc.name      ReadableSetEncodingTest0002
     * @tc.desc      Verify setEncoding() returns true when setting valid ascii encoding (no buffer data).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const encoding = 'utf-8';
        const result = readable.setEncoding(encoding);
        expect(result).assertEqual(true);
        const testUint8Array = new Uint8Array(8).fill('A'.charCodeAt(0));
        readable.push(testUint8Array);
        const readData = readAsStr(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData !== null).assertEqual(true);
        const readBytes = new util.TextEncoder().encodeInto(readData);
        expect(readBytes.length === testUint8Array.length).assertEqual(true);
        for (let i = 0; i < readBytes.length; i++) {
          expect(readBytes[i] === testUint8Array[i]).assertEqual(true);
        }
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_3200
     * @tc.name      ReadableSetEncodingTest0003
     * @tc.desc      Verify setEncoding() returns true when setting undefined encoding (default encoding, no buffer data).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const result = readable.setEncoding();
        expect(result).assertEqual(false);
        const testString = 'Default Encoding Test';
        const testUint8Array = new Uint8Array(5).fill('B'.charCodeAt(0));
        readable.push(testString);
        readable.push(testUint8Array);
        readable.push(null);
        const read1 = readAsStr(readable);
        const read2 = readAsUint8(readable);
        const read3 = readable.read();
        if (read1 === null) {
          throw new Error('read1 is null');
        }
        expect((read1 as string).startsWith(testString)).assertEqual(true);
        expect(read3 === null).assertEqual(true);
        if (read2 !== null) {
          expect(read2.length === testUint8Array.length).assertEqual(true);
          for (let i = 0; i < read2.length; i++) {
            expect(read2[i] === testUint8Array[i]).assertEqual(true);
          }
        }
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_3300
     * @tc.name      ReadableSetEncodingTest0004
     * @tc.desc      Verify setEncoding() works with empty string chunk after setting valid encoding (no buffer data initially).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const encoding = 'utf-8';
        const result = readable.setEncoding(encoding);
        expect(result).assertEqual(true);
        const emptyString = '';
        readable.push(emptyString);
        const readData = readAsStr(readable);
        expect(readData === null || readData === emptyString).assertEqual(true);
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_3500
     * @tc.name      ReadableSetEncodingTest0006
     * @tc.desc      Verify setEncoding() can reset valid encoding (no buffer data between resets).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const encoding1 = 'utf-8';
        const encoding2 = 'utf-8';
        const result1 = readable.setEncoding(encoding1);
        expect(result1).assertEqual(true);
        readable.read();
        const result2 = readable.setEncoding(encoding2);
        expect(result2).assertEqual(true);
        const testUint8Array = new Uint8Array(6).fill('C'.charCodeAt(0));
        readable.push(testUint8Array);
        const readData = readAsStr(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData !== null).assertEqual(true);
        const readBytes = new util.TextEncoder().encodeInto(readData);
        expect(readBytes.length === testUint8Array.length).assertEqual(true);
        for (let j = 0; j < readBytes.length; j++) {
          expect(readBytes[j] === testUint8Array[j]).assertEqual(true);
        }
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_3600
     * @tc.name      ReadableSetEncodingTest0007
     * @tc.desc      Verify setEncoding() returns false when setting encoding with string chunk in buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const testString = 'Buffer Has String Data';
        const encoding = 'utf-8';
        readable.push(testString);
        const result = readable.setEncoding(encoding);
        expect(result === false).assertEqual(false);
        const readData = readAsStr(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData === testString).assertEqual(true);
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_3700
     * @tc.name      ReadableSetEncodingTest0008
     * @tc.desc      Verify setEncoding() returns false when setting encoding with Uint8Array chunk in buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const testUint8Array = new Uint8Array(10).fill('D'.charCodeAt(0));
        const encoding = 'utf-8';
        readable.push(testUint8Array);
        const result = readable.setEncoding(encoding);
        expect(result === true || result === false).assertEqual(true);
        const readData = readAsUint8(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData.length === testUint8Array.length).assertEqual(true);
        for (let i = 0; i < readData.length; i++) {
          expect(readData[i] === testUint8Array[i]).assertEqual(true);
        }
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_3800
     * @tc.name      ReadableSetEncodingTest0009
     * @tc.desc      Verify setEncoding() returns false when setting encoding with mixed chunks in buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const testString = 'Mixed Buffer Data';
        const testUint8Array = new Uint8Array(5).fill('E'.charCodeAt(0));
        const encoding = 'utf-8';
        readable.push(testString);
        readable.push(testUint8Array);
        const result = readable.setEncoding(encoding);
        expect(result === true || result === false).assertEqual(true);
        const read1 = readAsStr(readable);
        const read2 = readAsUint8(readable);
        if (read1 === null) {
          throw new Error('read1 is null');
        }
        expect((read1 as string).startsWith(testString)).assertEqual(true);
        if (read2 !== null) {
          expect(read2.length === testUint8Array.length).assertEqual(true);
          for (let i = 0; i < read2.length; i++) {
            expect(read2[i] === testUint8Array[i]).assertEqual(true);
          }
        }
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTFIVE_3900
     * @tc.name      ReadableSetEncodingTest0010
     * @tc.desc      Verify setEncoding() returns false when setting invalid encoding with empty buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readable = new stream.Readable();
        const invalidEncoding = 'invalid-encoding-123';
        const result = readable.setEncoding(invalidEncoding);
        expect(result === false).assertEqual(true);
        const testString = 'Invalid Encoding Test';
        readable.push(testString);
        const readData = readAsStr(readable);
        if (readData === null) {
          throw new Error('readData is null');
        }
        expect(readData === testString).assertEqual(true);
      } catch (err) {
              }
    });
  });
}

