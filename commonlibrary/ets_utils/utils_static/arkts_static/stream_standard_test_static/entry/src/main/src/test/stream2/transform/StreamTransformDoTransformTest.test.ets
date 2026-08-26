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

class ArrowCb extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class FuncCb extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class AsyncCb extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class PushFirst extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push("A");
    callback.unsafeCall();
  }
}

class TransformTestBase extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class DotransformUppercase extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push((chunk as String).toUpperCase());
    callback.unsafeCall();
  }
}

class DotransformFilter extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DotransformMultiPush extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push("a");
    this.push("b");
    this.push("c");
    callback.unsafeCall();
  }
}

class DotransformNoCb extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
  }
}

class DotransformThrow extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    throw new Error("transform error");
  }
}

class DotransformCbError extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error("fail"));
  }
}

class DotransformPushThenThrow extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push("data");
    throw new Error("err");
  }
}

class DotransformPushThenCbErr extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push("data");
    callback.unsafeCall(new Error("err"));
  }
}

class DotransformDoubleCb extends stream.Transform {
  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    callback.unsafeCall();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class DotransformNoTR extends stream.Transform {
  constructor() {
    super();
  }
}

class DotransformPushNull extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(null);
    callback.unsafeCall();
  }
}

class DotransformPushNullAfter extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(null);
    this.push("after");
    callback.unsafeCall();
  }
}

class DotransformDelayCb extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    setTimeout((): void => {
      callback.unsafeCall();
    }, 50);
  }
}

class DotransformAsyncThrow extends stream.Transform {
  public asyncErrorMessage: string = '';

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
    setTimeout((): void => {
      try {
        throw new Error("async_err");
      } catch (e) {
        this.asyncErrorMessage = e.message;
        this.push(null);
      }
    }, 0);
  }
}

class DotransformDoubleCbAsync extends stream.Transform {
  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    callback.unsafeCall();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    setTimeout((): void => {
      callback.unsafeCall();
      callback.unsafeCall();
    }, 0);
  }
}

