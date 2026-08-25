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
import { FlowCollectWritable, ScenarioReadable } from '../../StreamComposeTestBase';

class WritableLifecycleResult {
  public sink: FlowCollectWritable;
  public order: string[];

  constructor(sink: FlowCollectWritable, order: string[]) {
    this.sink = sink;
    this.order = order;
  }
}

function completeLifecycleFlow(
  chunks: string[], endData: string, corkDepth: int, releaseDepth: int, useDefaultEncoding: boolean,
): Promise<WritableLifecycleResult> {
  return new Promise<WritableLifecycleResult>((resolve: (result: WritableLifecycleResult) => void): void => {
    let sink = new FlowCollectWritable();
    let order: string[] = [];
    if (useDefaultEncoding) {
      sink.setDefaultEncoding('utf8');
    }
    sink.on('finish', (): void => {
      order.push('finish');
      resolve(new WritableLifecycleResult(sink, order));
    });
    for (let index: int = 0; index < corkDepth; index++) {
      sink.cork();
    }
    for (let index: int = 0; index < chunks.length; index++) {
      sink.write(chunks[index], 'utf8');
    }
    for (let index: int = 0; index < releaseDepth; index++) {
      sink.uncork();
    }
    sink.end(endData, 'utf8');
  });
}

export default function StreamWritableLifecycleFlowTest(): void {
  describe('StreamWritableLifecycleFlowTest', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_0100
     * @tc.name testStreamWritableLifecycleFlow001
     * @tc.desc Verify end without data closes the writable stream without a data write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        let finished: boolean = false;
        sink.on('finish', (): void => {
          finished = true;
        });
        sink.end();
        await new Promise<void>((resolve: (value: void) => void): void => {
          sink.on('close', (): void => resolve(undefined as void));
        });
        expect(finished).assertTrue();
        expect(sink.writeCount).assertEqual(0);
        expect(sink.text).assertEqual('');
        expect(sink.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_0200
     * @tc.name testStreamWritableLifecycleFlow002
     * @tc.desc Verify a final end callback observes data written before finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        let callbackText: string = '';
        sink.write('head', 'utf8');
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          sink.on('finish', (): void => resolve(undefined as void));
        });
        sink.end('tail', 'utf8', (): void => {
          callbackText = sink.text;
        });
        try {
          await finishPromise;
        } catch (e) {
          expect('unexpected error: ' + e.message).assertEqual('');
          done();
          return;
        }
        expect(callbackText).assertEqual('headtail');
        expect(sink.writeCount).assertEqual(2);
        expect(sink.chunks[1]).assertEqual('tail');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_0300
     * @tc.name testStreamWritableLifecycleFlow003
     * @tc.desc Verify a write callback and end callback complete in separate phases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        let callbacks: string[] = [];
        let finishPromiseReject: ((reason: Error) => void) | undefined = undefined;
        sink.write('first', 'utf8', (): void => {
          callbacks.push('write');
        });
        let finishPromise =
          new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void): void => {
            finishPromiseReject = reject;
            sink.on('finish', (): void => {
              callbacks.push('finish');
              resolve(undefined as void);
            });
          });
        sink.end('last', 'utf8', (): void => {
          callbacks.push('end');
        });
        await finishPromise;
        expect(callbacks[0]).assertEqual('write');
        expect(callbacks[1]).assertEqual('end');
        expect(callbacks[2]).assertEqual('finish');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_0400
     * @tc.name testStreamWritableLifecycleFlow004
     * @tc.desc Verify the configured gbk default encoding applies to both write and end with omitted and explicit encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        let configured: boolean = sink.setDefaultEncoding("gbk");
        sink.write("中文");
        sink.end("结束");
        await new Promise<void>((resolve: (value: void) => void): void => {
          sink.on("finish", (): void => resolve(undefined as void));
        });
        expect(configured).assertTrue();
        expect(sink.text).assertEqual("中文结束");
        expect(sink.writeCount).assertEqual(2);
        let explicit: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          let target = new FlowCollectWritable();
          target.setDefaultEncoding("gbk");
          target.on("finish", (): void => {
            explicit = target.text;
            resolve(undefined as void);
          });
          target.write("中文", "gbk");
          target.end("结束", "gbk");
        });
        expect(explicit).assertEqual("中文结束");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_0500
     * @tc.name testStreamWritableLifecycleFlow005
     * @tc.desc Verify cork withholds writes until uncork flushes them before end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        sink.cork();
        sink.write("first", "utf8");
        sink.write("second", "utf8");
        expect(sink.writeCount).assertEqual(0);
        expect(sink.writableCorked).assertEqual(1);
        expect(sink.text).assertEqual("");
        sink.uncork();
        expect(sink.writeCount).assertEqual(2);
        expect(sink.text).assertEqual("firstsecond");
        sink.end();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_0600
     * @tc.name testStreamWritableLifecycleFlow006
     * @tc.desc Verify nested cork releases one level without flushing until the outer release
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        sink.cork();
        sink.cork();
        sink.write('nested', 'utf8');
        sink.uncork();
        expect(sink.writableCorked).assertEqual(1);
        expect(sink.writeCount).assertEqual(0);
        sink.uncork();
        expect(sink.writableCorked).assertEqual(0);
        expect(sink.writeCount).assertEqual(1);
        sink.end();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_0700
     * @tc.name testStreamWritableLifecycleFlow007
     * @tc.desc Verify end flushes all writes when multiple cork levels remain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        sink.cork();
        sink.cork();
        sink.cork();
        sink.write('buffered', 'utf8');
        expect(sink.writeCount).assertEqual(0);
        sink.end('tail', 'utf8');
        await new Promise<void>((resolve: (value: void) => void): void => {
          sink.on('finish', (): void => resolve(undefined as void));
        });
        expect(sink.writableCorked).assertEqual(0);
        expect(sink.text).assertEqual('bufferedtail');
        expect(sink.writeCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_0800
     * @tc.name testStreamWritableLifecycleFlow008
     * @tc.desc Verify four buffered writes retain their individual order after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        sink.cork();
        sink.write('a', 'utf8');
        sink.write('b', 'utf8');
        sink.write('c', 'utf8');
        sink.write('d', 'utf8');
        sink.uncork();
        expect(sink.chunks[0]).assertEqual('a');
        expect(sink.chunks[1]).assertEqual('b');
        expect(sink.chunks[2]).assertEqual('c');
        expect(sink.chunks[3]).assertEqual('d');
        sink.end();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_0900
     * @tc.name testStreamWritableLifecycleFlow009
     * @tc.desc Verify a write above highWaterMark is accepted and reaches finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let result: WritableLifecycleResult = new WritableLifecycleResult(new FlowCollectWritable(), []);
        result =
          await completeLifecycleFlow(["xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"],
            "tail", 0, 0, false);

        expect(result.sink.text)
          .assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxtail");
        expect(result.sink.writeCount).assertEqual(2);
        expect(result.order[0]).assertEqual('finish');
        expect(result.sink.writableEnded).assertTrue();
        expect(result.sink.writableFinished).assertTrue();
        let sink = new FlowCollectWritable();
        let largeData: string = 'x'.repeat(16385);
        let accepted: boolean = sink.write(largeData, 'utf8');
        sink.end();
        await new Promise<void>((resolve: (value: void) => void): void => {
          sink.on('finish', (): void => resolve(undefined as void));
        });
        expect(accepted).assertFalse();
        expect(sink.text.length).assertEqual(16385);
        expect(sink.writeCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_1000
     * @tc.name testStreamWritableLifecycleFlow010
     * @tc.desc Verify ten sequential writes preserve every record and their order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        for (let index: int = 0; index < 10; index++) {
          sink.write(String(index), 'utf8');
        }
        sink.end();
        await new Promise<void>((resolve: (value: void) => void): void => {
          sink.on('finish', (): void => resolve(undefined as void));
        });
        expect(sink.writeCount).assertEqual(10);
        expect(sink.chunks[0]).assertEqual('0');
        expect(sink.chunks[9]).assertEqual('9');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_1100
     * @tc.name testStreamWritableLifecycleFlow011
     * @tc.desc Verify default utf8 preserves multibyte characters when encoding is omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        sink.setDefaultEncoding('utf8');
        sink.write('😀');
        sink.write('中文');
        sink.end('✅');
        await new Promise<void>((resolve: (value: void) => void): void => {
          sink.on('finish', (): void => resolve(undefined as void));
        });
        expect(sink.text).assertEqual('😀中文✅');
        expect(sink.chunks.length).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_1200
     * @tc.name testStreamWritableLifecycleFlow012
     * @tc.desc Verify protocol records remain separate across write and end phases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        sink.write('HEAD|', 'utf8');
        sink.write('BODY|', 'utf8');
        sink.end('END', 'utf8');
        await new Promise<void>((resolve: (value: void) => void): void => {
          sink.on('finish', (): void => resolve(undefined as void));
        });
        expect(sink.chunks[0]).assertEqual('HEAD|');
        expect(sink.chunks[1]).assertEqual('BODY|');
        expect(sink.chunks[2]).assertEqual('END');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_1300
     * @tc.name testStreamWritableLifecycleFlow013
     * @tc.desc Verify corked protocol records flush in order after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        sink.cork();
        sink.write('HEAD|', 'utf8');
        sink.write('BODY|', 'utf8');
        expect(sink.writeCount).assertEqual(0);
        sink.uncork();
        sink.end('END', 'utf8');
        await new Promise<void>((resolve: (value: void) => void): void => {
          sink.on('finish', (): void => resolve(undefined as void));
        });
        expect(sink.text).assertEqual('HEAD|BODY|END');
        expect(sink.writableCorked).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_1400
     * @tc.name testStreamWritableLifecycleFlow014
     * @tc.desc Verify an empty middle write preserves the surrounding records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        sink.write('left', 'utf8');
        sink.write(new Uint8Array(0), 'utf8');
        sink.end('right', 'utf8');
        await new Promise<void>((resolve: (value: void) => void): void => {
          sink.on('finish', (): void => resolve(undefined as void));
        });
        expect(sink.text).assertEqual('leftright');
        expect(sink.chunks.length).assertEqual(3);
        expect(sink.chunks[1]).assertEqual('');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_1500
     * @tc.name testStreamWritableLifecycleFlow015
     * @tc.desc Verify a mixed-size sequence preserves both boundary records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let result = await completeLifecycleFlow(["S",
          "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"],
          "E", 0, 0, false);
        expect(result.sink.text)
          .assertEqual("SMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMME");
        expect(result.sink.writeCount).assertEqual(3);
        expect(result.order[0]).assertEqual('finish');
        expect(result.sink.writableEnded).assertTrue();
        expect(result.sink.writableFinished).assertTrue();
        expect(result.sink.writableCorked).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_1600
     * @tc.name testStreamWritableLifecycleFlow016
     * @tc.desc Verify default encoding remains active while cork buffers writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new FlowCollectWritable();
        sink.setDefaultEncoding('utf8');
        sink.cork();
        sink.write('left');
        sink.write('middle');
        expect(sink.writeCount).assertEqual(0);
        sink.uncork();
        sink.end('right');
        await new Promise<void>((resolve: (value: void) => void): void => {
          sink.on('finish', (): void => resolve(undefined as void));
        });
        expect(sink.text).assertEqual('leftmiddleright');
        expect(sink.writableCorked).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_1700
     * @tc.name testStreamWritableLifecycleFlow017
     * @tc.desc Verify single message completes as one writable stream flow with exact content and chunk count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const sink = new FlowCollectWritable();
        const finish = new Promise<void>((resolve) => sink.on('finish', resolve));
        sink.end("hello", "utf8");
        await finish;

        expect(sink.text).assertEqual("hello");
        expect(sink.writeCount).assertEqual(1);
        expect(sink.chunks.length).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_1800
     * @tc.name testStreamWritableLifecycleFlow018
     * @tc.desc Verify write callbacks run in order and complete before the finish event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let chunks: string[] = [];
        let callbackCalled: boolean = false;
        let writes: int = 0;
        let finishes: int = 0;
        await new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void): void => {
          let sink = new FlowCollectWritable();
          sink.on("finish", (): void => {
            chunks = sink.chunks;
            finishes++;
            resolve(undefined as void);
          });
          sink.write("first", "utf8", (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
            writes++;
          });
          sink.write("second", "utf8", (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
            callbackCalled = true;
            writes++;
          });
          sink.end();
        });
        expect(chunks.length).assertEqual(2);
        expect(chunks[0]).assertEqual("first");
        expect(chunks[1]).assertEqual("second");
        expect(callbackCalled).assertTrue();
        expect(writes).assertEqual(2);
        expect(finishes).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_1900
     * @tc.name testStreamWritableLifecycleFlow019
     * @tc.desc Verify default encoding precedes an end-only write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let text: string = '';
        let encodingSet: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          encodingSet = sink.setDefaultEncoding('utf8');
          sink.on('finish', (): void => {
            text = sink.text;
            resolve(undefined as void);
          });
          sink.end('default-end');
        });
        expect(encodingSet).assertTrue();
        expect(text).assertEqual('default-end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_2000
     * @tc.name testStreamWritableLifecycleFlow020
     * @tc.desc Verify pre-cork and post-cork writes remain ordered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let chunks: string[] = [];
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.write('before');
          sink.cork();
          sink.write('during');
          sink.uncork();
          sink.on('finish', (): void => {
            chunks = sink.chunks;
            resolve(undefined as void);
          });
          sink.end('after');
        });
        expect(chunks[0]).assertEqual('before');
        expect(chunks[1]).assertEqual('during');
        expect(chunks[2]).assertEqual('after');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_2100
     * @tc.name testStreamWritableLifecycleFlow021
     * @tc.desc Verify callback schedules a later end after the first write completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let text: string = '';
        let callbackCalled: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void): void => {
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            text = sink.text;
            resolve(undefined as void);
          });
          sink.write('phase-one', 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
            callbackCalled = true;
            setTimeout((): void => {
              sink.end('phase-two');
            }, 0);
          });
        });
        expect(callbackCalled).assertTrue();
        expect(text).assertEqual('phase-onephase-two');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_2200
     * @tc.name testStreamWritableLifecycleFlow022
     * @tc.desc Verify finish and end callbacks both fire
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let finishCount: int = 0;
        let endCount: int = 0;
        try {
          await new Promise<void>((resolve: (value: void) => void): void => {
            let sink = new FlowCollectWritable();
            sink.on('finish', (): void => {
              finishCount++;
              resolve(undefined as void);
            });
            sink.end('callback', 'utf8', (): void => {
              endCount++;
            });
          });
        } catch (e) {
          expect('unexpected error: ' + e.message).assertEqual('');
          done();
          return;
        }
        expect(finishCount).assertEqual(1);
        expect(endCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_2300
     * @tc.name testStreamWritableLifecycleFlow023
     * @tc.desc Verify end returns the same writable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let same: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            resolve(undefined as void);
          });
          let returned = sink.end('identity', 'utf8');
          same = (returned as Object) === (sink as Object);
        });
        expect(same).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_2400
     * @tc.name testStreamWritableLifecycleFlow024
     * @tc.desc Verify writable state changes across end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let accepted: boolean = false;
        let before: boolean = false;
        let after: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          accepted = sink.write('state');
          before = sink.writable;
          sink.on('finish', (): void => {
            after = sink.writable;
            resolve(undefined as void);
          });
          sink.end();
        });
        expect(accepted).assertTrue();
        expect(before).assertTrue();
        expect(after).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_2500
     * @tc.name testStreamWritableLifecycleFlow025
     * @tc.desc Verify writableLength drains after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let before: int = -1;
        let after: int = -1;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.cork();
          sink.write('length');
          before = sink.writableLength;
          sink.uncork();
          sink.on('finish', (): void => {
            after = sink.writableLength;
            resolve(undefined as void);
          });
          sink.end();
        });
        expect(before).assertEqual(6);
        expect(after).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_2600
     * @tc.name testStreamWritableLifecycleFlow026
     * @tc.desc Verify Uint8Array write can precede string end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let text: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            text = sink.text;
            resolve(undefined as void);
          });
          sink.write(new Uint8Array([65, 66, 67]), 'utf8');
          sink.end('!');
        });
        expect(text).assertEqual('ABC!');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_2700
     * @tc.name testStreamWritableLifecycleFlow027
     * @tc.desc Verify gb18030 preserves chunk boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let chunks: string[] = [];
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            chunks = sink.chunks;
            resolve(undefined as void);
          });
          sink.write('?', 'gb18030');
          sink.end('?', 'gb18030');
        });
        expect(chunks[0]).assertEqual('?');
        expect(chunks[1]).assertEqual('?');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_2800
     * @tc.name testStreamWritableLifecycleFlow028
     * @tc.desc Verify cork flushes typed-array data before end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let text: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.cork();
          sink.write(new Uint8Array([88, 89]), 'utf8');
          sink.uncork();
          sink.on('finish', (): void => {
            text = sink.text;
            resolve(undefined as void);
          });
          sink.end('Z');
        });
        expect(text).assertEqual('XYZ');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_2900
     * @tc.name testStreamWritableLifecycleFlow029
     * @tc.desc Verify three cork levels expose each release
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let first: int = -1;
        let second: int = -1;
        let third: int = -1;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.cork();
          sink.cork();
          sink.cork();
          first = sink.writableCorked;
          sink.uncork();
          second = sink.writableCorked;
          sink.uncork();
          third = sink.writableCorked;
          sink.on('finish', (): void => {
            resolve(undefined as void);
          });
          sink.end();
        });
        expect(first).assertEqual(3);
        expect(second).assertEqual(2);
        expect(third).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_3000
     * @tc.name testStreamWritableLifecycleFlow030
     * @tc.desc Verify end without final data closes a prior write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let text: string = '';
        let ended: boolean = false;
        try {
          await new Promise<void>((resolve: (value: void) => void): void => {
            let sink = new FlowCollectWritable();
            sink.on('finish', (): void => {
              text = sink.text;
              resolve(undefined as void);
            });
            sink.write('prior');
            sink.end(undefined, 'utf8', (): void => {
              ended = sink.writableEnded;
            });
          });
        } catch (e) {
          expect('unexpected error: ' + e.message).assertEqual('');
          done();
          return;
        }
        expect(text).assertEqual('prior');
        expect(ended).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_3100
     * @tc.name testStreamWritableLifecycleFlow031
     * @tc.desc Verify finish observes writableFinished and writableEnded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let finished: boolean = false;
        let ended: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            finished = sink.writableFinished;
            ended = sink.writableEnded;
            resolve(undefined as void);
          });
          sink.end('finished');
        });
        expect(finished).assertTrue();
        expect(ended).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_3200
     * @tc.name testStreamWritableLifecycleFlow032
     * @tc.desc Verify empty Uint8Array is delivered as a write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let count: int = 0;
        let length: int = -1;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.write(new Uint8Array(0), 'utf8');
          sink.end();
          sink.on('finish', (): void => {
            count = sink.writeCount;
            length = sink.text.length;
            resolve(undefined as void);
          });
        });
        expect(count).assertEqual(1);
        expect(length).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_3300
     * @tc.name testStreamWritableLifecycleFlow033
     * @tc.desc Verify two typed-array writes preserve byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let text: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.write(new Uint8Array([49, 50]), 'utf8');
          sink.write(new Uint8Array([51, 52]), 'utf8');
          sink.end();
          sink.on('finish', (): void => {
            text = sink.text;
            resolve(undefined as void);
          });
        });
        expect(text).assertEqual('1234');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_3400
     * @tc.name testStreamWritableLifecycleFlow034
     * @tc.desc Verify off with the original finish callback removes only that callback before replacement runs once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let first: int = 0;
        let second: int = 0;
        try {
          await new Promise<void>((resolve: (value: void) => void): void => {
            let sink = new FlowCollectWritable();
            let removed = (): void => {
              first++;
            };
            sink.on('finish', removed);
            sink.off('finish', removed);
            sink.on('finish', (): void => {
              second++;
            });
            sink.on('finish', (): void => resolve(undefined as void));
            sink.end('replacement', 'utf8', (): void => {
            });
          });
          expect(first).assertEqual(0);
          expect(second).assertEqual(1);
          done();
        } catch (e) {
          expect('unexpected error: ' + e.message).assertEqual('');
          done();
          return;
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_3500
     * @tc.name testStreamWritableLifecycleFlow035
     * @tc.desc Verify off without a callback clears finish listeners and permits one newly registered listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let count: int = 0;

        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            count++;
          });
          sink.off('finish');
          sink.on('finish', (): void => {
            count++;
          });
          sink.on('finish', (): void => resolve(undefined as void));
          sink.end('reregister', 'utf8', (): void => {
          });
        });

        expect(count).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_3600
     * @tc.name testStreamWritableLifecycleFlow036
     * @tc.desc Verify pipe followed by unpipe transfers data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let text: string = '';
        let unpiped: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ScenarioReadable(['pipe-data']);
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            text = sink.text;
            source.unpipe(sink);
            unpiped = true;
            resolve(undefined as void);
          });
          source.pipe(sink);
        });
        expect(text).assertEqual('pipe-data');
        expect(unpiped).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_3700
     * @tc.name testStreamWritableLifecycleFlow037
     * @tc.desc Verify pipe returns destination and preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let text: string = '';
        let same: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ScenarioReadable(['pipe-', 'order']);
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            text = sink.text;
            resolve(undefined as void);
          });
          same = (source.pipe(sink) as Object) === (sink as Object);
        });
        expect(same).assertTrue();
        expect(text).assertEqual('pipe-order');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_3800
     * @tc.name testStreamWritableLifecycleFlow038
     * @tc.desc Verify corked destination receives piped data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let text: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ScenarioReadable(['cork-pipe']);
          let sink = new FlowCollectWritable();
          sink.cork();
          sink.on('finish', (): void => {
            text = sink.text;
            resolve(undefined as void);
          });
          source.pipe(sink);
          sink.uncork();
        });
        expect(text).assertEqual('cork-pipe');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_3900
     * @tc.name testStreamWritableLifecycleFlow039
     * @tc.desc Verify pipe completion closes destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let writable: boolean = true;
        let ended: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ScenarioReadable(['state-pipe']);
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            writable = sink.writable;
            ended = sink.writableEnded;
            resolve(undefined as void);
          });
          source.pipe(sink);
        });
        expect(writable).assertFalse();
        expect(ended).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_4000
     * @tc.name testStreamWritableLifecycleFlow040
     * @tc.desc Verify two writes expose a pre-end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let text: string = '';
        let length: int = -1;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.write('length-a');
          sink.write('length-b');
          length = sink.writableLength;
          sink.on('finish', (): void => {
            text = sink.text;
            resolve(undefined as void);
          });
          sink.end();
        });
        expect(text).assertEqual('length-alength-b');
        expect(length).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_LIFECYCLE_FLOW_4100
     * @tc.name testStreamWritableLifecycleFlow041
     * @tc.desc Verify Unicode default encoding follows a write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableLifecycleFlow041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let text: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.setDefaultEncoding('utf8');
          sink.write('Open Harmony-');
          sink.end('??');
          sink.on('finish', (): void => {
            text = sink.text;
            resolve(undefined as void);
          });
        });
        expect(text).assertEqual('Open Harmony-??');
        done();
      });
  });
}
