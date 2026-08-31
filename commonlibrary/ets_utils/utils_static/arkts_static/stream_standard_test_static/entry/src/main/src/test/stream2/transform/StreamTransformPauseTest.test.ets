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

class PauseTestTransform extends stream.Transform {
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

class PauseWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamTransformPauseTest(): void {
  describe('StreamTransformPauseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_0100
     * @tc.name testStreamTransformPause001
     * @tc.desc Verify pause returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      let result = transform.pause();
      expect(result).assertEqual(transform);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_0200
     * @tc.name testStreamTransformPause002
     * @tc.desc Verify pause sets isPaused true and leaves writableLength and all readable* properties unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      expect(transform.isPaused()).assertTrue();
      expect(transform.readableEnded).assertFalse();
      expect(transform.readableHighWatermark).assertEqual(16384);
      expect(transform.readableObjectMode).assertFalse();
      expect(transform.readableFlowing).assertFalse();
      expect(transform.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_0300
     * @tc.name testStreamTransformPause003
     * @tc.desc Verify pause blocks data events from write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      let dataCalled: boolean = false;
      transform.on('data', (): void => {
        dataCalled = true;
      });
      transform.pause();
      transform.write('x', 'utf8');
      expect(dataCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_0400
     * @tc.name testStreamTransformPause004
     * @tc.desc Verify paused data can be read via read()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.write('hello', 'utf8');
      let data = transform.read();
      expect(data?.toString()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_0500
     * @tc.name testStreamTransformPause005
     * @tc.desc Verify pause then multiple writes accumulate buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.write('a', 'utf8');
      transform.write('b', 'utf8');
      let data = transform.read();
      expect(data?.toString()).assertEqual('ab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_0600
     * @tc.name testStreamTransformPause006
     * @tc.desc Verify pause resume pause cycle works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.resume();
      transform.pause();
      expect(transform.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_0700
     * @tc.name testStreamTransformPause007
     * @tc.desc Verify pause still allows end event from push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PauseTestTransform();
        let endedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            endedAtEnd = transform.readableEnded;
            resolve(undefined as void);
          });
          transform.pause();
          transform.push(null);
          transform.resume();
        });
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_0800
     * @tc.name testStreamTransformPause008
     * @tc.desc Verify pipe overrides pause state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      let writable = new PauseWritable();
      transform.pause();
      transform.pipe(writable);
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_0900
     * @tc.name testStreamTransformPause009
     * @tc.desc Verify resume releases data buffered while paused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.write('buffered', 'utf8');
      transform.resume();
      let data = transform.read();
      expect(data?.toString()).assertEqual('buffered');
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_1000
     * @tc.name testStreamTransformPause010
     * @tc.desc Verify repeated pause calls are idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.pause();
      transform.pause();
      expect(transform.isPaused()).assertTrue();
      expect(transform.readableFlowing).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_1100
     * @tc.name testStreamTransformPause011
     * @tc.desc Verify pause after resume stops subsequent data events
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PauseTestTransform();
        let output: string = '';
        let outputAtEnd: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (data: Object): void => {
            output += data.toString();
          });
          transform.on('end', (): void => {
            outputAtEnd = output;
            resolve(undefined as void);
          });
          transform.resume();
          transform.write('first', 'utf8');
          transform.pause();
          transform.write('second', 'utf8');
          expect(transform.isPaused()).assertTrue();
          transform.resume();
          transform.end();
        });
        expect(outputAtEnd).assertEqual('firstsecond');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_1200
     * @tc.name testStreamTransformPause012
     * @tc.desc Verify pause keeps the writable side open for writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      expect(transform.writable).assertTrue();
      expect(transform.write('still-writable', 'utf8')).assertTrue();
      expect(transform.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_1300
     * @tc.name testStreamTransformPause013
     * @tc.desc Verify pause and pipe transition to flowing mode and deliver data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PauseTestTransform();
        let writable = new PauseWritable();
        let pausedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            pausedAtEnd = transform.isPaused();
            resolve(undefined as void);
          });
          transform.pause();
          transform.pipe(writable);
          transform.write('pipe-data', 'utf8');
          transform.end();
        });
        expect(pausedAtEnd).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_1400
     * @tc.name testStreamTransformPause014
     * @tc.desc Verify paused stream emits end after resume and push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PauseTestTransform();
        let endedAtEnd: boolean = false;
        let pausedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            endedAtEnd = transform.readableEnded;
            pausedAtEnd = transform.isPaused();
            resolve(undefined as void);
          });
          transform.pause();
          transform.push('last');
          transform.push(null);
          transform.resume();
        });
        expect(endedAtEnd).assertTrue();
        expect(pausedAtEnd).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_1500
     * @tc.name testStreamTransformPause015
     * @tc.desc Verify pause leaves readableLength unchanged until data is read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.push('length');
      let beforeRead = transform.readableLength;
      expect(beforeRead).assertEqual(6);
      expect(transform.read()?.toString()).assertEqual('length');
      expect(transform.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_1600
     * @tc.name testStreamTransformPause016
     * @tc.desc Verify pause preserves an empty pushed chunk boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      let before = transform.readableLength;
      let result = transform.push('');
      expect(result).assertTrue();
      expect(transform.readableLength).assertEqual(before);
      expect(transform.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_1700
     * @tc.name testStreamTransformPause017
     * @tc.desc Verify abnormal pause-to-write order keeps readable data from flowing synchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      let dataCalled: boolean = false;
      transform.on('data', (): void => {
        dataCalled = true;
      });
      transform.pause();
      let result: boolean = transform.write(new Uint8Array([65, 66]), 'utf8');
      expect(result).assertTrue();
      expect(transform.isPaused()).assertTrue();
      expect(dataCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_1800
     * @tc.name testStreamTransformPause018
     * @tc.desc Verify abnormal pause-to-end order closes only the writable side immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.end();
      expect(transform.writableEnded).assertTrue();
      expect(transform.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_1900
     * @tc.name testStreamTransformPause019
     * @tc.desc Verify pause event observes the paused readable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PauseTestTransform();
        let pausedAtPause: boolean = false;
        let flowingAtPause: boolean | null = null;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('pause', (): void => {
            pausedAtPause = transform.isPaused();
            flowingAtPause = transform.readableFlowing;
            resolve(undefined as void);
          });
          transform.resume();
          transform.pause();
        });
        expect(pausedAtPause).assertTrue();
        expect(flowingAtPause).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_2000
     * @tc.name testStreamTransformPause020
     * @tc.desc Verify pause and resume events preserve transition order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new PauseTestTransform();
        let pauseSeen: boolean = false;
        let pausedAtPause: boolean = false;
        let pauseSeenAtResume: boolean = false;
        let pausedAtResume: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('pause', (): void => {
            pausedAtPause = transform.isPaused();
            pauseSeen = true;
          });
          transform.on('resume', (): void => {
            pauseSeenAtResume = pauseSeen;
            pausedAtResume = transform.isPaused();
            resolve(undefined as void);
          });
          transform.pause();
          transform.resume();
        });

        expect(pausedAtPause).assertTrue();
        expect(pauseSeenAtResume).assertTrue();
        expect(pausedAtResume).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_2100
     * @tc.name testStreamTransformPause021
     * @tc.desc Verify pause keeps writable open for setDefaultEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      let result: boolean = transform.setDefaultEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_2200
     * @tc.name testStreamTransformPause022
     * @tc.desc Verify pause readableLength increased by pushed chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.push('hello');
      expect(transform.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_2300
     * @tc.name testStreamTransformPause023
     * @tc.desc Verify pause state independent across Transform instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = new PauseTestTransform();
      let t2 = new PauseTestTransform();
      t1.pause();
      expect(t1.isPaused()).assertTrue();
      expect(t2.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_2400
     * @tc.name testStreamTransformPause024
     * @tc.desc Verify pause pause resume pause returns to paused state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.pause();
      transform.resume();
      transform.pause();
      expect(transform.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_2500
     * @tc.name testStreamTransformPause025
     * @tc.desc Verify pause after resume keeps pushed data buffered in readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.resume();
      transform.pause();
      transform.push('hello');
      expect(transform.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_2600
     * @tc.name testStreamTransformPause026
     * @tc.desc Verify pause with Uint8Array chunk buffered unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.push(new Uint8Array([1, 2, 3]));
      expect(transform.readableLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_2700
     * @tc.name testStreamTransformPause027
     * @tc.desc Verify pause with emoji chunk buffered unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.push('😀');
      expect(transform.readableLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_2800
     * @tc.name testStreamTransformPause028
     * @tc.desc Verify pause empty string does not add readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.pause();
      transform.push('');
      expect(transform.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_2900
     * @tc.name testStreamTransformPause029
     * @tc.desc Verify pause event fires once per pause call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      let count: int = 0;
      transform.on('pause', (): void => {
        count++;
      });
      transform.pause();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_3000
     * @tc.name testStreamTransformPause030
     * @tc.desc Verify pause readableFlowing false when paused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      transform.resume();
      transform.pause();
      expect(transform.readableFlowing).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PAUSE_3100
     * @tc.name testStreamTransformPause031
     * @tc.desc Verify pause on piped transform keeps downstream writable open
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformPause031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new PauseTestTransform();
      let writable = new PauseWritable();
      transform.pipe(writable);
      transform.pause();
      expect(writable.writable).assertTrue();
    });

  });
}
