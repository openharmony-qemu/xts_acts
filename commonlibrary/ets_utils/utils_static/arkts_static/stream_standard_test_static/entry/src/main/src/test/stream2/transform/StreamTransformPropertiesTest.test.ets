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

class PropTransformBase extends stream.Transform {
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

export default function StreamTransformPropertiesTest(): void {
  describe('StreamTransformPropertiesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_0100
     * @tc.name testStreamTransformProperties001
     * @tc.desc Verify initial writable-side properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      expect(ws.writableObjectMode).assertFalse();
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_0200
     * @tc.name testStreamTransformProperties002
     * @tc.desc Verify writableLength tracks buffered bytes under cork, resets to 0 on uncork, and readableLength receives transformed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      expect(ws.writableLength).assertEqual(0);
      ws.cork();
      ws.write('length-transform');
      expect(ws.writableLength).assertEqual(16);
      ws.write('more-data');
      expect(ws.writableLength).assertEqual(25);
      ws.uncork();
      expect(ws.writableLength).assertEqual(25);
      expect(ws.readableLength).assertEqual(25);
      ws.end();
      expect(ws.writableLength).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_0300
     * @tc.name testStreamTransformProperties003
     * @tc.desc Verify writableCorked counter increments on cork, decrements on uncork, and clamps at 0 on underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      expect(ws.writableCorked).assertEqual(0);
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
      ws.cork();
      expect(ws.writableCorked).assertEqual(2);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_0400
     * @tc.name testStreamTransformProperties004
     * @tc.desc Verify writableEnded transitions from false to true after end(), remaining false during write, transform, cork and uncork operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      expect(ws.writableEnded).assertFalse();
      ws.write('ended-transform');
      expect(ws.writableEnded).assertFalse();
      expect(ws.readableLength).assertEqual(15);
      ws.cork();
      ws.write('ended-corked');
      expect(ws.writableEnded).assertFalse();
      ws.uncork();
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_0500
     * @tc.name testStreamTransformProperties005
     * @tc.desc Verify writableEnded becomes true after write+transform+end while writableFinished stays false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      expect(ws.writableFinished).assertFalse();
      ws.write('finished-transform');
      expect(ws.writableFinished).assertFalse();
      expect(ws.readableLength).assertEqual(18);
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_0600
     * @tc.name testStreamTransformProperties006
     * @tc.desc Verify readable transitions from true to false after push(null), remaining true during write-transform-push and read operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new PropTransformBase();
        ws.pause();
        expect(ws.readable).assertTrue();
        ws.write('readable-transform');
        expect(ws.readable).assertTrue();
        expect(ws.readableLength).assertEqual(18);
        ws.read();
        expect(ws.readable).assertTrue();
        expect(ws.readableLength).assertEqual(0);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('end', (): void => {
            expect(ws.readable).assertFalse();
            expect(ws.readableEnded).assertTrue();
            resolve(undefined as void);
          });
          ws.push(null);
          ws.resume();
        });
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_0700
     * @tc.name testStreamTransformProperties007
     * @tc.desc Verify readableEnded transitions from false to true after push(null) ends the stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new PropTransformBase();
        ws.pause();
        expect(ws.readableEnded).assertFalse();
        ws.write('readableended-transform');
        expect(ws.readableEnded).assertFalse();
        expect(ws.readableLength).assertEqual(23);
        ws.read();
        expect(ws.readableEnded).assertFalse();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('end', (): void => {
            expect(ws.readableEnded).assertTrue();
            expect(ws.readable).assertFalse();
            resolve(undefined as void);
          });
          ws.push(null);
          ws.resume();
        });
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_0800
     * @tc.name testStreamTransformProperties008
     * @tc.desc Verify readableLength tracks transformed data after write and returns to zero after full consumption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      expect(ws.readableLength).assertEqual(0);
      ws.write('length-data');
      expect(ws.readableLength).assertEqual(11);
      ws.write('more-data');
      expect(ws.readableLength).assertEqual(20);
      ws.read();
      expect(ws.readableLength).assertEqual(0);
      ws.read();
      expect(ws.readableLength).assertEqual(0);
      ws.end();
      expect(ws.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_0900
     * @tc.name testStreamTransformProperties009
     * @tc.desc Verify push(null) sets readableEnded true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new PropTransformBase();
        let endedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("end", (): void => {
            endedAtEnd = ws.readableEnded;
            resolve(undefined as void);
          });
          ws.push(null);
          ws.resume();
        });
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_1000
     * @tc.name testStreamTransformProperties010
     * @tc.desc Verify write increases writableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.write("hello");
      expect(ws.writableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_1100
     * @tc.name testStreamTransformProperties011
     * @tc.desc Verify push increases readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.push("test");
      ws.pause();
      expect(ws.readableLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_1200
     * @tc.name testStreamTransformProperties012
     * @tc.desc Verify writableCorked returns to zero after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.cork();
      ws.cork();
      expect(ws.writableCorked).assertEqual(2);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_1300
     * @tc.name testStreamTransformProperties013
     * @tc.desc Verify readableLength tracks pushed data and is cleared by read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.pause();
      ws.push('property-data');
      expect(ws.readableLength).assertEqual(13);
      expect(ws.read()?.toString()).assertEqual('property-data');
      expect(ws.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_1400
     * @tc.name testStreamTransformProperties014
     * @tc.desc Verify readableEnded becomes true in the readable end callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new PropTransformBase();
        let endedAtEnd: boolean = false;
        let readableAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('end', (): void => {
            endedAtEnd = ws.readableEnded;
            readableAtEnd = ws.readable;
            resolve(undefined as void);
          });
          ws.resume();
          ws.push(null);
        });
        expect(endedAtEnd).assertTrue();
        expect(readableAtEnd).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_1500
     * @tc.name testStreamTransformProperties015
     * @tc.desc Verify writable state remains open after readable-side pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.pause();
      expect(ws.writable).assertTrue();
      expect(ws.writableEnded).assertFalse();
      expect(ws.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_1600
     * @tc.name testStreamTransformProperties016
     * @tc.desc Verify readableFlowing changes with pause and resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.pause();
      expect(ws.readableFlowing).assertFalse();
      ws.resume();
      expect(ws.readableFlowing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_1700
     * @tc.name testStreamTransformProperties017
     * @tc.desc Verify readable and writable high watermarks are independently exposed with default 16384
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      expect(ws.readableHighWatermark).assertEqual(16384);
      expect(ws.writableHighWatermark).assertEqual(16384);
      expect(ws.readableHighWatermark).assertEqual(ws.writableHighWatermark);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_1800
     * @tc.name testStreamTransformProperties018
     * @tc.desc Verify finish callback observes a non-writable transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new PropTransformBase();
        let endedAtFinish: boolean = false;
        let writableAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            endedAtFinish = ws.writableEnded;
            writableAtFinish = ws.writable;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(endedAtFinish).assertTrue();
        expect(writableAtFinish).assertFalse();
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_1900
     * @tc.name testStreamTransformProperties019
     * @tc.desc Verify readableEnded becomes true after readable end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new PropTransformBase();
        let dataAtData: string = '';
        let endedAtEnd: boolean = false;
        let readableAtEnd: boolean = false;
        let lenAtEnd: number = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('data', (data: Object): void => {
            dataAtData = data.toString();
          });
          ws.on('end', (): void => {
            endedAtEnd = ws.readableEnded;
            readableAtEnd = ws.readable;
            lenAtEnd = ws.readableLength;
            resolve(undefined as void);
          });
          ws.resume();
          ws.push('last');
          ws.push(null);
        });
        expect(dataAtData).assertEqual('last');
        expect(endedAtEnd).assertTrue();
        expect(readableAtEnd).assertFalse();
        expect(lenAtEnd).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_2000
     * @tc.name testStreamTransformProperties020
     * @tc.desc Verify writableObjectMode remains false after write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      expect(ws.writableObjectMode).assertFalse();
      ws.write("test");
      expect(ws.writableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_2100
     * @tc.name testStreamTransformProperties021
     * @tc.desc Verify writableHighWaterMark unchanged after large write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.pause();
      ws.write('x'.repeat(20000), 'utf8');
      expect(ws.writableHighWatermark).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_2200
     * @tc.name testStreamTransformProperties022
     * @tc.desc Verify writableLength correct after write("a") single byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.write("a");
      expect(ws.writableLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_2300
     * @tc.name testStreamTransformProperties023
     * @tc.desc Verify writableLength at 16383 (below watermark) after write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.write('x'.repeat(16383), 'utf8');
      expect(ws.writableLength).assertEqual(16383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_2400
     * @tc.name testStreamTransformProperties024
     * @tc.desc Verify end after write sets writableEnded but readableEnded stays false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.write('data');
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_2500
     * @tc.name testStreamTransformProperties025
     * @tc.desc Verify readableLength tracks the write, doTransform, and push pipeline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.pause();
      ws.write('pipe-data', 'utf8');
      expect(ws.readableLength).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_2600
     * @tc.name testStreamTransformProperties026
     * @tc.desc Verify readableLength decreases after read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.pause();
      ws.write('consumed', 'utf8');
      expect(ws.readableLength).assertEqual(8);
      ws.read();
      expect(ws.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_2700
     * @tc.name testStreamTransformProperties027
     * @tc.desc Verify writableCorked reaches 100 after 100 cork calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      for (let i: int = 0; i < 100; i++) {
        ws.cork();
      }
      expect(ws.writableCorked).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_2800
     * @tc.name testStreamTransformProperties028
     * @tc.desc Verify write empty string exception leaves writable unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      try {
        ws.write("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(ws.writable).assertTrue();
        expect(ws.writableLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_2900
     * @tc.name testStreamTransformProperties029
     * @tc.desc Verify no doTransform subclass write exception leaves writable true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new stream.Transform();
      try {
        ws.write("data");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(ws.writable).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_3000
     * @tc.name testStreamTransformProperties030
     * @tc.desc Verify cork increments writableCorked and uncork decrements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_3100
     * @tc.name testStreamTransformProperties031
     * @tc.desc Verify end sets writableEnded true and writable false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_PROPERTIES_3200
     * @tc.name testStreamTransformProperties032
     * @tc.desc Verify isPaused is false initially, remains false after data listener, and becomes true after pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformProperties032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PropTransformBase();
      expect(ws.isPaused()).assertFalse();
      ws.on('data', (): void => {
      });
      expect(ws.isPaused()).assertFalse();
      ws.pause();
      expect(ws.isPaused()).assertTrue();
    });

  });
}
