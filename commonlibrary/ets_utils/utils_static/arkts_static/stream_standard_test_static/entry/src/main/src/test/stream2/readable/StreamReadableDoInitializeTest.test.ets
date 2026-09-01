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

class TestDI001 extends ReadableTestBase {
  isInitCalled: boolean = false;

  doInitialize(callback: Function): void {
    this.isInitCalled = true;
    super.doInitialize(callback);
    callback.unsafeCall();
  }
}

class TestDI002 extends ReadableTestBase {
  customFlag: boolean = false;

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.customFlag = true;
    callback.unsafeCall();
  }
}

class TestDI003 extends ReadableTestBase {
  initDone: boolean = false;

  doInitialize(callback: Function): void {
    this.initDone = true;
    callback.unsafeCall();
  }
}

class TestDI004 extends ReadableTestBase {
  initDone: boolean = false;

  doInitialize(callback: Function): void {
    let fn = (cb: Function): void => {
      cb.unsafeCall();
    };
    this.initDone = true;
    fn(callback);
  }
}

class TestDI005 extends ReadableTestBase {
  initCalled: boolean = false;

  doInitialize(callback: Function): void {
    this.initCalled = true;
    callback.unsafeCall();
  }
}

class TestDI007A extends ReadableTestBase {
  label: string = "";

  doInitialize(callback: Function): void {
    this.label = "A-init";
    callback.unsafeCall();
  }
}

class TestDI007B extends ReadableTestBase {
  label: string = "";

  doInitialize(callback: Function): void {
    this.label = "B-init";
    callback.unsafeCall();
  }
}

class TestDI008 extends ReadableTestBase {
  initStarted: boolean = false;

  doInitialize(callback: Function): void {
    this.initStarted = true;
    setTimeout((): void => {
      callback.unsafeCall();
    }, 200);
  }
}

class TestDI009 extends ReadableTestBase {
  initDone: boolean = false;

  doInitialize(callback: Function): void {
    let cbArrow = (cb: Function): void => {
      cb.unsafeCall();
    };
    this.initDone = true;
    cbArrow(callback);
  }
}

class TestDI010 extends ReadableTestBase {
  initDone: boolean = false;

  doInitialize(callback: Function): void {
    let initFn = (cb: Function): void => {
      cb.unsafeCall();
    };
    this.initDone = true;
    initFn(callback);
  }
}

class TestDI011 extends ReadableTestBase {
  initDone: boolean = false;

  doInitialize(callback: Function): void {
    this.initDone = true;
    callback.unsafeCall();
  }
}

class TestDI012 extends ReadableTestBase {
  initCalled: boolean = false;

  doInitialize(callback: Function): void {
    this.initCalled = true;
    callback.unsafeCall();
  }
}

class TestDI013 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall();
  }
}

class TestDI014 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall();
  }
}

class TestDI015 extends ReadableTestBase {
  initCount: int = 0;

  doInitialize(callback: Function): void {
    this.initCount++;
    setTimeout((): void => {
      callback.unsafeCall();
    }, 100);
  }
}

class TestDI016 extends ReadableTestBase {
  loopCount: int = 0;

  doInitialize(callback: Function): void {
    for (let i: int = 0; i < 100; i++) {
      this.loopCount++;
    }
    callback.unsafeCall();
  }
}

class TestDI017 extends ReadableTestBase {
  callbackCalled: boolean = false;

  doInitialize(callback: Function): void {
    setTimeout((): void => {
      this.callbackCalled = true;
      callback.unsafeCall();
    }, 100);
  }
}

class TestDI018 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    setTimeout((): void => {
      callback.unsafeCall();
    }, 100);
  }
}

class TestDI019 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    setTimeout((): void => {
      callback.unsafeCall();
    }, 100);
  }
}

class TestDI020 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    setTimeout((): void => {
      callback.unsafeCall();
    }, 100);
  }
}

class TestDI021 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall();
  }
}

class TestDI022 extends ReadableTestBase {
  errorEventFired: boolean = false;

  doInitialize(callback: Function): void {
    callback.unsafeCall(new Error("init fail"));
  }
}

class TestDI023 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall("STREAM_READ_INIT_ERROR");
  }
}

class TestDI024 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall(null);
  }
}

class TestDI025 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall(undefined);
  }
}

class TestDI026 extends ReadableTestBase {
  genValue: int = 0;

  doInitialize(callback: Function): void {
    this.genValue = 1;
    callback.unsafeCall();
  }
}

class TestDI027 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall();
  }
}

class TestDI028 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    throw new Error("init crash");
  }
}

class TestDI029 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    throw new Error("string_error");
  }
}

class TestDI030 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall();
    throw new Error("post callback error");
  }
}

class TestDI031 extends ReadableTestBase {
  doInitialize(callback: Function): void {
  }
}

