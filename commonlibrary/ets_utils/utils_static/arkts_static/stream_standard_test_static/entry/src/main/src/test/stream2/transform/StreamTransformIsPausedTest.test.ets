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

class IpTestTransform extends stream.Transform {
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

class IpWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamTransformIsPausedTest(): void {
  describe('StreamTransformIsPausedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_0100
     * @tc.name testStreamTransformIsPaused001
     * @tc.desc Verify pause() sets isPaused to true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.pause();
      expect(transform.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_0200
     * @tc.name testStreamTransformIsPaused002
     * @tc.desc Verify on(data) sets isPaused to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.on('data', (): void => {
      });
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_0300
     * @tc.name testStreamTransformIsPaused003
     * @tc.desc Verify multiple pauses keep isPaused true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.pause();
      expect(transform.isPaused()).assertTrue();
      transform.pause();
      expect(transform.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_0400
     * @tc.name testStreamTransformIsPaused004
     * @tc.desc Verify pipe sets isPaused to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      let writable = new IpWritable();
      transform.pause();
      transform.pipe(writable);
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_0500
     * @tc.name testStreamTransformIsPaused005
     * @tc.desc Verify write does not affect isPaused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.write('x', 'utf8');
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_0600
     * @tc.name testStreamTransformIsPaused006
     * @tc.desc Verify repeated resume calls keep isPaused false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.pause();
      transform.resume();
      transform.resume();
      transform.resume();
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_0700
     * @tc.name testStreamTransformIsPaused007
     * @tc.desc Verify data remains buffered while isPaused is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.pause();
      transform.push('paused-data');
      expect(transform.isPaused()).assertTrue();
      expect(transform.readableLength).assertEqual(11);
      expect(transform.read()?.toString()).assertEqual('paused-data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_0800
     * @tc.name testStreamTransformIsPaused008
     * @tc.desc Verify pipe changes isPaused to false and allows readable end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new IpTestTransform();
        let writable = new IpWritable();
        let pausedAtEnd: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            pausedAtEnd = transform.isPaused();
            resolve(undefined as void);
          });
          transform.pause();
          transform.pipe(writable);
          expect(transform.isPaused()).assertFalse();
          transform.push('pipe-data');
          transform.push(null);
        });
        expect(pausedAtEnd).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_0900
     * @tc.name testStreamTransformIsPaused009
     * @tc.desc Verify a readable end leaves the transform unpaused after resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new IpTestTransform();
        let endedAtEnd: boolean = false;
        let pausedAtEnd: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            endedAtEnd = transform.readableEnded;
            pausedAtEnd = transform.isPaused();
            resolve(undefined as void);
          });
          transform.pause();
          transform.push(null);
          transform.resume();
        });
        expect(endedAtEnd).assertTrue();
        expect(pausedAtEnd).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_1000
     * @tc.name testStreamTransformIsPaused010
     * @tc.desc Verify adding a data listener keeps the stream flowing after a pause resume cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.on('data', (): void => {
      });
      transform.pause();
      expect(transform.isPaused()).assertTrue();
      transform.resume();
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_1100
     * @tc.name testStreamTransformIsPaused011
     * @tc.desc Verify resume before push keeps the stream flowing through readable end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new IpTestTransform();
        let dataAtData: string = '';
        let pausedAtEnd: boolean = true;
        let endedAtEnd: boolean = false;
        transform.on('data', (data: Object): void => {
          dataAtData = data.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            pausedAtEnd = transform.isPaused();
            endedAtEnd = transform.readableEnded;
            resolve(undefined as void);
          });
          transform.pause();
          transform.resume();
          transform.push('flowing');
          transform.push(null);
        });
        expect(dataAtData).assertEqual('flowing');
        expect(pausedAtEnd).assertFalse();
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_1200
     * @tc.name testStreamTransformIsPaused012
     * @tc.desc Verify isPaused remains false while Uint8Array data flows to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new IpTestTransform();
        let output: string = '';
        let pausedAtData: boolean = false;
        let dataAtData: string = '';
        transform.on('data', (data: Object): void => {
          pausedAtData = transform.isPaused();
          dataAtData = data.toString();
          output += data.toString();
        });
        let endedAtEnd: boolean = false;
        let pausedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            endedAtEnd = transform.readableEnded;
            pausedAtEnd = transform.isPaused();
            resolve(undefined as void);
          });
          transform.resume();
          transform.push(new Uint8Array([98, 121, 116, 101, 115]));
          transform.push(null);
        });
        expect(pausedAtData).assertFalse();
        expect(dataAtData).assertEqual('bytes');
        expect(output).assertEqual('bytes');
        expect(endedAtEnd).assertTrue();
        expect(pausedAtEnd).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_1300
     * @tc.name testStreamTransformIsPaused013
     * @tc.desc Verify isPaused is true while a pushed Uint8Array remains buffered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.pause();
      let pushed: boolean = transform.push(new Uint8Array([65, 66, 67]));
      expect(pushed).assertTrue();
      expect(transform.isPaused()).assertTrue();
      expect(transform.readableLength).assertEqual(3);
      expect(transform.read()?.toString()).assertEqual('ABC');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_1400
     * @tc.name testStreamTransformIsPaused014
     * @tc.desc Verify isPaused is true after pause and false after resume()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.pause();
      expect(transform.isPaused()).assertTrue();
      transform.resume();
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_1500
     * @tc.name testStreamTransformIsPaused015
     * @tc.desc Verify isPaused false after resume, write does not change isPaused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.resume();
      transform.write('hello', 'utf8');
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_1600
     * @tc.name testStreamTransformIsPaused016
     * @tc.desc Verify isPaused false after cork/uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.cork();
      expect(transform.isPaused()).assertFalse();
      transform.uncork();
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_1700
     * @tc.name testStreamTransformIsPaused017
     * @tc.desc Verify isPaused false after setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.setEncoding('utf8');
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_1800
     * @tc.name testStreamTransformIsPaused018
     * @tc.desc Verify isPaused false after setDefaultEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.setDefaultEncoding('utf8');
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_1900
     * @tc.name testStreamTransformIsPaused019
     * @tc.desc Verify isPaused false after resume, push does not change isPaused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.resume();
      transform.push('hello');
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_2000
     * @tc.name testStreamTransformIsPaused020
     * @tc.desc Verify isPaused state alternates across pause/resume cycles and returns to paused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      expect(transform.isPaused()).assertFalse();
      transform.pause();
      expect(transform.isPaused()).assertTrue();
      transform.resume();
      expect(transform.isPaused()).assertFalse();
      transform.pause();
      expect(transform.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_2100
     * @tc.name testStreamTransformIsPaused021
     * @tc.desc Verify on(data) does not override an explicit pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.pause();
      transform.on('data', (chunk: Object): void => {
      });
      expect(transform.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_2200
     * @tc.name testStreamTransformIsPaused022
     * @tc.desc Verify isPaused false after resume keeps flowing through readable end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new IpTestTransform();
        let pausedAtEnd: boolean = true;
        let endedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            pausedAtEnd = transform.isPaused();
            endedAtEnd = transform.readableEnded;
            resolve(undefined as void);
          });
          transform.pause();
          transform.push('hello');
          transform.resume();
          transform.push(null);
        });
        expect(pausedAtEnd).assertFalse();
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_2300
     * @tc.name testStreamTransformIsPaused023
     * @tc.desc Verify isPaused true while pushed string remains buffered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.pause();
      transform.push('hello');
      expect(transform.isPaused()).assertTrue();
      expect(transform.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_2400
     * @tc.name testStreamTransformIsPaused024
     * @tc.desc Verify isPaused true after pause keeps writable open for writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.pause();
      let result: boolean = transform.write('hello', 'utf8');
      expect(result).assertTrue();
      expect(transform.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_2500
     * @tc.name testStreamTransformIsPaused025
     * @tc.desc Verify isPaused true after pause does not prevent writable end, end closes only the writable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      transform.pause();
      transform.end();
      expect(transform.isPaused()).assertTrue();
      expect(transform.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_2600
     * @tc.name testStreamTransformIsPaused026
     * @tc.desc Verify isPaused state visible to readable listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new IpTestTransform();
        let observed: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('readable', (): void => {
            observed = transform.isPaused();
            resolve(undefined as void);
          });
          transform.write('hello', 'utf8');
        });
        expect(observed).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_2700
     * @tc.name testStreamTransformIsPaused027
     * @tc.desc Verify isPaused false after resume event fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new IpTestTransform();
        let observed: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('resume', (): void => {
            observed = transform.isPaused();
            resolve(undefined as void);
          });
          transform.pause();
          transform.resume();
        });
        expect(observed).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_2800
     * @tc.name testStreamTransformIsPaused028
     * @tc.desc Verify isPaused true after pause event fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new IpTestTransform();
        let observed: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('pause', (): void => {
            observed = transform.isPaused();
            resolve(undefined as void);
          });
          transform.pause();
        });
        expect(observed).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_2900
     * @tc.name testStreamTransformIsPaused029
     * @tc.desc Verify isPaused false while flowing mode data flushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new IpTestTransform();
        let observedDuringData: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (chunk: Object): void => {
            observedDuringData = transform.isPaused();
            resolve(undefined as void);
          });
          transform.write('hello', 'utf8');
        });
        expect(observedDuringData).assertFalse();

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_3000
     * @tc.name testStreamTransformIsPaused030
     * @tc.desc Verify default isPaused is false (flowing mode) and does not affect writableFinished
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new IpTestTransform();
      expect(transform.isPaused()).assertFalse();
      expect(transform.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_IS_PAUSED_3100
     * @tc.name testStreamTransformIsPaused031
     * @tc.desc Verify isPaused state independent across Transform instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformIsPaused031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = new IpTestTransform();
      let t2 = new IpTestTransform();
      t1.pause();
      expect(t1.isPaused()).assertTrue();
      expect(t2.isPaused()).assertFalse();
    });

  });
}
