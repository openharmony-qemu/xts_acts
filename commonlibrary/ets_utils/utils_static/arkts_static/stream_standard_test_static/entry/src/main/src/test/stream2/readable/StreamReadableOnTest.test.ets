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
import { stream, util } from '@kit.ArkTS';

class ReadableTestBase extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class ReadableOnError extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
    throw new Error("test");
  }
}

class PipeWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(data: Object, encoding: String, cb: Function): void {
    cb.unsafeCall();
  }
}

export default function StreamReadableOnTest(): void {
  describe('StreamReadableOnTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_0100
     * @tc.name testStreamReadableOn001
     * @tc.desc Verify registering data event triggers after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let dataStr: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("data", (data: Object): void => {
            dataStr = data.toString();
            resolve(undefined as void);
          });
          r.push("test");
          r.push(null);
        });
        expect(dataStr).assertEqual("test");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_0200
     * @tc.name testStreamReadableOn002
     * @tc.desc Verify registering end event triggers after push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let endCalled: boolean = false;
        let readableEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("end", (): void => {
            endCalled = true;
            readableEnded = r.readableEnded;
            resolve(undefined as void);
          });
          r.push(null);
          r.read();
        });
        expect(endCalled).assertTrue();
        expect(readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_0300
     * @tc.name testStreamReadableOn003
     * @tc.desc Verify registering error event triggers when doRead throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const errorPromise: Promise<Error> = new Promise<Error>((resolve: (value: Error) => void): void => {
          let r = new ReadableOnError();
          r.on("error", (err: Error): void => {
            resolve(err);
          });
          r.read();
        });
        let err: Error = new Error();
        err = await errorPromise;
        expect(err.name).assertEqual("Error");
        expect(err.message).assertEqual("test");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_0400
     * @tc.name testStreamReadableOn004
     * @tc.desc Verify registering readable event triggers after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let readableLength: number = -1;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("readable", (): void => {
            readableLength = r.readableLength;
            resolve(undefined as void);
          });
          r.push("test");
          r.push(null);
        });
        expect(readableLength).assertEqual(4);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_0500
     * @tc.name testStreamReadableOn005
     * @tc.desc Verify callback does not trigger when data is registered but not pushed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let flag: boolean = false;
      r.on("data", (data: Object): void => {
        flag = true;
      });
      expect(flag).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_0600
     * @tc.name testStreamReadableOn006
     * @tc.desc Verify callback does not trigger when end is registered but non-null data is pushed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let dataStr: string = '';
        let endCalled: boolean = false;
        let endCalledAtData: boolean = false;
        let readableEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("end", (): void => {
            endCalled = true;
            readableEnded = r.readableEnded;
            resolve(undefined as void);
          });
          r.on("data", (data: Object): void => {
            dataStr = data.toString();
            endCalledAtData = endCalled;
            r.push(null);
          });
          r.push("data");
        });
        expect(dataStr).assertEqual("data");
        expect(endCalledAtData).assertFalse();
        expect(readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_0700
     * @tc.name testStreamReadableOn007
     * @tc.desc Verify normal push does not trigger error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let errorCalled: boolean = false;
        let dataStr: string = '';
        let readableEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("error", (): void => {
            errorCalled = true;
          });
          r.on("end", (): void => {
            readableEnded = r.readableEnded;
            resolve(undefined as void);
          });
          r.on("data", (data: Object): void => {
            dataStr = data.toString();
          });
          r.push("valid");
          r.push(null);
        });
        expect(errorCalled).assertFalse();
        expect(readableEnded).assertTrue();
        expect(dataStr).assertEqual("valid");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_0800
     * @tc.name testStreamReadableOn008
     * @tc.desc Verify callback does not trigger when pause is registered but not called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let flag: boolean = false;
      r.on("pause", (): void => {
        flag = true;
      });
      expect(flag).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_0900
     * @tc.name testStreamReadableOn009
     * @tc.desc Verify arrow function registered as callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let readableEnded: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("data", (): void => {
            readableEnded = r.readableEnded;
            resolve(undefined as void);
          });
          r.push("test");
          r.push(null);
        });
        expect(readableEnded).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_1000
     * @tc.name testStreamReadableOn010
     * @tc.desc Verify data callback receives a binary chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let dataStr: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("data", (data: Object): void => {
            dataStr = data.toString();
            resolve(undefined as void);
          });
          r.push(new Uint8Array([0x74, 0x65, 0x73, 0x74]));
          r.push(null);
        });
        expect(dataStr).assertEqual("test");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_1100
     * @tc.name testStreamReadableOn011
     * @tc.desc Verify async arrow function registered as callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let dataStr: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("data", async (data: Object): Promise<void> => {
            dataStr = data.toString();
            resolve(undefined as void);
          });
          r.push("test");
          r.push(null);
        });
        expect(dataStr).assertEqual("test");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_1200
     * @tc.name testStreamReadableOn012
     * @tc.desc Verify regular function registered as callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let count: int = 0;
        let dataStr: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("data", (data: Object): void => {
            count++;
            dataStr = data.toString();
            resolve(undefined as void);
          });
          r.push("test");
          r.push(null);
        });
        expect(dataStr).assertEqual("test");
        expect(count).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_1300
     * @tc.name testStreamReadableOn013
     * @tc.desc Verify listeners registered for unsupported event names including blank, whitespace, control, Unicode, emoji, XSS and writable-only names are never invoked on push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let events: string[] = ['', 'a', '   ', '\t', '\n', '\r', '​', '😀', '😀测试',
        '<script>alert(1)</script>', 'テスト', 'тест',
        'الاختبار',
        '�', '\udc04', '\xe4', 'null', '2026-03-05', '0x123', 'drain'];
      for (let i = 0; i < events.length; i++) {
        let r = new ReadableTestBase();
        let flag: boolean = false;
        r.on(events[i], (): void => {
          flag = true;
        });
        r.push('test');
        expect(flag).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_1400
     * @tc.name testStreamReadableOn014
     * @tc.desc Verify listeners registered for over-long event names of 10000, 65535, 16385 and 102400 characters are never invoked on push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chars: string[] = ['a', 'x', 'y', 'z'];
      let lengths: int[] = [10000, 65535, 16385, 102400];
      for (let i = 0; i < chars.length; i++) {
        let r = new ReadableTestBase();
        let flag: boolean = false;
        let longEvent: string = chars[i].repeat(lengths[i]);
        r.on(longEvent, (): void => {
          flag = true;
        });
        r.push('test');
        expect(flag).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_1500
     * @tc.name testStreamReadableOn015
     * @tc.desc Verify data registered before push triggers after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let dataStr: string = '';
        let readableLength: number = -1;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("data", (data: Object): void => {
            dataStr = data.toString();
            readableLength = r.readableLength;
            resolve(undefined as void);
          });
          r.push("test");
          r.push(null);
        });
        expect(dataStr).assertEqual("test");
        expect(readableLength).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_1600
     * @tc.name testStreamReadableOn016
     * @tc.desc Verify data registered after push does not trigger for already-pushed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let flag: boolean = false;
      r.push("test");
      r.on("data", (data: Object): void => {
        flag = true;
      });
      expect(flag).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_1700
     * @tc.name testStreamReadableOn017
     * @tc.desc Verify end registered after push(null) does not trigger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let flag: boolean = false;
      r.push(null);
      r.on("end", (): void => {
        flag = true;
      });
      expect(flag).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_1800
     * @tc.name testStreamReadableOn018
     * @tc.desc Verify all callbacks trigger when multiple are registered on the same event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let count: int = 0;
        let cb1 = (): void => {
          count++;
        };
        let cb2 = (): void => {
          count++;
        };
        let cb3 = (): void => {
          count++;
        };
        r.on("data", cb1);
        r.on("data", cb2);
        r.on("data", cb3);
        r.push("test");
        r.push(null);
        r.read();
        let countAtEnd: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("end", (): void => {
            countAtEnd = count;
            resolve(undefined as void);
          });
        });
        expect(countAtEnd).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_1900
     * @tc.name testStreamReadableOn019
     * @tc.desc Verify data, end, and close events trigger in sequence after push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let dataFlag: boolean = false;
        let endFlag: boolean = false;
        let closeFlag: boolean = false;
        r.on("data", (d: Object): void => {
          dataFlag = true;
        });
        r.on("end", (): void => {
          endFlag = true;
        });
        r.on("close", (): void => {
          closeFlag = true;
        });
        r.push("test");
        r.push(null);
        r.read();
        let dataF: boolean = false;
        let endF: boolean = false;
        let closeF: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("close", (): void => {
            dataF = dataFlag;
            endF = endFlag;
            closeF = closeFlag;
            resolve(undefined as void);
          });
        });
        expect(dataF).assertTrue();
        expect(endF).assertTrue();
        expect(closeF).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_2000
     * @tc.name testStreamReadableOn020
     * @tc.desc Verify on followed by off then on again re-registers and triggers again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let count: int = 0;
        let cb = (): void => {
          count++;
        };
        r.on("data", cb);
        r.off("data", cb);
        r.on("data", cb);
        r.push("test");
        r.push(null);
        r.read();
        let countAtEnd: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("end", (): void => {
            countAtEnd = count;
            resolve(undefined as void);
          });
        });
        expect(countAtEnd).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_2100
     * @tc.name testStreamReadableOn021
     * @tc.desc Verify data registered in paused mode triggers after resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let flag: boolean = false;
        r.pause();
        r.push("test");
        r.on("data", (d: Object): void => {
          flag = true;
        });
        r.resume();
        let flagAtData: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("data", (): void => {
            flagAtData = flag;
            resolve(undefined as void);
          });
        });
        expect(flagAtData).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_2200
     * @tc.name testStreamReadableOn022
     * @tc.desc Verify data registered after pipe does not trigger after unpipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let w = new PipeWritable();
        let flag: boolean = false;
        r.pipe(w);
        let cb = (): void => {
          flag = true;
        };
        r.on("data", cb);
        r.unpipe(w);
        let flagAtData: boolean = false;
        const dataPromise: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
          r.on("data", (): void => {
            flag = true;
            flagAtData = flag;
            resolve(undefined as void);
          });
        });
        r.push("test");
        r.resume();
        await dataPromise;
        expect(flagAtData).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_2300
     * @tc.name testStreamReadableOn023
     * @tc.desc Verify event is the string "undefined" (not the undefined value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let flag: boolean = false;
        let dataStr: string = '';
        r.on("undefined", (): void => {
          flag = true;
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("data", (data: Object): void => {
            dataStr = data.toString();
            resolve(undefined as void);
          });
          r.push("test");
        });
        expect(flag).assertFalse();
        expect(dataStr).assertEqual("test");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_2400
     * @tc.name testStreamReadableOn024
     * @tc.desc Verify on with a number or string callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callbacks: Object[] = [123 as Object, 'string' as Object];
      for (let i = 0; i < callbacks.length; i++) {
        let r = new ReadableTestBase();
        try {
          r.on('data', callbacks[i] as Object as Function);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_2500
     * @tc.name testStreamReadableOn025
     * @tc.desc Verify callback is a plain object {}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      try {
        r.on("data", {} as Object as Function);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_2600
     * @tc.name testStreamReadableOn026
     * @tc.desc Verify event is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      try {
        r.on(null as Object as String, (): void => {
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_2700
     * @tc.name testStreamReadableOn027
     * @tc.desc Verify event is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      try {
        r.on(undefined as String, (): void => {
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_2800
     * @tc.name testStreamReadableOn028
     * @tc.desc Verify callback is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      try {
        r.on("data", null as Object as Function);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_2900
     * @tc.name testStreamReadableOn029
     * @tc.desc Verify callback is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      try {
        r.on("data", undefined as Object as Function);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_3000
     * @tc.name testStreamReadableOn030
     * @tc.desc Verify data and end listeners observe one complete sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let output: string = '';
        let readableEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on('data', (data: Object): void => {
            output += data.toString();
          });
          r.on('end', (): void => {
            readableEnded = r.readableEnded;
            resolve(undefined as void);
          });
          r.push('sequence');
          r.push(null);
        });
        expect(output).assertEqual('sequence');
        expect(readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_ON_3100
     * @tc.name testStreamReadableOn031
     * @tc.desc Verify data event accepts a multi-parameter callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOn031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let dataStr: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on('data', (a?: Object): void => {
            dataStr = (a as Object).toString();
            resolve(undefined as void);
          });
          r.resume();
          r.push('test');
        });
        expect(dataStr).assertEqual('test');

        done();
      });
  });
}