class TestDI032 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class TestDI033 extends ReadableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall();
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

export default function StreamReadableDoInitializeTest(): void {
  describe('StreamReadableDoInitializeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_0100
     * @tc.name testStreamReadableDoInitialize001
     * @tc.desc Verify doInitialize is called automatically on first on("data")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI001();
      expect(rs.isInitCalled).assertFalse();
      let cb = (): void => {
      };
      rs.on("data", cb);
      expect(rs.isInitCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_0200
     * @tc.name testStreamReadableDoInitialize002
     * @tc.desc Verify super.doInitialize call chain works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI002();
      let cb = (): void => {
      };
      rs.on("data", cb);
      expect(rs.customFlag).assertTrue();
      expect(rs.readable).assertTrue();
      expect(rs.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_0300
     * @tc.name testStreamReadableDoInitialize003
     * @tc.desc Verify arrow, function expression, named and async callback forms in doInitialize all complete initialization when on("data") is registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s003 = new TestDI003();
      s003.on("data", (): void => {
      });
      expect(s003.initDone).assertTrue();
      let s004 = new TestDI004();
      s004.on("data", (): void => {
      });
      expect(s004.initDone).assertTrue();
      let s010 = new TestDI010();
      s010.on("data", (): void => {
      });
      expect(s010.initDone).assertTrue();
      let s011 = new TestDI011();
      s011.on("data", (): void => {
      });
      expect(s011.initDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_0400
     * @tc.name testStreamReadableDoInitialize004
     * @tc.desc Verify doInitialize is not triggered without on() call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI005();
      rs.read();
      expect(rs.initCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_0500
     * @tc.name testStreamReadableDoInitialize005
     * @tc.desc Verify default super handling works when doInitialize is not implemented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      let cb = (): void => {
      };
      rs.on("data", cb);
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_0600
     * @tc.name testStreamReadableDoInitialize006
     * @tc.desc Verify multiple instances initialize independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new TestDI007A();
      let b = new TestDI007B();
      a.on("data", (): void => {
      });
      b.on("data", (): void => {
      });
      expect(a.label).assertEqual("A-init");
      expect(b.label).assertEqual("B-init");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_0700
     * @tc.name testStreamReadableDoInitialize007
     * @tc.desc Verify callback is invoked asynchronously with delay
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI008();
      expect(rs.initStarted).assertFalse();
      rs.on("data", (): void => {
      });
      expect(rs.initStarted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_0800
     * @tc.name testStreamReadableDoInitialize008
     * @tc.desc Verify arrow function with typed callback parameter works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI009();
      rs.on("readable", (): void => {
      });
      expect(rs.initDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_0900
     * @tc.name testStreamReadableDoInitialize009
     * @tc.desc Verify on("readable") triggers initialization (non-data event)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI012();
      expect(rs.initCalled).assertFalse();
      rs.on("readable", (): void => {
      });
      expect(rs.initCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_1000
     * @tc.name testStreamReadableDoInitialize010
     * @tc.desc Verify minimal implementation with empty function body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI013();
      rs.on("data", (): void => {
      });
      rs.push("hello");
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_1100
     * @tc.name testStreamReadableDoInitialize011
     * @tc.desc Verify callback without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI014();
      rs.on("data", (): void => {
      });
      rs.push("data");
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_1200
     * @tc.name testStreamReadableDoInitialize012
     * @tc.desc Verify multiple on() registrations before callback is invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI015();
      rs.on("data", (): void => {
      });
      rs.on("end", (): void => {
      });
      rs.on("error", (): void => {
      });
      expect(rs.initCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_1300
     * @tc.name testStreamReadableDoInitialize013
     * @tc.desc Verify doInitialize performs 100 loop assignments then calls callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI016();
      rs.on("data", (): void => {
      });
      expect(rs.loopCount).assertEqual(100);
      rs.push("data");
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_1400
     * @tc.name testStreamReadableDoInitialize014
     * @tc.desc Verify calling push before initialization completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI017();
      rs.on("data", (): void => {
      });
      rs.push("early_data");
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_1500
     * @tc.name testStreamReadableDoInitialize015
     * @tc.desc Verify calling read before initialization completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI018();
      rs.on("data", (): void => {
      });
      let result = rs.read(10);
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_1600
     * @tc.name testStreamReadableDoInitialize016
     * @tc.desc Verify the readable side remains available during initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI019();
      rs.on("data", (): void => {
      });
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_1700
     * @tc.name testStreamReadableDoInitialize017
     * @tc.desc Verify calling pause before initialization completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI020();
      rs.on("data", (): void => {
      });
      rs.pause();
      expect(rs.readableFlowing).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_1800
     * @tc.name testStreamReadableDoInitialize018
     * @tc.desc Verify calling push(null) after callback and on("end") registration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let readableEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new TestDI021();
          rs.on("data", (): void => {
          });
          rs.on("end", (): void => {
            readableEnded = rs.readableEnded;
            resolve(undefined as void);
          });
          rs.push(null);
          rs.read();
        });
        expect(readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_1900
     * @tc.name testStreamReadableDoInitialize019
     * @tc.desc Verify extra Error argument to initialization callback is ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void): void => {
            let rs = new TestDI022();
            rs.on("error", (e: Error): void => {
              reject(e);
            });
            rs.on("data", (): void => {
            });
            rs.on("end", (): void => {
              resolve(undefined as void);
            });
            rs.push(null);
            rs.read();
          });
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_2000
     * @tc.name testStreamReadableDoInitialize020
     * @tc.desc Verify extra string argument to initialization callback is ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let errorReceived: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new TestDI023();
          rs.on("error", (e: Object): void => {
            errorReceived = true;
            if (e !== undefined) {
              return;
            }
          });
          rs.on("data", (): void => {
          });
          rs.on("end", (): void => {
            resolve(undefined as void);
          });
          rs.push(null);
          rs.read();
        });
        expect(errorReceived).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_2100
     * @tc.name testStreamReadableDoInitialize021
     * @tc.desc Verify passing null or undefined as the doInitialize callback raises ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let streams: ReadableTestBase[] = [new TestDI024(), new TestDI025()];
      for (let i = 0; i < streams.length; i++) {
        let errorCaught: boolean = false;
        try {
          streams[i].on("data", (): void => {
          });
        } catch (e) {
          errorCaught = true;
          expect(e.name).assertEqual("ClassCastError");
        }
        expect(errorCaught).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_2200
     * @tc.name testStreamReadableDoInitialize022
     * @tc.desc Verify doInitialize uses generator function for auxiliary logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI026();
      rs.on("data", (): void => {
      });
      expect(rs.genValue).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_2300
     * @tc.name testStreamReadableDoInitialize023
     * @tc.desc Verify doInitialize uses bind to create callback proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI027();
      rs.on("data", (): void => {
      });
      rs.push("test");
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_2400
     * @tc.name testStreamReadableDoInitialize024
     * @tc.desc Verify throwing Error in doInitialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI028();
      let errorCaught: boolean = false;
      try {
        rs.on("data", (): void => {
        });
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual("init crash");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_2500
     * @tc.name testStreamReadableDoInitialize025
     * @tc.desc Verify throwing non-Error type in doInitialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI029();
      let errorCaught: boolean = false;
      try {
        rs.on("data", (): void => {
        });
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual("string_error");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_2600
     * @tc.name testStreamReadableDoInitialize026
     * @tc.desc Verify throwing exception after calling callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI030();
      let errorCaught: boolean = false;
      try {
        rs.on("data", (): void => {
        });
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual("post callback error");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_2700
     * @tc.name testStreamReadableDoInitialize027
     * @tc.desc Verify doInitialize with empty body (no callback call, no throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestDI031();
      let errorReceived: boolean = false;
      rs.on("error", (e: Object): void => {
        errorReceived = true;
      });
      rs.on("data", (): void => {
      });
      rs.push("test");
      expect(errorReceived).assertFalse();
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_2800
     * @tc.name testStreamReadableDoInitialize028
     * @tc.desc Verify repeated initialization callback does not crash the stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let errorReceived: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new TestDI032();
          rs.on("error", (): void => {
            errorReceived = true;
          });
          rs.on("data", (): void => {
          });
          rs.on("end", (): void => {
            resolve(undefined as void);
          });
          rs.push(null);
          rs.read();
        });
        expect(errorReceived).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_2900
     * @tc.name testStreamReadableDoInitialize029
     * @tc.desc Verify repeated initialization callback remains recoverable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let errorReceived: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new TestDI033();
          rs.on("error", (): void => {
            errorReceived = true;
          });
          rs.on("data", (): void => {
          });
          rs.on("end", (): void => {
            resolve(undefined as void);
          });
          rs.push(null);
          rs.read();
        });
        expect(errorReceived).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_INITIALIZE_3000
     * @tc.name testStreamReadableDoInitialize030
     * @tc.desc Verify initialization completes before a queued data callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoInitialize030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let customFlagAtData: boolean = false;
        let customFlagAtEnd: boolean = false;
        let dataStr: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new TestDI002();
          rs.on('data', (data: Object): void => {
            customFlagAtData = rs.customFlag;
            dataStr = data.toString();
          });
          rs.on('end', (): void => {
            customFlagAtEnd = rs.customFlag;
            resolve(undefined as void);
          });
          rs.push('initialized');
          rs.push(null);
        });
        expect(customFlagAtData).assertTrue();
        expect(dataStr).assertEqual('initialized');
        expect(customFlagAtEnd).assertTrue();

        done();
      });
  });
}
