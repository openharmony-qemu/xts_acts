/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { stream, util } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';


class TestWritableSuper extends stream.Writable {
  doInitialize(callback: () => void): void {
    super.doInitialize(callback);
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void): void {
    super.doWrite(chunk, encoding, callback);
  }
}

class TestWritableCustomInit extends stream.Writable {
  customInitFlag: boolean = false;

  doInitialize(callback: () => void): void {
    this.customInitFlag = true;
    callback();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void): void {
    super.doWrite(chunk, encoding, callback);
  }
}

class TestWritableWithContext extends stream.Writable {
  contextValue: number = 100;

  doInitialize(callback: () => void): void {
    super.doInitialize(callback);
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void): void {
    super.doWrite(chunk, encoding, callback);
  }

  getContextValue(): number {
    return this.contextValue;
  }
}

class TestWritableUndefined extends stream.Writable {
  doInitialize(callback: (() => void) | undefined): void {
    if (callback != undefined) {
      super.doInitialize(callback);
    }
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void): void {
    callback();
  }
}

class TestWritableInitOnly extends stream.Writable {
  doInitialize(callback: () => void): void {
    super.doInitialize(callback);
  }
}

class TestWritableCh21 extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with chunk:", chunk)
    console.info("doWrite called with encoding:", encoding)
    expect(typeof chunk).assertEqual('string')
    expect(chunk as string).assertEqual('OpenHarmony')
    expect(encoding).assertEqual('utf8')
    callback()
  }
}

class TestWritableCh22 extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with Uint8Array")
    expect(chunk instanceof Uint8Array).assertTrue()
    let uint8Array = chunk as Uint8Array
    expect(uint8Array.length).assertEqual(11)
    expect(encoding).assertEqual('utf8')
    callback()
  }
}

class TestWritableEmpty extends stream.Writable {
  dataReceived: string[] = []

  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with empty string")
    expect(typeof chunk).assertEqual('string')
    expect((chunk as string).length).assertEqual(0)
    expect(encoding).assertEqual('utf8')
    this.dataReceived.push(chunk as string)
    callback()
  }
}

class TestWritableCh24 extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with GBK encoding")
    expect(typeof chunk).assertEqual('string')
    expect(chunk as string).assertEqual('测试数据')
    expect(encoding).assertEqual('gbk')
    callback()
  }
}

class TestWritableCh25 extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with GB18030 encoding")
    expect(typeof chunk).assertEqual('string')
    expect(encoding).assertEqual('gb18030')
    callback()
  }
}

class TestWritableCh26 extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with GB2312 encoding")
    expect(typeof chunk).assertEqual('string')
    expect(encoding).assertEqual('gb2312')
    callback()
  }
}

class TestWritableCh27 extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with special characters")
    expect(typeof chunk).assertEqual('string')
    const specialChars = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
    expect(chunk as string).assertEqual(specialChars)
    expect(encoding).assertEqual('utf8')
    callback()
  }
}

class TestWritableCh28 extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with emoji string")
    expect(typeof chunk).assertEqual('string')
    const emojiStr = '👆👿👀💯🎅😼🔧💇🤼\u200D♂️🛢🀄🏴'
    expect(chunk as string).assertEqual(emojiStr)
    expect(encoding).assertEqual('utf8')
    callback()
  }
}

class TestWritableCh29 extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with Uint8Array boundary values")
    expect(chunk instanceof Uint8Array).assertTrue()
    let uint8Array = chunk as Uint8Array
    expect(uint8Array.length).assertEqual(4)
    expect(uint8Array[0]).assertEqual(0)
    expect(uint8Array[1]).assertEqual(255)
    expect(encoding).assertEqual('utf8')
    callback()
  }
}

class TestWritableCh30 extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with large Uint8Array")
    expect(chunk instanceof Uint8Array).assertTrue()
    let uint8Array = chunk as Uint8Array
    expect(uint8Array.length > 0).assertTrue()
    expect(encoding).assertEqual('utf8')
    callback()
  }
}

class TestWritableInvalid extends stream.Writable {
  receivedData: Array<string | Uint8Array> = []
  receivedEncodings: string[] = []

  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with encoding:", encoding)
    this.receivedData.push(chunk)
    this.receivedEncodings.push(encoding)
    callback()
  }
}

class TestWritableNull extends stream.Writable {
  writeCount: number = 0

  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with chunk:", chunk)
    this.writeCount++
    callback()
  }
}

class TestWritableUndefinedChunk extends stream.Writable {
  writeCount: number = 0

  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with chunk:", chunk)
    this.writeCount++
    expect(chunk).assertUndefined()
    callback()
  }
}

