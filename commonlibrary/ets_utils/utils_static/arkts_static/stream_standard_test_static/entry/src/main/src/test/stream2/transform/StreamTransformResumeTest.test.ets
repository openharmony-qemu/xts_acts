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

class ResumeTestTransform extends stream.Transform {
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

class ResumeWritable extends stream.Writable {
  public doWriteCallCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doWriteCallCount++;
    callback.unsafeCall();
  }
}

export default function StreamTransformResumeTest(): void {
  describe('StreamTransformResumeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_0100
     * @tc.name testStreamTransformResume001
     * @tc.desc Verify resume after pause clears isPaused and leaves writableLength and all readable* properties unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      transform.resume();
      expect(transform.isPaused()).assertFalse();
      expect(transform.writableLength).assertEqual(0);
      expect(transform.readableEnded).assertFalse();
      expect(transform.readableHighWatermark).assertEqual(16384);
      expect(transform.readableObjectMode).assertFalse();
      expect(transform.readableFlowing).assertTrue();
      expect(transform.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_0200
     * @tc.name testStreamTransformResume002
     * @tc.desc Verify resume after pause triggers buffered data via data event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        let outputs: string[] = [];
        transform.on('data', (data: Object): void => {
          outputs.push(data.toString());
        });
        let lenAtEnd: number = 0;
        let firstAtEnd: string = '';
        let secondAtEnd: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            lenAtEnd = outputs.length;
            firstAtEnd = outputs[0];
            secondAtEnd = outputs[1];
            resolve(undefined as void);
          });
          transform.pause();
          transform.write('a', 'utf8');
          transform.write('b', 'utf8');
          transform.resume();
          transform.end();
        });
        expect(lenAtEnd).assertEqual(2);
        expect(firstAtEnd).assertEqual('a');
        expect(secondAtEnd).assertEqual('b');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_0300
     * @tc.name testStreamTransformResume003
     * @tc.desc Verify resume on an already flowing stream still returns this instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      let result = transform.resume();
      expect(result).assertEqual(transform);
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_0400
     * @tc.name testStreamTransformResume004
     * @tc.desc Verify resume after pause then new write triggers data event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        let output: string = '';
        transform.on('data', (data: Object): void => {
          output = data.toString();
        });
        let outputAtEnd: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            outputAtEnd = output;
            resolve(undefined as void);
          });
          transform.pause();
          transform.resume();
          transform.write('y', 'utf8');
          transform.end();
        });
        expect(outputAtEnd).assertEqual('y');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_0500
     * @tc.name testStreamTransformResume005
     * @tc.desc Verify resume flushes buffered data in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        let outputs: string[] = [];
        transform.on('data', (data: Object): void => {
          outputs.push(data.toString());
        });
        let lenAtEnd: number = 0;
        let firstAtEnd: string = '';
        let secondAtEnd: string = '';
        let thirdAtEnd: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            lenAtEnd = outputs.length;
            firstAtEnd = outputs[0];
            secondAtEnd = outputs[1];
            thirdAtEnd = outputs[2];
            resolve(undefined as void);
          });
          transform.pause();
          transform.write('a', 'utf8');
          transform.write('b', 'utf8');
          transform.write('c', 'utf8');
          transform.resume();
          transform.end();
        });
        expect(lenAtEnd).assertEqual(3);
        expect(firstAtEnd).assertEqual('a');
        expect(secondAtEnd).assertEqual('b');
        expect(thirdAtEnd).assertEqual('c');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_0600
     * @tc.name testStreamTransformResume006
     * @tc.desc Verify resume does not affect writable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      transform.resume();
      let result = transform.write('x', 'utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_0700
     * @tc.name testStreamTransformResume007
     * @tc.desc Verify resume delivers data pushed before the listener is attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        transform.pause();
        transform.push('preloaded');
        transform.push(null);
        let dataAtData: string = '';
        transform.on('data', (data: Object): void => {
          dataAtData = data.toString();
        });
        let readableEndedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            readableEndedAtEnd = transform.readableEnded;
            resolve(undefined as void);
          });
          transform.resume();
        });
        expect(dataAtData).assertEqual('preloaded');
        expect(readableEndedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_0800
     * @tc.name testStreamTransformResume008
     * @tc.desc Verify repeated resume calls keep the stream flowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      transform.resume();
      transform.resume();
      transform.resume();
      expect(transform.isPaused()).assertFalse();
      expect(transform.readableFlowing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_0900
     * @tc.name testStreamTransformResume009
     * @tc.desc Verify resume flushes a buffered Uint8Array without changing bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        transform.pause();
        transform.push(new Uint8Array([0, 1, 2]));
        transform.resume();
        let data = transform.read();
        let bytes: buffer.Buffer = data as buffer.Buffer;
        expect(bytes.length).assertEqual(3);
        expect(bytes[0]).assertEqual(0);
        expect(bytes[2]).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_1000
     * @tc.name testStreamTransformResume010
     * @tc.desc Verify resume after a pause releases multiple writes in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
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
          transform.pause();
          transform.write('one', 'utf8');
          transform.write('two', 'utf8');
          transform.write('three', 'utf8');
          transform.resume();
          transform.end();
        });
        expect(outputAtEnd).assertEqual('onetwothree');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_1100
     * @tc.name testStreamTransformResume011
     * @tc.desc Verify resume changes only the readable flow state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      let writableBefore = transform.writable;
      transform.resume();
      expect(transform.writable).assertEqual(writableBefore);
      expect(transform.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_1200
     * @tc.name testStreamTransformResume012
     * @tc.desc Verify resume enables a piped transform to finish normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        let writable = new ResumeWritable();
        let pausedAtEnd: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            pausedAtEnd = transform.isPaused();
            resolve(undefined as void);
          });
          transform.pause();
          transform.pipe(writable);
          transform.resume();
          transform.push('pipe');
          transform.push(null);
        });
        expect(pausedAtEnd).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_1300
     * @tc.name testStreamTransformResume013
     * @tc.desc Verify resume followed by end emits the finish state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('finish', (): void => {
            endedAtFinish = transform.writableEnded;
            finishedAtFinish = transform.writableFinished;
            resolve(undefined as void);
          });
          transform.pause();
          transform.resume();
          transform.end();
        });
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_1400
     * @tc.name testStreamTransformResume014
     * @tc.desc Verify resume on an empty stream still reaches readable end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        let readableEndedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            readableEndedAtEnd = transform.readableEnded;
            resolve(undefined as void);
          });
          transform.pause();
          transform.push(null);
          transform.resume();
        });
        expect(readableEndedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_1500
     * @tc.name testStreamTransformResume015
     * @tc.desc Verify abnormal pause-write-resume order changes flow state without forcing end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      let result: boolean = transform.write('first', 'utf8');
      transform.resume();
      expect(result).assertTrue();
      expect(transform.isPaused()).assertFalse();
      expect(transform.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_1600
     * @tc.name testStreamTransformResume016
     * @tc.desc Verify abnormal end-before-resume order leaves resume state observable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      transform.end();
      transform.resume();
      expect(transform.writableEnded).assertTrue();
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_1700
     * @tc.name testStreamTransformResume017
     * @tc.desc Verify resume event observes the flowing readable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        let pausedAtResume: boolean = true;
        let flowingAtResume: boolean | null = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('resume', (): void => {
            pausedAtResume = transform.isPaused();
            flowingAtResume = transform.readableFlowing;
            resolve(undefined as void);
          });
          transform.pause();
          transform.resume();
        });
        expect(pausedAtResume).assertFalse();
        expect(flowingAtResume).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_1800
     * @tc.name testStreamTransformResume018
     * @tc.desc Verify resume after pause returns the Transform instance and clears the paused state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      let result: Object = transform.resume();
      expect(result).assertEqual(transform);
      expect((result as stream.Transform).isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_1900
     * @tc.name testStreamTransformResume019
     * @tc.desc Verify resume on already flowing stream keeps isPaused false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.resume();
      transform.resume();
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_2000
     * @tc.name testStreamTransformResume020
     * @tc.desc Verify resume does not affect writable* properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      transform.resume();
      expect(transform.writable).assertTrue();
      expect(transform.writableEnded).assertFalse();
      expect(transform.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_2100
     * @tc.name testStreamTransformResume021
     * @tc.desc Verify resume keeps writable open for end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      transform.resume();
      transform.end();
      expect(transform.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_2200
     * @tc.name testStreamTransformResume022
     * @tc.desc Verify resume keeps writable open for cork/uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      transform.resume();
      transform.cork();
      expect(transform.writableCorked).assertEqual(1);
      transform.uncork();
      expect(transform.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_2300
     * @tc.name testStreamTransformResume023
     * @tc.desc Verify resume keeps writable open for setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      transform.resume();
      let result: boolean = transform.setEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_2400
     * @tc.name testStreamTransformResume024
     * @tc.desc Verify resume keeps writable open for setDefaultEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      transform.resume();
      let result: boolean = transform.setDefaultEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_2500
     * @tc.name testStreamTransformResume025
     * @tc.desc Verify resume readableLength 0 after push in flowing mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        let lenAtData: number = -1;
        transform.on('data', (): void => {
          lenAtData = transform.readableLength;
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            resolve(undefined as void);
          });
          transform.resume();
          transform.push('hello');
          transform.push(null);
        });
        expect(lenAtData).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_2600
     * @tc.name testStreamTransformResume026
     * @tc.desc Verify resume state independent across Transform instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = new ResumeTestTransform();
      let t2 = new ResumeTestTransform();
      t1.pause();
      t1.resume();
      expect(t1.isPaused()).assertFalse();
      expect(t2.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_2700
     * @tc.name testStreamTransformResume027
     * @tc.desc Verify resume after pause with emoji flushes content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        let received: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (chunk: Object): void => {
            received = chunk.toString();
            resolve(undefined as void);
          });
          transform.pause();
          transform.push('😀');
          transform.resume();
        });
        expect(received).assertEqual('😀');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_2800
     * @tc.name testStreamTransformResume028
     * @tc.desc Verify resume after pause with empty string does not fire data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      let fired: boolean = false;
      transform.on('data', (): void => {
        fired = true;
      });
      transform.pause();
      transform.push('');
      transform.resume();
      expect(fired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_2900
     * @tc.name testStreamTransformResume029
     * @tc.desc Verify resume after pause push(null) reaches readable end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        let endCount: int = 0;
        let endPromise = new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            endCount++;
            resolve(undefined as void);
          });
        });
        transform.pause();
        transform.push(null);
        transform.resume();
        await endPromise;
        expect(endCount).assertEqual(1);
        expect(transform.readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_3000
     * @tc.name testStreamTransformResume030
     * @tc.desc Verify pause resume pause resume cycle keeps the stream flowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      transform.resume();
      transform.pause();
      transform.resume();
      expect(transform.isPaused()).assertFalse();
      expect(transform.readableFlowing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_3100
     * @tc.name testStreamTransformResume031
     * @tc.desc Verify resume pause resume pause returns to paused state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new ResumeTestTransform();
      transform.pause();
      transform.resume();
      transform.pause();
      expect(transform.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_3200
     * @tc.name testStreamTransformResume032
     * @tc.desc Verify resume followed by end emits finish state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        let finishCount: int = 0;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('finish', (): void => {
            finishCount++;
            resolve(undefined as void);
          });
        });
        transform.resume();
        transform.end();
        await finishPromise;
        expect(finishCount).assertEqual(1);
        expect(transform.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_RESUME_3300
     * @tc.name testStreamTransformResume033
     * @tc.desc Verify resume event fires once per resume call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformResume033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new ResumeTestTransform();
        let count: int = 0;
        let countAtResume: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('resume', (): void => {
            count++;
            countAtResume = count;
            resolve(undefined as void);
          });
          transform.pause();
          transform.resume();
        });
        expect(countAtResume).assertEqual(1);
        done();
      });

  });
}
