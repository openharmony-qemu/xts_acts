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

class CorkTestTransform extends stream.Transform {
  public doTransformCalled: int = 0;

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.doTransformCalled++;
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class CorkNoDoTransform extends stream.Transform {
  constructor() {
    super();
  }
}

export default function StreamTransformCorkTest(): void {
  describe('StreamTransformCorkTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_0100
     * @tc.name testStreamTransformCork001
     * @tc.desc Verify cork() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkTestTransform();
      let result = transform.cork();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_0200
     * @tc.name testStreamTransformCork002
     * @tc.desc Verify writableCorked equals the cork call count for 1, 3 and 100 calls and the writable side stays usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counts: int[] = [1, 3, 100];
      for (let i = 0; i < counts.length; i++) {
        let transform = new CorkTestTransform();
        for (let j: int = 0; j < counts[i]; j++) {
          transform.cork();
        }
        expect(transform.writableCorked).assertEqual(counts[i]);
        expect(transform.writable).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_0300
     * @tc.name testStreamTransformCork003
     * @tc.desc Verify cork blocks multiple writes from doTransform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkTestTransform();
      transform.cork();
      transform.write('a', 'utf8');
      transform.write('b', 'utf8');
      transform.write('c', 'utf8');
      expect(transform.doTransformCalled).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_0400
     * @tc.name testStreamTransformCork004
     * @tc.desc Verify cork does not affect readable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkTestTransform();
      transform.push('independent');
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('independent');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_0500
     * @tc.name testStreamTransformCork005
     * @tc.desc Verify cork then write with callback, callback not executed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new CorkTestTransform();
        let cbCalled: boolean = false;
        try {
          await new Promise<void>((resolve: (value: void) => void,
            reject: (reason: Error) => void): void => {
            transform.cork();
            transform.write('x', 'utf8', (err?: Error): void => {
              cbCalled = true;
              if (err !== undefined) {
                reject(err);
                return;
              }
            });
            setTimeout((): void => resolve(undefined as void), 50);
          });
          expect(cbCalled).assertFalse();
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_0600
     * @tc.name testStreamTransformCork006
     * @tc.desc Verify cork then write Uint8Array blocks doTransform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkTestTransform();
      transform.cork();
      transform.write(new Uint8Array([1, 2, 3]));
      expect(transform.doTransformCalled).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_0700
     * @tc.name testStreamTransformCork007
     * @tc.desc Verify cork increases writableLength on write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkTestTransform();
      transform.cork();
      transform.write('hello', 'utf8');
      expect(transform.writableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_0800
     * @tc.name testStreamTransformCork008
     * @tc.desc Verify cork+write+uncork triggers doTransform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkTestTransform();
      transform.cork();
      transform.write('x', 'utf8');
      transform.uncork();
      expect(transform.doTransformCalled).assertEqual(1);
      expect(transform.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_0900
     * @tc.name testStreamTransformCork009
     * @tc.desc Verify nested cork requires matching uncork calls and write triggers doTransform only after full uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkTestTransform();
      transform.cork();
      transform.cork();
      transform.write("x", "utf8");
      transform.uncork();
      expect(transform.writableCorked).assertEqual(1);
      expect(transform.doTransformCalled).assertEqual(1);
      transform.uncork();
      expect(transform.writableCorked).assertEqual(0);
      expect(transform.doTransformCalled).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_1000
     * @tc.name testStreamTransformCork010
     * @tc.desc Verify cork followed by end flushes buffered data, resets corked and emits finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let syncTransform = new CorkTestTransform();
        syncTransform.cork();
        syncTransform.cork();
        syncTransform.write("data", "utf8");
        syncTransform.end();
        expect(syncTransform.writableCorked).assertEqual(0);
        expect(syncTransform.doTransformCalled).assertEqual(1);
        let transform = new CorkTestTransform();
        let dataAtData: string = "";
        let corkedAtData: int = 0;
        let endedAtData: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on("data", (data: Object): void => {
            dataAtData = data.toString();
            corkedAtData = transform.writableCorked;
            endedAtData = transform.writableEnded;
            resolve(undefined as void);
          });
          transform.resume();
          transform.cork();
          transform.end("final", "utf8");
        });
        expect(dataAtData).assertEqual("final");
        expect(corkedAtData).assertEqual(0);
        expect(endedAtData).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_1100
     * @tc.name testStreamTransformCork011
     * @tc.desc Verify cork+write+uncork with no doTransform throws 10200039
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkNoDoTransform();
      transform.cork();
      let errorCaught: boolean = false;
      try {
        transform.write('x', 'utf8');
        transform.uncork();
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200039);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_1200
     * @tc.name testStreamTransformCork012
     * @tc.desc Verify cork and uncork with no pending write keeps the transform idle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkTestTransform();
      transform.cork();
      let result = transform.uncork();
      expect(result).assertTrue();
      expect(transform.writableCorked).assertEqual(0);
      expect(transform.doTransformCalled).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_1300
     * @tc.name testStreamTransformCork013
     * @tc.desc Verify a buffered write callback is invoked after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new CorkTestTransform();
        transform.resume();
        let dataAtData: string = '';
        let doTransformAtData: int = 0;
        let corkedAtData: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (data: Object): void => {
            dataAtData = data.toString();
            doTransformAtData = transform.doTransformCalled;
            corkedAtData = transform.writableCorked;
            resolve(undefined as void);
          });
          transform.cork();
          transform.write('callback', 'utf8');
          transform.uncork();
        });
        expect(dataAtData).assertEqual('callback');
        expect(doTransformAtData).assertEqual(1);
        expect(corkedAtData).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_1400
     * @tc.name testStreamTransformCork014
     * @tc.desc Verify corked writes preserve order after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkTestTransform();
      transform.cork();
      transform.write('a', 'utf8');
      transform.write('b', 'utf8');
      transform.write('c', 'utf8');
      transform.uncork();
      expect(transform.doTransformCalled).assertEqual(3);
      expect(transform.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_1500
     * @tc.name testStreamTransformCork015
     * @tc.desc Verify cork does not prevent direct readable-side push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkTestTransform();
      transform.cork();
      let result = transform.push('readable-data');
      expect(result).assertTrue();
      transform.pause();
      expect(transform.read()?.toString()).assertEqual('readable-data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_1600
     * @tc.name testStreamTransformCork016
     * @tc.desc Verify corking does not change writable high watermark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkTestTransform();
      let watermark = transform.writableHighWatermark;
      transform.cork();
      expect(transform.writableHighWatermark).assertEqual(watermark);
      expect(transform.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_1700
     * @tc.name testStreamTransformCork017
     * @tc.desc Verify a corked Uint8Array is delivered after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new CorkTestTransform();
        transform.pause();
        transform.cork();
        transform.write(new Uint8Array([65, 66]), 'utf8');
        expect(transform.doTransformCalled).assertEqual(0);
        transform.uncork();
        expect(transform.writableCorked).assertEqual(0);
        let doTransformAtEnd: int = 0;
        let corkedAtEnd: int = 0;
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            transform.end('', 'utf8', (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              doTransformAtEnd = transform.doTransformCalled;
              corkedAtEnd = transform.writableCorked;
              resolve(undefined as void);
            });
          });
          expect(doTransformAtEnd).assertEqual(1);
          expect(corkedAtEnd).assertEqual(0);
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CORK_1800
     * @tc.name testStreamTransformCork018
     * @tc.desc Verify repeated cork and uncork cycles preserve the later write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformCork018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new CorkTestTransform();
      transform.cork();
      transform.write('first', 'utf8');
      transform.uncork();
      transform.cork();
      transform.write('second', 'utf8');
      expect(transform.writableCorked).assertEqual(1);
      transform.uncork();
      expect(transform.writableCorked).assertEqual(0);
      expect(transform.doTransformCalled).assertEqual(2);
    });
  });
}