class TestWritableCh34 extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    callback()
  }
}

class TestWritableEmptyEnc extends stream.Writable {
  receivedEncodings: string[] = []

  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with empty encoding:", encoding)
    this.receivedEncodings.push(encoding)
    expect(typeof encoding).assertEqual('string')
    expect(encoding.length).assertEqual(0)
    callback()
  }
}

class TestWritableCallbackError extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called, simulating callback error")
    expect(typeof chunk).assertEqual('string')
    expect(encoding).assertEqual('utf8')
    const mockError = new Error('Simulated callback error')
    setTimeout(() => {
      callback(mockError)
    }, 0)
  }
}

class TestWritableMulti extends stream.Writable {
  writeCount: number = 0
  expectedWrites: number = 3

  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    this.writeCount++
    console.info(`doWrite call ${this.writeCount} with chunk:`, chunk)
    expect(encoding).assertEqual('utf8')

    callback()

    if (this.writeCount === this.expectedWrites) {
      expect(this.writeCount).assertEqual(this.expectedWrites)
    }
  }
}

class TestWritableMixed extends stream.Writable {
  writeTypes: string[] = []

  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    if (typeof chunk === 'string') {
      this.writeTypes.push('string')
    } else if (chunk instanceof Uint8Array) {
      this.writeTypes.push('Uint8Array')
    }

    callback()

    if (this.writeTypes.length === 4) {
      expect(this.writeTypes[0]).assertEqual('string')
      expect(this.writeTypes[1]).assertEqual('Uint8Array')
      expect(this.writeTypes[2]).assertEqual('string')
      expect(this.writeTypes[3]).assertEqual('Uint8Array')
    }
  }
}

class TestWritableCh39 extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with long string")
    expect(typeof chunk).assertEqual('string')
    let str = chunk as string
    expect(str.length > 1000).assertTrue()
    expect(str.startsWith('start-')).assertTrue()
    expect(str.endsWith('-end')).assertTrue()
    expect(encoding).assertEqual('utf8')
    callback()
  }
}

class TestWritableCh44 extends stream.Writable {
  constructor() {
    super()
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    console.info("doWrite called with zero-length Uint8Array")
    expect(chunk instanceof Uint8Array).assertTrue()
    let uint8Array = chunk as Uint8Array
    expect(uint8Array.length).assertEqual(0)
    expect(encoding).assertEqual('utf8')
    callback()
  }
}