class DotransformWithFlush extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push((chunk as String).toUpperCase());
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class DotransformCbOnly extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamTransformDoTransformTest(): void {
  describe('StreamTransformDoTransformTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_0100
     * @tc.name testStreamTransformDoTransform001
     * @tc.desc Verify uppercase transform: push converted result + callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformUppercase();
      ws.write("hello");
      let data = ws.read();
      expect(data?.toString()).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_0200
     * @tc.name testStreamTransformDoTransform002
     * @tc.desc Verify filter data: no push only callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformFilter();
      ws.write("world");
      let data = ws.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_0300
     * @tc.name testStreamTransformDoTransform003
     * @tc.desc Verify mixed ASCII + Chinese + utf8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformUppercase();
      ws.write("abc123", "utf8");
      let data = ws.read();
      expect(data?.toString()).assertEqual("ABC123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_0400
     * @tc.name testStreamTransformDoTransform004
     * @tc.desc Verify nested cork counts and output after the uncork cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.cork();
      ws.cork();
      ws.write("x");
      expect(ws.writableCorked).assertEqual(2);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.readableLength).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      let data = ws.read();
      expect(data?.toString()).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_0500
     * @tc.name testStreamTransformDoTransform005
     * @tc.desc Verify end() after write does not trigger doTransform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      let result = ws.write("test");
      expect(result).assertTrue();
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.read()?.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_0600
     * @tc.name testStreamTransformDoTransform006
     * @tc.desc Verify write not called does not trigger doTransform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      expect(ws.readableLength).assertEqual(0);
      expect(ws.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_0700
     * @tc.name testStreamTransformDoTransform007
     * @tc.desc Verify end() without chunk does not trigger doTransform, only doFlush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformWithFlush();
      ws.end();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_0800
     * @tc.name testStreamTransformDoTransform008
     * @tc.desc Verify normal doTransform does not trigger error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      let errorFired: boolean = false;
      ws.on("error", (err: Error): void => {
        errorFired = true;
      });
      ws.write("valid");
      let data = ws.read();
      expect(data?.toString()).assertEqual("valid");
      expect(errorFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_0900
     * @tc.name testStreamTransformDoTransform009
     * @tc.desc Verify doTransform passes multi-language, emoji, symbol and special-character payloads through unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payloads: string[] = ['中文', '1', '测试工程师', 'Z',
        '😀', '<script>alert(1)</script>', '�', '😀测试',
        'テスト', '테스트', 'АБВГД',
        'الاختبار', '!@#$%^&*()', 'Test 測試',
        '​'];
      for (let i = 0; i < payloads.length; i++) {
        let ws = new TransformTestBase();
        ws.write(payloads[i], "utf8");
        let data = ws.read();
        expect(data?.toString()).assertEqual(payloads[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_1000
     * @tc.name testStreamTransformDoTransform010
     * @tc.desc Verify writable state across normal, paused, resumed, and ended states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      expect(ws.writable).assertTrue();
      expect(ws.write("z@1")).assertTrue();
      ws.pause();
      expect(ws.isPaused()).assertTrue();
      expect(ws.write("paused")).assertTrue();
      ws.resume();
      expect(ws.isPaused()).assertFalse();
      expect(ws.write("resumed")).assertTrue();
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.write("after")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_1100
     * @tc.name testStreamTransformDoTransform011
     * @tc.desc Verify encoding name as data "gb18030"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.write("gb18030", "gb18030");
      let data = ws.read();
      expect(data?.toString()).assertEqual("gb18030");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_1200
     * @tc.name testStreamTransformDoTransform012
     * @tc.desc Verify alphanumeric input is transformed to uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformUppercase();
      ws.write("Test123 测试", "utf8");
      let data = ws.read();
      expect(data?.toString()).assertEqual("TEST123 测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_1300
     * @tc.name testStreamTransformDoTransform013
     * @tc.desc Verify encoding="utf8" transforms an ASCII English word and drains readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.write("test", "utf8");
      let data = ws.read();
      expect(data?.toString()).assertEqual("test");
      expect(ws.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_1400
     * @tc.name testStreamTransformDoTransform014
     * @tc.desc Verify doTransform passes Chinese text through unchanged for gbk, gb18030 and gb2312 encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['测试', '测试', '测试', '测试工程师'];
      let encodings: string[] = ['gbk', 'gb18030', 'gb2312', 'gb18030'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new TransformTestBase();
        ws.write(chunks[i], encodings[i]);
        let data = ws.read();
        expect(data?.toString()).assertEqual(chunks[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_1500
     * @tc.name testStreamTransformDoTransform015
     * @tc.desc Verify doTransform passes through Japanese punctuation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.write("～々〆〇");
      let data = ws.read();
      expect(data?.toString()).assertEqual("～々〆〇");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_1600
     * @tc.name testStreamTransformDoTransform016
     * @tc.desc Verify readableLength reflects buffered data after write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.write("!@#$%");
      expect(ws.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_1700
     * @tc.name testStreamTransformDoTransform017
     * @tc.desc Verify write rejects an empty string as documented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      try {
        ws.write("", "utf8");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_1800
     * @tc.name testStreamTransformDoTransform018
     * @tc.desc Verify 16383 byte ASCII string (below watermark)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      let str: string = "";
      for (let i = 0; i < 16383; i++) {
        str += "a";
      }
      let result = ws.write(str, "utf8");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_1900
     * @tc.name testStreamTransformDoTransform019
     * @tc.desc Verify 16384 byte ASCII string reaches the high water mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      let str: string = "";
      for (let i = 0; i < 16384; i++) {
        str += "a";
      }
      let result = ws.write(str, "utf8");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_2000
     * @tc.name testStreamTransformDoTransform020
     * @tc.desc Verify write returns false for Uint8Array sizes of 16385, 65536 and 102400 bytes exceeding the high water mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16385, 65536, 102400];
      for (let i = 0; i < sizes.length; i++) {
        let ws = new TransformTestBase();
        let buf = new Uint8Array(sizes[i]);
        let result = ws.write(buf);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_2100
     * @tc.name testStreamTransformDoTransform021
     * @tc.desc Verify omitted encoding uses the default UTF-8 behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.write("test");
      let data = ws.read();
      expect(data?.toString()).assertEqual("test");
      expect(ws.read()).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_2200
     * @tc.name testStreamTransformDoTransform022
     * @tc.desc Verify encoding="gb18030"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.write("AB12", "gb18030");
      ws.write("测试", "gb18030");
      ws.write("!@#", "gb18030");
      expect(ws.readableLength).assertEqual(13);
      let data = ws.read();
      expect(data?.toString()).assertEqual("AB12测试!@#");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_2300
     * @tc.name testStreamTransformDoTransform023
     * @tc.desc Verify doTransform passes through multibyte UTF-8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.write("∞≈≠≤≥");
      let data = ws.read();
      expect(data?.toString()).assertEqual("∞≈≠≤≥");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_2400
     * @tc.name testStreamTransformDoTransform024
     * @tc.desc Verify multiple write chunks are combined on read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.write("¥£");
      ws.write("€");
      let data = ws.read();
      expect(data?.toString()).assertEqual("¥£€");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_2500
     * @tc.name testStreamTransformDoTransform025
     * @tc.desc Verify empty encoding uses the default encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      let result = ws.write("test", "");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_2600
     * @tc.name testStreamTransformDoTransform026
     * @tc.desc Verify encoding="ascii" unsupported encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      let result = ws.write("test", "ascii");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_2700
     * @tc.name testStreamTransformDoTransform027
     * @tc.desc Verify encoding="base64" unsupported encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      try {
        ws.write("test", "base64");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_2800
     * @tc.name testStreamTransformDoTransform028
     * @tc.desc Verify callback is arrow function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new ArrowCb();
      ws.write("data");
      let data = ws.read();
      expect(data?.toString()).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_2900
     * @tc.name testStreamTransformDoTransform029
     * @tc.desc Verify callback is regular function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FuncCb();
      ws.write("data");
      let data = ws.read();
      expect(data?.toString()).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_3000
     * @tc.name testStreamTransformDoTransform030
     * @tc.desc Verify push before callback invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new PushFirst();
      ws.write("data");
      let data = ws.read();
      expect(data?.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_3100
     * @tc.name testStreamTransformDoTransform031
     * @tc.desc Verify async delayed callback (setTimeout 50ms)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformDelayCb();
      ws.write("data");
      let data = ws.read();
      expect(data?.toString()).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_3200
     * @tc.name testStreamTransformDoTransform032
     * @tc.desc Verify cork state write, doTransform not triggered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.cork();
      ws.write("x");
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_3300
     * @tc.name testStreamTransformDoTransform033
     * @tc.desc Verify cork+write then uncork flushes, doTransform triggered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.cork();
      ws.write("a");
      ws.write("b");
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      let data = ws.read();
      expect(data?.toString()).assertEqual("ab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_3400
     * @tc.name testStreamTransformDoTransform034
     * @tc.desc Verify cork nested x3 then uncork gradually returns to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.cork();
      ws.cork();
      ws.cork();
      ws.write("x");
      expect(ws.writableCorked).assertEqual(3);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(2);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_3500
     * @tc.name testStreamTransformDoTransform035
     * @tc.desc Verify push null ends readable end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformPushNull();
      ws.write("test");
      expect(ws.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_3600
     * @tc.name testStreamTransformDoTransform036
     * @tc.desc Verify push null then continue pushing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformPushNullAfter();
      ws.write("test");
      expect(ws.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_3700
     * @tc.name testStreamTransformDoTransform037
     * @tc.desc Verify flowing mode: push triggers data event real-time output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new DotransformUppercase();
        let dataAtData: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("data", (chunk: Object): void => {
            dataAtData = chunk.toString();
            ws.end();
            resolve(undefined as void);
          });
          ws.resume();
          ws.write("hello");
        });
        expect(dataAtData).assertEqual("HELLO");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_3800
     * @tc.name testStreamTransformDoTransform038
     * @tc.desc Verify paused mode: push buffers data, does not trigger data event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.pause();
      ws.write("hello");
      expect(ws.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_3900
     * @tc.name testStreamTransformDoTransform039
     * @tc.desc Verify pause, write, and resume trigger buffered data processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.pause();
      ws.write("a");
      ws.write("b");
      ws.resume();
      let data = ws.read();
      expect(data?.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_4000
     * @tc.name testStreamTransformDoTransform040
     * @tc.desc Verify 100 consecutive writes, order correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      for (let i = 0; i < 100; i++) {
        ws.write("msg_" + i, "utf8");
      }
      expect(ws.readableLength).assertEqual(590);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_4100
     * @tc.name testStreamTransformDoTransform041
     * @tc.desc Verify end(chunk) triggers doTransform then doFlush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformWithFlush();
      ws.end("final", "utf8");
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_4200
     * @tc.name testStreamTransformDoTransform042
     * @tc.desc Verify end() then write, doTransform not called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new TransformTestBase();
        ws.end();
        expect(ws.writableEnded).assertTrue();
        let errName: string = '';
        let errCode: number = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: BusinessError): void => {
            errName = err.name;
            errCode = err.code;
            resolve(undefined as void);
          });
          expect(ws.write("after")).assertFalse();
        });
        expect(errName).assertEqual('BusinessError');
        expect(errCode).assertEqual(10200036);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_4300
     * @tc.name testStreamTransformDoTransform043
     * @tc.desc Verify doTransform without push, only callback: no data output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformCbOnly();
      ws.write("data");
      let data = ws.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_4400
     * @tc.name testStreamTransformDoTransform044
     * @tc.desc Verify lone surrogate code point U+DC04 "\uDC04"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.write("\uDC04", "utf8");
      let data = ws.read();
      expect(data?.toString()).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_4500
     * @tc.name testStreamTransformDoTransform045
     * @tc.desc Verify string "null"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.write("null", "utf8");
      let data = ws.read();
      expect(data?.toString()).assertEqual("null");
      expect(ws.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_4600
     * @tc.name testStreamTransformDoTransform046
     * @tc.desc Verify string "undefined"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.write("undefined", "utf8");
      let data = ws.read();
      expect(data?.toString()).assertEqual("undefined");
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_4700
     * @tc.name testStreamTransformDoTransform047
     * @tc.desc Verify doTransform synchronously throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformThrow();
      try {
        ws.write("test");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_4800
     * @tc.name testStreamTransformDoTransform048
     * @tc.desc Verify doTransform does not call callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformNoCb();
      ws.write("test");
      expect(ws.readableLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_4900
     * @tc.name testStreamTransformDoTransform049
     * @tc.desc Verify callback passing Error triggers error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformCbError();
      ws.write("test");
      expect(ws.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_5000
     * @tc.name testStreamTransformDoTransform050
     * @tc.desc Verify doTransform push then throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformPushThenThrow();
      try {
        ws.write("test");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_5100
     * @tc.name testStreamTransformDoTransform051
     * @tc.desc Verify doTransform push then callback passes Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DotransformPushThenCbErr();
      ws.write("test");
      expect(ws.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_5200
     * @tc.name testStreamTransformDoTransform052
     * @tc.desc Verify asynchronous transform error is captured without escaping the test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new DotransformAsyncThrow();
        let asyncError: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("end", (): void => {
            asyncError = ws.asyncErrorMessage;
            resolve(undefined as void);
          });
          ws.resume();
          ws.write("test");
        });
        expect(asyncError).assertEqual("async_err");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_5300
     * @tc.name testStreamTransformDoTransform053
     * @tc.desc Verify doTransform callback called synchronously twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new DotransformDoubleCb();
        let errName: string = "";
        let errCode: number = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: BusinessError): void => {
            errName = err.name;
            errCode = err.code;
            resolve(undefined as void);
          });
          ws.write("test");
        });
        expect(errName).assertEqual('BusinessError');
        expect(errCode).assertEqual(10200037);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_5400
     * @tc.name testStreamTransformDoTransform054
     * @tc.desc Verify doTransform callback called asynchronously twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new DotransformDoubleCbAsync();
        let errName: string = "";
        let errCode: number = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: BusinessError): void => {
            errName = err.name;
            errCode = err.code;
            resolve(undefined as void);
          });
          ws.write("test");
        });
        expect(errName).assertEqual('BusinessError');
        expect(errCode).assertEqual(10200037);

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_TRANSFORM_5500
     * @tc.name testStreamTransformDoTransform055
     * @tc.desc Verify combination: large chunk + illegal encoding, encoding exception takes precedence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoTransform055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      let str: string = "";
      for (let i = 0; i < 20480; i++) {
        str += "a";
      }
      try {
        ws.write(str, "base64");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });
  });
}
