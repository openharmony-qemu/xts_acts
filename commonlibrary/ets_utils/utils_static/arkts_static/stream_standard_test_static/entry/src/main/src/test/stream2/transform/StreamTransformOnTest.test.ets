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
  TestType,
} from '../../../../../hypium/index';
import { stream } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

class OnEventBase extends stream.Transform {
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

class OnErrorTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error('transform failed'));
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class OnCollectTransform extends stream.Transform {
  public chunks: string[] = [];

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.chunks.push(chunk);
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class PipeDestWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, cb: Function): void {
    cb.unsafeCall();
  }
}

export default function StreamTransformOnTest(): void {
  describe('StreamTransformOnTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_0100
     * @tc.name testStreamTransformOn001
     * @tc.desc Verify data listener registration receives one transformed chunk before end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let count: int = 0;
        let dataAtData: string = '';
        let endedAtData: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("data", (data: Object): void => {
            count++;
            dataAtData = data.toString();
            ws.end();
            endedAtData = ws.writableEnded;
            resolve(undefined as void);
          });
          ws.resume();
          ws.write("registered-data", "utf8");
        });
        expect(dataAtData).assertEqual("registered-data");
        expect(count).assertEqual(1);
        expect(endedAtData).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_0200
     * @tc.name testStreamTransformOn002
     * @tc.desc Verify finish listener observes collected data after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("finish", (): void => {
            endedAtFinish = ws.writableEnded;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_0300
     * @tc.name testStreamTransformOn003
     * @tc.desc Verify error listener receives a doFlush failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnErrorTransform();
        let errName: string = '';
        let errMsg: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("error", (error: Error): void => {
            errName = error.name;
            errMsg = error.message;
            resolve(undefined as void);
          });
          ws.write("error-data", "utf8");
        });
        expect(errName).assertEqual("Error");
        expect(errMsg).assertEqual("transform failed");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_0400
     * @tc.name testStreamTransformOn004
     * @tc.desc Verify readable listener observes the buffered transformed chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let readableCount: int = 0;
        let lenAtReadable: number = 0;
        let dataAtReadable: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("readable", (): void => {
            readableCount++;
            lenAtReadable = ws.readableLength;
            let readableChunk: Object = ws.read() as Object;
            dataAtReadable = readableChunk.toString();
            resolve(undefined as void);
          });
          ws.push("readable-data");
        });
        expect(lenAtReadable).assertEqual(13);
        expect(dataAtReadable).assertEqual("readable-data");
        expect(readableCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_0500
     * @tc.name testStreamTransformOn005
     * @tc.desc Verify end listener follows the final transformed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let received: string = "";
        ws.on("data", (data: Object): void => {
          received = data.toString();
        });
        let endedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("end", (): void => {
            endedAtEnd = ws.readableEnded;
            resolve(undefined as void);
          });
          ws.resume();
          ws.push("end-data");
          ws.push(null);
        });
        expect(received).assertEqual("end-data");
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_0600
     * @tc.name testStreamTransformOn006
     * @tc.desc Verify close listener fires after the readable side ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let endedAtClose: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("close", (): void => {
            endedAtClose = ws.readableEnded;
            resolve(undefined as void);
          });
          ws.resume();
          ws.push("close-data");
          ws.push(null);
        });
        expect(endedAtClose).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_0700
     * @tc.name testStreamTransformOn007
     * @tc.desc Verify Transform accepts drain event listener registration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new OnEventBase();
      ws.on("drain", (): void => {
      });
      let result: boolean = ws.write(new Uint8Array(20000), "utf8");
      expect(result).assertFalse();
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_0800
     * @tc.name testStreamTransformOn008
     * @tc.desc Verify pipe listener fires on the writable destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let writable = new PipeDestWritable();
        let writableAtPipe: boolean = false;
        let readableAtPipe: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          writable.on("pipe", (): void => {
            writableAtPipe = writable.writable;
            readableAtPipe = ws.readable;
            ws.unpipe(writable);
            writable.end();
            resolve(undefined as void);
          });
          ws.pipe(writable);
        });
        expect(writableAtPipe).assertTrue();
        expect(readableAtPipe).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_0900
     * @tc.name testStreamTransformOn009
     * @tc.desc Verify unpipe listener fires when the writable destination is detached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let writable = new PipeDestWritable();
        let writableAtUnpipe: boolean = false;
        let readableAtUnpipe: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          writable.on("unpipe", (): void => {
            writableAtUnpipe = writable.writable;
            readableAtUnpipe = ws.readable;
            resolve(undefined as void);
          });
          ws.pipe(writable);
          ws.unpipe(writable);
        });
        expect(writableAtUnpipe).assertTrue();
        expect(readableAtUnpipe).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_1000
     * @tc.name testStreamTransformOn010
     * @tc.desc Verify end event fires after push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let endedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("end", (): void => {
            endedAtEnd = ws.readableEnded;
            resolve(undefined as void);
          });
          ws.resume();
          ws.push(null);
        });
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_1100
     * @tc.name testStreamTransformOn011
     * @tc.desc Verify data event receives transformed chunk content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let dataAtData: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('data', (data: Object): void => {
            dataAtData = data.toString();
            resolve(undefined as void);
          });
          ws.write('event-data', 'utf8');
        });
        expect(dataAtData).assertEqual('event-data');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_1200
     * @tc.name testStreamTransformOn012
     * @tc.desc Verify readable event fires when transformed data is available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let lenAtReadable: number = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('readable', (): void => {
            lenAtReadable = ws.readableLength;
            resolve(undefined as void);
          });
          ws.push('readable-data');
        });
        expect(lenAtReadable).assertEqual(13);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_1300
     * @tc.name testStreamTransformOn013
     * @tc.desc Verify pause event fires after pause is called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let pausedAtPause: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('pause', (): void => {
            pausedAtPause = ws.isPaused();
            resolve(undefined as void);
          });
          ws.pause();
        });
        expect(pausedAtPause).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_1400
     * @tc.name testStreamTransformOn014
     * @tc.desc Verify resume event fires after resume is called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let pausedAtResume: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('resume', (): void => {
            pausedAtResume = ws.isPaused();
            resolve(undefined as void);
          });
          ws.resume();
        });
        expect(pausedAtResume).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_1500
     * @tc.name testStreamTransformOn015
     * @tc.desc Verify multiple data listeners run in registration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let order: string[] = [];
        let orderLength: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('data', (): void => {
            order.push('first');
          });
          ws.on('data', (): void => {
            order.push('second');
          });
          ws.on('end', (): void => {
            orderLength = order.length;
            resolve(undefined as void);
          });
          ws.resume();
          ws.end('order', 'utf8');
        });
        expect(order[0]).assertEqual('first');
        expect(order[1]).assertEqual('second');
        expect(orderLength).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_1600
     * @tc.name testStreamTransformOn016
     * @tc.desc Verify data event fires once per written chunk across listener styles and chunk counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let chunkCounts: int[] = [2, 2, 2, 5];
        let useCollect: boolean[] = [false, true, false, false];
        for (let i = 0; i < chunkCounts.length; i++) {
          let count: int = 0;
          let countAtEnd: int = 0;
          let total: int = chunkCounts[i];
          await new Promise<void>((resolve: (value: void) => void): void => {
            let ws: stream.Transform = useCollect[i] ? new OnCollectTransform() : new OnEventBase();
            ws.on("data", (): void => {
              count++;
            });
            ws.on("end", (): void => {
              countAtEnd = count;
              resolve(undefined as void);
            });
            ws.resume();
            for (let j: int = 0; j < total; j++) {
              ws.write("x", "utf8");
            }
            ws.end();
          });
          expect(countAtEnd).assertEqual(total);
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_1700
     * @tc.name testStreamTransformOn017
     * @tc.desc Verify end event follows the final transformed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let output: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('data', (data: Object): void => {
            output = data.toString();
          });
          ws.on('end', (): void => {
            resolve(undefined as void);
          });
          ws.resume();
          ws.end('last', 'utf8');
        });
        expect(output).assertEqual('last');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_1800
     * @tc.name testStreamTransformOn018
     * @tc.desc Verify a data listener registered after write receives buffered data once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let count: int = 0;
        let dataAtData: string = '';
        let countAtEnd: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.write('buffered', 'utf8');
          ws.on('data', (data: Object): void => {
            count++;
            dataAtData = data.toString();
          });
          ws.on('end', (): void => {
            countAtEnd = count;
            resolve(undefined as void);
          });
          ws.resume();
          ws.end();
        });
        expect(dataAtData).assertEqual('buffered');
        expect(countAtEnd).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_1900
     * @tc.name testStreamTransformOn019
     * @tc.desc Verify data event with gbk encoding still delivers correct content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let dataAtData: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('data', (data: Object): void => {
            dataAtData = data.toString();
            resolve(undefined as void);
          });
          ws.write('中文', 'gbk');
        });
        expect(dataAtData).assertEqual('中文');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_2000
     * @tc.name testStreamTransformOn020
     * @tc.desc Verify finish event fires before close event after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let finishBeforeClose: boolean = false;
        let finishAtClose: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishBeforeClose = true;
          });
          ws.on('close', (): void => {
            finishAtClose = finishBeforeClose;
            resolve(undefined as void);
          });
          ws.resume();
          ws.end();
        });
        expect(finishAtClose).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_2100
     * @tc.name testStreamTransformOn021
     * @tc.desc Verify readable event fires in flowing mode after write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let lenAtReadable: number = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('readable', (): void => {
            lenAtReadable = ws.readableLength;
            resolve(undefined as void);
          });
          ws.resume();
          ws.write('flow-read', 'utf8');
        });
        expect(lenAtReadable).assertEqual(9);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_2200
     * @tc.name testStreamTransformOn022
     * @tc.desc Verify all 8 supported events can be registered without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new OnEventBase();
      ws.on('data', (): void => {
      });
      ws.on('drain', (): void => {
      });
      ws.on('finish', (): void => {
      });
      ws.on('error', (): void => {
      });
      ws.on('close', (): void => {
      });
      ws.on('readable', (): void => {
      });
      ws.on('pipe', (): void => {
      });
      ws.on('unpipe', (): void => {
      });
      expect(ws.readable).assertTrue();
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_2300
     * @tc.name testStreamTransformOn023
     * @tc.desc Verify on registers pause event without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new OnEventBase();
      let errorCode: int = 0;
      try {
        ws.on('pause', (): void => {
        });
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        errorCode = e.code;
      }
      expect(errorCode).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_2400
     * @tc.name testStreamTransformOn024
     * @tc.desc Verify on registers resume event without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new OnEventBase();
      let errorCode: int = 0;
      try {
        ws.on('resume', (): void => {
        });
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        errorCode = e.code;
      }
      expect(errorCode).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_2500
     * @tc.name testStreamTransformOn025
     * @tc.desc Verify on resume event fires after resume()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let pausedAtResume: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('resume', (): void => {
            pausedAtResume = ws.isPaused();
            resolve(undefined as void);
          });
          ws.pause();
          ws.resume();
        });
        expect(pausedAtResume).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_2600
     * @tc.name testStreamTransformOn026
     * @tc.desc Verify on readable fires in pause mode after write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let lenAtReadable: number = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('readable', (): void => {
            lenAtReadable = ws.readableLength;
            resolve(undefined as void);
          });
          ws.write('hello', 'utf8');
        });
        expect(lenAtReadable).assertEqual(5);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_2700
     * @tc.name testStreamTransformOn027
     * @tc.desc Verify a registered drain listener stays pending while the writable buffer is over the high water mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new OnEventBase();
      let drainFired: boolean = false;
      ws.on('drain', (): void => {
        drainFired = true;
      });
      let result: boolean = ws.write(new Uint8Array(20000), 'utf8');
      expect(result).assertFalse();
      expect(drainFired).assertFalse();
      expect(ws.writableHighWatermark).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_2800
     * @tc.name testStreamTransformOn028
     * @tc.desc Verify on pipe fires when Transform is piped to Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let writable: stream.Writable = new stream.Writable();
        let sourceMatch: boolean = false;
        let writableAtPipe: boolean = false;
        let wsReadableAtPipe: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          writable.on('pipe', (source: Object): void => {
            sourceMatch = (source === ws);
            writableAtPipe = writable.writable;
            wsReadableAtPipe = ws.readable;
            resolve(undefined as void);
          });
          ws.pipe(writable);
        });
        expect(sourceMatch).assertTrue();
        expect(writableAtPipe).assertTrue();
        expect(wsReadableAtPipe).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_2900
     * @tc.name testStreamTransformOn029
     * @tc.desc Verify on unpipe fires when pipe is disconnected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let writable: stream.Writable = new stream.Writable();
        let sourceMatch: boolean = false;
        let writableAtUnpipe: boolean = false;
        let wsReadableAtUnpipe: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          writable.on('unpipe', (source: Object): void => {
            sourceMatch = (source === ws);
            writableAtUnpipe = writable.writable;
            wsReadableAtUnpipe = ws.readable;
            resolve(undefined as void);
          });
          ws.pipe(writable);
          ws.unpipe(writable);
        });
        expect(sourceMatch).assertTrue();
        expect(writableAtUnpipe).assertTrue();
        expect(wsReadableAtUnpipe).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_3000
     * @tc.name testStreamTransformOn030
     * @tc.desc Verify on data with emoji chunk delivers content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let dataAtData: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('data', (chunk: Object): void => {
            dataAtData = chunk.toString();
            resolve(undefined as void);
          });
          ws.write('😀', 'utf8');
        });
        expect(dataAtData).assertEqual('😀');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_3100
     * @tc.name testStreamTransformOn031
     * @tc.desc Verify write with empty string throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new OnEventBase();
      let caught: boolean = false;
      try {
        ws.write('', 'utf8');
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_3200
     * @tc.name testStreamTransformOn032
     * @tc.desc Verify on data fires after push(chunk) in flowing mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let dataAtData: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('data', (chunk: Object): void => {
            dataAtData = chunk.toString();
            resolve(undefined as void);
          });
          ws.resume();
          ws.push('hello');
        });
        expect(dataAtData).assertEqual('hello');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_3300
     * @tc.name testStreamTransformOn033
     * @tc.desc Verify on data does not affect writable* properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new OnEventBase();
      ws.on('data', (): void => {
      });
      expect(ws.writable).assertTrue();
      expect(ws.writableEnded).assertFalse();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_3400
     * @tc.name testStreamTransformOn034
     * @tc.desc Verify registering a data listener clears isPaused and sets readableFlowing true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new OnEventBase();
      ws.on('data', (): void => {
      });
      expect(ws.isPaused()).assertFalse();
      expect(ws.readableFlowing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_3500
     * @tc.name testStreamTransformOn035
     * @tc.desc Verify on data fires once for each chunk in pause mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let count: int = 0;
        let countAtEnd: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('data', (): void => {
            count++;
          });
          ws.on('end', (): void => {
            countAtEnd = count;
            resolve(undefined as void);
          });
          ws.pause();
          ws.write('a', 'utf8');
          ws.resume();
          ws.end();
        });
        expect(countAtEnd).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_ON_3600
     * @tc.name testStreamTransformOn036
     * @tc.desc Verify on end fires once after readable end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOn036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new OnEventBase();
        let endCount: int = 0;
        let endCountAtEnd: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('end', (): void => {
            endCount++;
            endCountAtEnd = endCount;
            resolve(undefined as void);
          });
          ws.resume();
          ws.push(null);
        });
        expect(endCountAtEnd).assertEqual(1);

        done();
      });

  });
}