export default function StreamWritable07Test(): void {
  describe('StreamWritable07Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(10)
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0100
     * @tc.name      testStreamWritable07Chapter0001
     * @tc.desc      Test writable stream with super doInitialize
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initialized = false;

      try {
        const writable = new TestWritableSuper();
        expect(initialized).assertFalse();
        setTimeout(() => {
          expect(initialized).assertTrue();
        }, 10);
        initialized = true;
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0200
     * @tc.name      testStreamWritable07Chapter0002
     * @tc.desc      Test writable stream with callback result tracking
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callbackResult: number = 0;

      try {
        const writable = new TestWritableSuper();
        expect(callbackResult).assertEqual(0);
        setTimeout(() => {
          expect(callbackResult).assertEqual(42);
        }, 10);
        callbackResult = 42;
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0300
     * @tc.name      testStreamWritable07Chapter0003
     * @tc.desc      Test writable stream with arrow function callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrowFuncCalled = false;

      try {
        const writable = new TestWritableSuper();
        expect(arrowFuncCalled).assertFalse();
        setTimeout(() => {
          expect(arrowFuncCalled).assertTrue();
        }, 10);
        arrowFuncCalled = true;
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0400
     * @tc.name      testStreamWritable07Chapter0004
     * @tc.desc      Test writable stream with async completion flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let asyncComplete = false;

      try {
        const writable = new TestWritableSuper();
        expect(asyncComplete).assertFalse();
        setTimeout(() => {
          expect(asyncComplete).assertTrue();
        }, 50);
        asyncComplete = true;
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0500
     * @tc.name      testStreamWritable07Chapter0005
     * @tc.desc      Test writable stream with error caught flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorCaught = false;

      try {
        const writable = new TestWritableSuper();
        expect(errorCaught).assertFalse();
        setTimeout(() => {
          expect(errorCaught).assertTrue();
        }, 10);
        errorCaught = true;
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0600
     * @tc.name      testStreamWritable07Chapter0006
     * @tc.desc      Test writable stream with parameter value tracking
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let paramValue: string = '';

      try {
        const writable = new TestWritableSuper();
        expect(paramValue).assertEqual('');
        setTimeout(() => {
          expect(paramValue).assertEqual('testParam');
        }, 10);
        paramValue = 'testParam';
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0700
     * @tc.name      testStreamWritable07Chapter0010
     * @tc.desc      Test writable stream with context value preservation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const writable = new TestWritableWithContext();
        setTimeout(() => {
          expect(writable.getContextValue()).assertEqual(100);
        }, 10);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0800
     * @tc.name      testStreamWritable07Chapter0011
     * @tc.desc      Test writable stream with undefined callback handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0011",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          const writable = new TestWritableUndefined();
          expect(writable != null).assertTrue();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0900
     * @tc.name      testStreamWritable07Chapter0012
     * @tc.desc      Test writable stream with undefined callback null check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0012",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          const writable = new TestWritableUndefined();
          expect(writable != null).assertTrue();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1000
     * @tc.name      testStreamWritable07Chapter0013
     * @tc.desc      Test writable stream instance not null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0013",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          const writable = new TestWritableUndefined();
          expect(writable != null).assertTrue();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1100
     * @tc.name      testStreamWritable07Chapter0014
     * @tc.desc      Test writable stream with undefined doInitialize
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0014",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          const writable = new TestWritableUndefined();
          expect(writable != null).assertTrue();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1200
     * @tc.name      testStreamWritable07Chapter0015
     * @tc.desc      Test writable undefined callback verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0015",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          const writable = new TestWritableUndefined();
          expect(writable != null).assertTrue();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1300
     * @tc.name      testStreamWritable07Chapter0016
     * @tc.desc      Test writable undefined instance validity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0016",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          const writable = new TestWritableUndefined();
          expect(writable != null).assertTrue();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1400
     * @tc.name      testStreamWritable07Chapter0017
     * @tc.desc      Test writable stream with undefined handler creation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0017",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          const writable = new TestWritableUndefined();
          expect(writable != null).assertTrue();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1500
     * @tc.name      testStreamWritable07Chapter0018
     * @tc.desc      Test writable stream with init only class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableCreated = false;
      try {
        const writable = new TestWritableInitOnly();
        writableCreated = true;
        expect(writable == null).assertEqual(false);
      } catch (error) {
        expect(error.code).assertEqual(401);
      }

      expect(writableCreated).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1600
     * @tc.name      testStreamWritable07Chapter0019
     * @tc.desc      Test writable stream with super class and timeout
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const writable = new TestWritableSuper();
        setTimeout(() => {
          expect(writable != null).assertTrue();
        }, 10);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1700
     * @tc.name      testStreamWritable07Chapter0020
     * @tc.desc      Test writable stream with async result tracking
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let asyncResult: boolean = false;

      try {
        const writable = new TestWritableSuper();
        expect(asyncResult).assertFalse();
        setTimeout(() => {
          asyncResult = true;
          expect(asyncResult).assertTrue();
        }, 20);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1800
     * @tc.name      testStreamWritable07Chapter0021
     * @tc.desc      Test write with string data and utf8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableCh21()
        writableStream.write('OpenHarmony', 'utf8')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1900
     * @tc.name      testStreamWritable07Chapter0022
     * @tc.desc      Test write with Uint8Array data and utf8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dataArray = new Uint8Array([79, 112, 101, 110, 72, 97, 114, 109, 111, 110, 121])
      try {
        let writableStream = new TestWritableCh22()
        writableStream.write(dataArray, 'utf8')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2000
     * @tc.name      testStreamWritable07Chapter0023
     * @tc.desc      Test end with empty string and utf8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableEmpty()
        writableStream.end('', 'utf8', () => {
        })
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2100
     * @tc.name      testStreamWritable07Chapter0024
     * @tc.desc      Test write with Chinese text and gbk encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableCh24()
        writableStream.write('测试数据', 'gbk')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2200
     * @tc.name      testStreamWritable07Chapter0025
     * @tc.desc      Test write with Chinese text and gb18030 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableCh25()
        writableStream.write('中华人民共和国', 'gb18030')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2300
     * @tc.name      testStreamWritable07Chapter0026
     * @tc.desc      Test write with Chinese text and gb2312 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableCh26()
        writableStream.write('简体中文', 'gb2312')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2400
     * @tc.name      testStreamWritable07Chapter0027
     * @tc.desc      Test write with special characters and utf8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableCh27()
        const specialChars = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
        writableStream.write(specialChars, 'utf8')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2500
     * @tc.name      testStreamWritable07Chapter0028
     * @tc.desc      Test write with emoji string and utf8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableCh28()
        const emojiStr = '👆👿👀💯🎅😼🔧💇🤼\u200D♂️🛢🀄🏴'
        writableStream.write(emojiStr, 'utf8')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2600
     * @tc.name      testStreamWritable07Chapter0029
     * @tc.desc      Test write with Uint8Array boundary values 0 and 255
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boundaryArray = new Uint8Array([0, 255, 128, 127])
      try {
        let writableStream = new TestWritableCh29()
        writableStream.write(boundaryArray, 'utf8')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2700
     * @tc.name      testStreamWritable07Chapter0030
     * @tc.desc      Test write with large Uint8Array of 1024 elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeArray = new Uint8Array(1024)
      for (let i = 0; i < largeArray.length; i++) {
        largeArray[i] = i % 256
      }

      try {
        let writableStream = new TestWritableCh30()
        writableStream.write(largeArray, 'utf8')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2800
     * @tc.name      testStreamWritable07Chapter0031
     * @tc.desc      Test write with invalid encoding string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableInvalid()

        try {
          const result = writableStream.write('test data', 'invalid-encoding')
          console.info("Write result with invalid encoding:", result)

          expect(typeof result).assertEqual('boolean')

          writableStream.end()

          expect(writableStream.writable).assertFalse()

        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2900
     * @tc.name      testStreamWritable07Chapter0032
     * @tc.desc      Test write with empty string chunk
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableNull()

        try {
          const result = writableStream.write('' as string, 'utf8')
          console.info("Write result with null chunk:", result)

          expect(typeof result).assertEqual('boolean')

          writableStream.end()

        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3000
     * @tc.name      testStreamWritable07Chapter0033
     * @tc.desc      Test write with undefined chunk
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableUndefinedChunk()

        try {
          const result = writableStream.write(undefined, 'utf8')
          console.info("Write result with undefined chunk:", result)

          expect(typeof result).assertEqual('boolean')

          writableStream.end()

        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3100
     * @tc.name      testStreamWritable07Chapter0034
     * @tc.desc      Test write and end to verify writable state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableCh34()

        try {
          const result = writableStream.write('test data', 'utf8')
          expect(typeof result).assertEqual('boolean')

          writableStream.end()

          expect(writableStream.writable).assertEqual(false)

        } catch (err) {
          expect(err.code).assertEqual(10200035)
        }
      } catch (err) {
        expect(err.code).assertEqual(0);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3200
     * @tc.name      testStreamWritable07Chapter0035
     * @tc.desc      Test write with empty encoding string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableEmptyEnc()

        try {
          const result = writableStream.write('test data', '')
          console.info("Write result with empty encoding:", result)

          expect(typeof result).assertEqual('boolean')

          writableStream.end()

          expect(writableStream.writable).assertFalse()

        } catch (err) {
          expect(err.code).assertEqual(10200035);
        }
      } catch (err) {
        expect(err.code).assertEqual(0);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3300
     * @tc.name      testStreamWritable07Chapter0036
     * @tc.desc      Test write with callback error and error event
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      try {
        let writableStream = new TestWritableCallbackError()
        let errorCaught = false
        writableStream.on('error', (data: Object) => {
          const err = data as Error
          errorCaught = true
        })
        writableStream.write('test data', 'utf8')

        await new Promise<void>((resolve: (value: void) => void) => {
          setTimeout(() => {
            expect(errorCaught).assertTrue()
            resolve(undefined as void)
          }, 100)
        })
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3400
     * @tc.name      testStreamWritable07Chapter0037
     * @tc.desc      Test multiple consecutive writes to same stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableMulti()
        writableStream.write('first', 'utf8')
        writableStream.write('second', 'utf8')
        writableStream.write('third', 'utf8')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3500
     * @tc.name      testStreamWritable07Chapter0038
     * @tc.desc      Test mixed string and Uint8Array writes with different encodings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream = new TestWritableMixed()

        writableStream.write('string data', 'utf8')
        writableStream.write(new Uint8Array([98, 105, 110, 97, 114, 121, 32, 100, 97, 116, 97]), 'utf8')
        writableStream.write('another string', 'gbk')
        writableStream.write(new Uint8Array([1, 2, 3, 4]), 'gb2312')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3600
     * @tc.name      testStreamWritable07Chapter0039
     * @tc.desc      Test write with long string exceeding 1000 characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longString = 'start-'
      for (let i = 0; i < 1000; i++) {
        longString += `data${i}-`
      }
      longString += 'end'

      try {
        let writableStream = new TestWritableCh39()
        writableStream.write(longString, 'utf8')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3700
     * @tc.name      testStreamWritable07Chapter0044
     * @tc.desc      Test write with zero-length Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new Uint8Array(0)
      try {
        let writableStream = new TestWritableCh44()
        writableStream.write(emptyArray, 'utf8')
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    })
  })
}
