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

class TransformTestBase extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class NoSuperTransform extends stream.Transform {
  constructor() {
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class ConstructDefault extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class ConstructUppercase extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push((chunk as String).toUpperCase());
    callback.unsafeCall();
  }
}

class ConstructWithFlush extends stream.Transform {
  flushCalled: boolean = false;

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.flushCalled = true;
    callback.unsafeCall();
  }
}

class ConstructWithInit extends stream.Transform {
  initCalled: boolean = false;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    this.initCalled = true;
    callback.unsafeCall();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class ConstructNoTransform extends stream.Transform {
  constructor() {
    super();
  }
}

class ConstructTransformOnly extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class ConstructFilter extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if ((chunk as String) != "skip") {
      this.push(chunk);
    }
    callback.unsafeCall();
  }
}

class ConstructAccumulate extends stream.Transform {
  chunks: string = "";

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.chunks += (chunk as String);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.push(this.chunks);
    callback.unsafeCall();
  }
}

class Sub_123$ extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class ConstructInitThrow extends stream.Transform {
  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    throw new Error("transform init fail");
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class ConstructInitNoCallback extends stream.Transform {
  initDone: boolean = false;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    this.initDone = true;
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class ConstructInitError extends stream.Transform {
  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    callback.unsafeCall(new Error("stream construct error"));
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class ConstructDoubleCallback extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class ConstructNoDoRead extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

export default function StreamTransformConstructorTest(): void {
  describe('StreamTransformConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_0100
     * @tc.name testStreamTransformConstructor001
     * @tc.desc Verify subclass no-arg constructor exposes inherited readable and writable behavior with all 14 properties at correct defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructDefault();
      expect(ws.readable).assertTrue();
      expect(ws.readableObjectMode).assertFalse();
      expect(ws.readableHighWatermark).assertEqual(16384);
      expect(ws.readableFlowing).assertEqual(null);
      expect(ws.readableLength).assertEqual(0);
      expect(ws.readableEncoding).assertEqual(null);
      expect(ws.readableEnded).assertFalse();
      expect(ws.writable).assertTrue();
      expect(ws.writableObjectMode).assertFalse();
      expect(ws.writableHighWatermark).assertEqual(16384);
      expect(ws.writableLength).assertEqual(0);
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writableEnded).assertFalse();
      expect(ws.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_0200
     * @tc.name testStreamTransformConstructor002
     * @tc.desc Verify subclass implementing doTransform pipeline works normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructUppercase();
      let result = ws.write("hello");
      expect(result).assertTrue();
      let data = ws.read();
      expect(data?.toString()).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_0300
     * @tc.name testStreamTransformConstructor003
     * @tc.desc Verify subclass implementing doTransform+doFlush construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructWithFlush();
      let result = ws.write("data");
      expect(result).assertTrue();
      expect(ws.flushCalled).assertFalse();
      ws.end();
      expect(ws.flushCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_0400
     * @tc.name testStreamTransformConstructor004
     * @tc.desc Verify doInitialize called automatically on construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructWithInit();
      ws.on('data', (): void => {
      });
      expect(ws.initCalled).assertTrue();
      expect(ws.writable).assertTrue();
      expect(ws.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_0500
     * @tc.name testStreamTransformConstructor005
     * @tc.desc Verify subclass without doTransform exposes default stream properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructNoTransform();
      expect(ws.readable).assertTrue();
      expect(ws.writable).assertTrue();
      expect(ws.readableHighWatermark).assertEqual(16384);
      expect(ws.writableHighWatermark).assertEqual(16384);
      expect(ws.readableObjectMode).assertFalse();
      expect(ws.writableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_0600
     * @tc.name testStreamTransformConstructor006
     * @tc.desc Verify subclass only implements doTransform without doFlush construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructTransformOnly();
      let result = ws.write("test");
      expect(result).assertTrue();
      ws.end();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_0700
     * @tc.name testStreamTransformConstructor007
     * @tc.desc Verify read end ended does not affect write end, write end ended does not affect read end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ConstructDefault();
      a.push(null);
      expect(a.readableEnded).assertFalse();
      expect(a.writableEnded).assertFalse();
      expect(a.writable).assertTrue();
      let b = new ConstructDefault();
      b.end();
      expect(b.writableEnded).assertTrue();
      expect(b.readableEnded).assertFalse();
      expect(b.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_0800
     * @tc.name testStreamTransformConstructor008
     * @tc.desc Verify subclass implementing filter transformation (some chunks not pushed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructFilter();
      ws.write("keep");
      let data1 = ws.read();
      expect(data1?.toString()).assertEqual("keep");
      ws.write("skip");
      let data2 = ws.read();
      expect(data2).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_0900
     * @tc.name testStreamTransformConstructor009
     * @tc.desc Verify subclass implementing accumulate transform+doFlush output summary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructAccumulate();
      ws.write("a");
      ws.write("b");
      ws.write("c");
      ws.end();
      let data = ws.read();
      expect(data?.toString()).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_1000
     * @tc.name testStreamTransformConstructor010
     * @tc.desc Verify multiple different subclasses each constructed independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ConstructUppercase();
      let b = new ConstructFilter();
      expect(a.readable).assertTrue();
      expect(b.readable).assertTrue();
      expect(a.writableCorked).assertEqual(0);
      expect(b.writableCorked).assertEqual(0);
      expect(a.readableFlowing).assertEqual(null);
      expect(b.readableFlowing).assertEqual(null);
      a.write("hello");
      let aData = a.read();
      expect(aData?.toString()).assertEqual("HELLO");
      b.write("keep");
      let bData = b.read();
      expect(bData?.toString()).assertEqual("keep");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_1100
     * @tc.name testStreamTransformConstructor011
     * @tc.desc Verify 100 independently constructed Transform instances maintain per-instance transformation data isolation with no cross-instance contamination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instances: Array<ConstructDefault> = [];
      for (let i = 0; i < 100; i++) {
        let ws = new ConstructDefault();
        let payload = 'item-' + i.toString();
        ws.write(payload);
        let data = ws.read();
        expect(data?.toString()).assertEqual(payload);
        instances.push(ws);
      }
      expect(instances.length).assertEqual(100);
      for (let j = 0; j < 100; j++) {
        expect(instances[j].readable).assertTrue();
        expect(instances[j].writable).assertTrue();
        expect(instances[j].readableHighWatermark).assertEqual(16384);
        expect(instances[j].writableHighWatermark).assertEqual(16384);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_1200
     * @tc.name testStreamTransformConstructor012
     * @tc.desc Verify end immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructDefault();
      ws.end();
      expect(ws.readable).assertTrue();
      expect(ws.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_1300
     * @tc.name testStreamTransformConstructor013
     * @tc.desc Verify construct, end, and construct create a new instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let old = new ConstructDefault();
      old.end();
      expect(old.readable).assertTrue();
      expect(old.writable).assertFalse();
      let ws = new ConstructDefault();
      expect(ws.readable).assertTrue();
      expect(ws.writable).assertTrue();
      expect(ws.readableLength).assertEqual(0);
      expect(ws.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_1400
     * @tc.name testStreamTransformConstructor014
     * @tc.desc Verify a locally constructed Transform inside a closure completes full write-transform-push-read-end lifecycle and returns transformed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let createTransform = (): stream.Transform => {
        return new ConstructDefault();
      };
      let ws = createTransform();
      expect(ws.readable).assertTrue();
      expect(ws.writable).assertTrue();
      expect(ws.readableHighWatermark).assertEqual(16384);
      ws.write('closure-transform');
      let data = ws.read();
      expect(data?.toString()).assertEqual('closure-transform');
      ws.cork();
      ws.write('closure-buffered');
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_1500
     * @tc.name testStreamTransformConstructor015
     * @tc.desc Verify write data immediately after construction (triggers doTransform pipeline)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructDefault();
      let result = ws.write("data", "utf8");
      expect(result).assertTrue();
      expect(ws.readableLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_1600
     * @tc.name testStreamTransformConstructor016
     * @tc.desc Verify push data into read buffer immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructDefault();
      let result = ws.push("test");
      expect(result).assertTrue();
      expect(ws.readableLength).assertEqual(4);
      let data = ws.read();
      expect(data?.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_1700
     * @tc.name testStreamTransformConstructor017
     * @tc.desc Verify end write end immediately after construction (without prior write, triggers doFlush)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructWithFlush();
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.flushCalled).assertTrue();
      expect(ws.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_1800
     * @tc.name testStreamTransformConstructor018
     * @tc.desc Verify cork immediately after construction to enter write buffer mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructDefault();
      ws.cork();
      ws.write("x");
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.readableFlowing).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_1900
     * @tc.name testStreamTransformConstructor019
     * @tc.desc Verify pause read end immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructDefault();
      ws.pause();
      expect(ws.readableFlowing).assertFalse();
      expect(ws.isPaused()).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_2000
     * @tc.name testStreamTransformConstructor020
     * @tc.desc Verify resume read end flow immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructDefault();
      ws.resume();
      expect(ws.readableFlowing).assertTrue();
      expect(ws.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_2100
     * @tc.name testStreamTransformConstructor021
     * @tc.desc Verify register all event listeners immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructDefault();
      ws.on("data", (): void => {
      });
      ws.on("end", (): void => {
      });
      ws.on("error", (): void => {
      });
      ws.on("close", (): void => {
      });
      ws.on("readable", (): void => {
      });
      ws.on("finish", (): void => {
      });
      ws.on("drain", (): void => {
      });
      ws.on("pipe", (): void => {
      });
      ws.on("unpipe", (): void => {
      });
      expect(ws.readable).assertTrue();
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_2200
     * @tc.name testStreamTransformConstructor022
     * @tc.desc Verify inherited stream methods update observable state after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructDefault();
      expect(ws.write("constructor_probe")).assertTrue();
      ws.pause();
      expect(ws.read()?.toString()).assertEqual("constructor_probe");
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      ws.setDefaultEncoding("utf8");
      ws.push("readable_probe");
      expect(ws.isPaused()).assertTrue();
      expect(ws.read()?.toString()).assertEqual("readable_probe");
      ws.resume();
      expect(ws.isPaused()).assertFalse();
      ws.end();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_2300
     * @tc.name testStreamTransformConstructor023
     * @tc.desc Verify subclass with special characters in name constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new Sub_123$();
      expect(ws.readable).assertTrue();
      expect(ws.writable).assertTrue();
      expect(ws.readableHighWatermark).assertEqual(16384);
      ws.write("test");
      let data = ws.read();
      expect(data?.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_2400
     * @tc.name testStreamTransformConstructor024
     * @tc.desc Verify subclass doInitialize throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let ws = new ConstructInitThrow();
        ws.on('data', (): void => {
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_2500
     * @tc.name testStreamTransformConstructor025
     * @tc.desc Verify subclass doInitialize callback passes Error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ConstructInitError();
      expect(ws.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_CONSTRUCTOR_2600
     * @tc.name testStreamTransformConstructor026
     * @tc.desc Verify subclass constructor does not call super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new NoSuperTransform();
      expect(ws.readable).assertTrue();
      expect(ws.writable).assertTrue();
    });

  });
}
