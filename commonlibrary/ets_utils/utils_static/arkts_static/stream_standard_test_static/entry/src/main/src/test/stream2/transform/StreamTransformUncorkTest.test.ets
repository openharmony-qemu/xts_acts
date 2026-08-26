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

class UncorkTestTransform extends stream.Transform {
  public doTransformCalled: int = 0;
  public chunks: string[] = [];

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doTransformCalled++;
    this.chunks.push(chunk.toString());
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamTransformUncorkTest(): void {
  describe('StreamTransformUncorkTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_0100
     * @tc.name testStreamTransformUncork001
     * @tc.desc Verify cork+uncork returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new UncorkTestTransform();
      transform.cork();
      let result = transform.uncork();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_0200
     * @tc.name testStreamTransformUncork002
     * @tc.desc Verify uncork resets writableCorked to zero without invoking doTransform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new UncorkTestTransform();
      transform.cork();
      transform.uncork();
      expect(transform.writableCorked).assertEqual(0);
      expect(transform.doTransformCalled).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_0300
     * @tc.name testStreamTransformUncork003
     * @tc.desc Verify cork+write+write+uncork triggers doTransform twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new UncorkTestTransform();
      transform.cork();
      transform.write('a', 'utf8');
      transform.write('b', 'utf8');
      transform.uncork();
      expect(transform.doTransformCalled).assertEqual(2);
      expect(transform.chunks[0]).assertEqual('a');
      expect(transform.chunks[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_0400
     * @tc.name testStreamTransformUncork004
     * @tc.desc Verify uncork without cork does not change writableCorked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new UncorkTestTransform();
      transform.uncork();
      expect(transform.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_0500
     * @tc.name testStreamTransformUncork005
     * @tc.desc Verify cork+write+uncork readable side gets data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new UncorkTestTransform();
      transform.cork();
      transform.write('hello', 'utf8');
      transform.uncork();
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_0600
     * @tc.name testStreamTransformUncork006
     * @tc.desc Verify cork+write(large)+uncork triggers doTransform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new UncorkTestTransform();
      let largeData: string = '';
      for (let i: int = 0; i < 16385; i++) {
        largeData += 'x';
      }
      transform.cork();
      transform.write(largeData, 'utf8');
      transform.uncork();
      expect(transform.doTransformCalled).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_0700
     * @tc.name testStreamTransformUncork007
     * @tc.desc Verify writes after uncork are processed immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new UncorkTestTransform();
      transform.cork();
      transform.write('a', 'utf8');
      transform.uncork();
      expect(transform.doTransformCalled).assertEqual(1);
      transform.write('b', 'utf8');
      expect(transform.doTransformCalled).assertEqual(2);
      expect(transform.chunks[0]).assertEqual('a');
      expect(transform.chunks[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_0800
     * @tc.name testStreamTransformUncork008
     * @tc.desc Verify repeated uncork calls after the buffer is drained are harmless
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new UncorkTestTransform();
      transform.cork();
      transform.write('x', 'utf8');
      let first = transform.uncork();
      let second = transform.uncork();
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(transform.writableCorked).assertEqual(0);
      expect(transform.doTransformCalled).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_0900
     * @tc.name testStreamTransformUncork009
     * @tc.desc Verify uncork preserves the order of multiple buffered chunks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new UncorkTestTransform();
        let output: string = '';
        transform.on('data', (data: Object): void => {
          output += data.toString();
        });
        let outputAtEnd: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            outputAtEnd = output;
            resolve(undefined as void);
          });
          transform.cork();
          transform.write('1', 'utf8');
          transform.write('2', 'utf8');
          transform.write('3', 'utf8');
          transform.uncork();
          transform.end();
        });
        expect(outputAtEnd).assertEqual('123');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_1000
     * @tc.name testStreamTransformUncork010
     * @tc.desc Verify end clears nested cork state before a later uncork call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new UncorkTestTransform();
      transform.cork();
      transform.cork();
      transform.end();
      expect(transform.writableCorked).assertEqual(0);
      expect(transform.uncork()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_1100
     * @tc.name testStreamTransformUncork011
     * @tc.desc Verify uncork keeps the writable side usable for a following end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await new Promise<void>((resolve: (value: void) => void): void => {
          let transform = new UncorkTestTransform();
          transform.resume();
          transform.cork();
          transform.uncork();
          transform.end('', 'utf8');
          expect(transform.writableEnded).assertTrue();
          resolve(undefined as void);
        });
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_1200
     * @tc.name testStreamTransformUncork012
     * @tc.desc Verify corked data remains ordered when end supplies the final chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new UncorkTestTransform();
      transform.cork();
      transform.write('a', 'utf8');
      transform.end('b', 'utf8');
      let uncorkResult = transform.uncork();
      expect(transform.writableEnded).assertTrue();
      expect(transform.writableCorked).assertEqual(0);
      expect(uncorkResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_UNCORK_1300
     * @tc.name testStreamTransformUncork013
     * @tc.desc Verify three nested cork levels are released one level at a time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformUncork013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new UncorkTestTransform();
      transform.cork();
      transform.cork();
      transform.cork();
      expect(transform.writableCorked).assertEqual(3);
      expect(transform.uncork()).assertTrue();
      expect(transform.writableCorked).assertEqual(2);
      expect(transform.uncork()).assertTrue();
      expect(transform.writableCorked).assertEqual(1);
      expect(transform.uncork()).assertTrue();
      expect(transform.writableCorked).assertEqual(0);
    });

  });
}
