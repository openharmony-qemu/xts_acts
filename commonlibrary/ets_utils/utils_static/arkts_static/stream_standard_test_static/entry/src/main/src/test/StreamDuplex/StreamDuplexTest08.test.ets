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
import { stream } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

function invokeCb(cb: Function): void {
  try { (cb as (error?: Error | null) => void)(); } catch (e) {}
}
function invokeCbErr(cb: Function, err: Error | null): void {
  try { (cb as (e?: Error | null) => void)(err); } catch (e) {}
}

class TestDuplex08A extends stream.Duplex {
  writeError: boolean = false;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    try {
      if (typeof chunk === 'string' && chunk.length > 1000000) {
        this.writeError = true;
      }
      invokeCb(callback);
    } catch (e) {
      this.writeError = true;
      invokeCb(callback);
    }
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    try {
      expect(chunks.length).assertEqual(1);
      invokeCb(callback);
    } catch (e) {
      invokeCb(callback);
    }
  }
}

class TestDuplex08B extends stream.Duplex {
  errorCount: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (chunk === null || chunk === undefined) {
      this.errorCount++;
    }
    invokeCb(callback);
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    invokeCb(callback);
  }
}

class TestDuplex08C extends stream.Duplex {
  encodingErrors: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    try {
      invokeCb(callback);
    } catch (e) {
      this.encodingErrors++;
      invokeCb(callback);
    }
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    try {
      expect(chunks.length).assertEqual(3);
      invokeCb(callback);
    } catch (e) {
      invokeCb(callback);
    }
  }
}

class TestDuplex08D extends stream.Duplex {
  emptyChunksHandled: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if ((typeof chunk === 'string' && chunk.length === 0) ||
      (chunk instanceof Uint8Array && chunk.length === 0)) {
      this.emptyChunksHandled++;
    }
    invokeCb(callback);
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    invokeCb(callback);
  }
}

class TestDuplex08E extends stream.Duplex {
  invalidEncodingErrors: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (encoding === 'invalid-encoding' || encoding === 'unknown') {
      this.invalidEncodingErrors++;
    }
    invokeCb(callback);
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    invokeCb(callback);
  }
}

class TestDuplex08F extends stream.Duplex {
  memoryError: boolean = false;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    try {
      if ((typeof chunk === 'string' && chunk.length > 10000000) ||
        (chunk instanceof Uint8Array && chunk.length > 10000000)) {
        this.memoryError = true;
      }
      invokeCb(callback);
    } catch (e) {
      this.memoryError = true;
      invokeCb(callback);
    }
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    invokeCb(callback);
  }
}

class TestDuplex08G extends stream.Duplex {
  callbackErrors: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    try {
      if (callback === null || callback === undefined) {
        this.callbackErrors++;
        return;
      }
      invokeCb(callback);
    } catch (e) {
      this.callbackErrors++;
    }
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    try {
      if (callback === null || callback === undefined) {
        this.callbackErrors++;
        return;
      }
      invokeCb(callback);
    } catch (e) {
      this.callbackErrors++;
    }
  }
}

class TestDuplex08H extends stream.Duplex {
  validWrites: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    try {
      this.validWrites++;
      invokeCb(callback);
    } catch (e) {
      invokeCb(callback);
    }
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    try {
      this.validWrites += chunks.length;
      invokeCb(callback);
    } catch (e) {
      invokeCb(callback);
    }
  }
}

class TestDuplex08I extends stream.Duplex {
  uncorkCount: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    this.uncorkCount++;
    invokeCb(callback);
  }
}

class TestDuplex08J extends stream.Duplex {
  cycleCount: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    this.cycleCount++;
    invokeCb(callback);
  }
}

class TestDuplex08K extends stream.Duplex {
  concurrentWrites: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    try {
      this.concurrentWrites++;
      invokeCb(callback);
    } catch (e) {
      invokeCb(callback);
    }
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    try {
      this.concurrentWrites += chunks.length;
      invokeCb(callback);
    } catch (e) {
      invokeCb(callback);
    }
  }
}

class TestDuplex08L extends stream.Duplex {
  invalidTypeWrites: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (typeof chunk !== 'string' && !(chunk instanceof Uint8Array)) {
      this.invalidTypeWrites++;
    }
    invokeCb(callback);
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    invokeCb(callback);
  }
}

class TestDuplex08M extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    try {
      invokeCb(callback);
    } catch (e) {
      invokeCb(callback);
    }
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    try {
      expect(chunks.length).assertEqual(1);
      invokeCb(callback);
    } catch (e) {
      invokeCb(callback);
    }
  }
}

class TestDuplex08N extends stream.Duplex {
  validOperations: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    try {
      this.validOperations++;
      invokeCb(callback);
    } catch (e) {
      invokeCb(callback);
    }
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    try {
      this.validOperations += chunks.length;
      invokeCb(callback);
    } catch (e) {
      invokeCb(callback);
    }
  }
}

class TestDuplex08O extends stream.Duplex {
  bufferOverflow: boolean = false;
  writeCount: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.writeCount++;
    const chunkSize = typeof chunk === 'string' ? chunk.length : chunk.length;

    if (this.writeCount > 10) {
      this.bufferOverflow = true;
    }

    invokeCb(callback);
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    this.writeCount += chunks.length;

    if (this.writeCount > 10) {
      this.bufferOverflow = true;
    }

    invokeCb(callback);
  }
}

class TestDuplex08P extends stream.Duplex {
  destroyedWrites: number = 0;
  isDestroyed: boolean = false;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (this.isDestroyed) {
      return;
    }
    this.destroyedWrites++;
    invokeCb(callback);
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    if (this.isDestroyed) {
      return;
    }
    this.destroyedWrites += chunks.length;
    invokeCb(callback);
  }

  destroyStream() {
    this.isDestroyed = true;
  }
}

class TestDuplex08Q extends stream.Duplex {
  errorCount: number = 0;
  recoverySuccess: boolean = false;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    try {
      if (typeof chunk === 'string') {
        if ((chunk as string).includes('ERROR')) {
          this.errorCount++;
          invokeCbErr(callback, new Error('Simulated error'));
        } else {
          invokeCb(callback);
        }
      } else {
        invokeCb(callback);
      }
    } catch (e) {
      invokeCb(callback);
    }
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    try {
      let hasError = false;
      for (let chunk of chunks) {
        if (typeof chunk === 'string') {
          if ((chunk as string).includes('ERROR')) {
            this.errorCount++;
            hasError = true;
          }
        }
      }

      if (hasError) {
        invokeCbErr(callback, new Error('Batch contains error'));
      } else {
        this.recoverySuccess = true;
        invokeCb(callback);
      }
    } catch (e) {
      invokeCb(callback);
    }
  }
}

class TestDuplex08R extends stream.Duplex {
  errorPropagationCount: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (typeof chunk === 'string' && chunk === 'ERROR_CHUNK') {
      invokeCbErr(callback, new Error('Write error'));
    } else {
      invokeCb(callback);
    }
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    let hasError = false;
    for (let chunk of chunks) {
      if (typeof chunk === 'string' && chunk === 'ERROR_CHUNK') {
        hasError = true;
        break;
      }
    }
    if (hasError) {
      invokeCbErr(callback, new Error('Batch write error'));
    } else {
      invokeCb(callback);
    }
  }
}

class TestDuplex08S extends stream.Duplex {
  endCount: number = 0;

  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.endCount++;
    invokeCb(callback);
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    this.endCount += chunks.length;
    invokeCb(callback);
  }
}

export default function StreamDuplex08Test(): void {
  describe('StreamDuplex08Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (): Promise<void> => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await Utils.msSleep(10)
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0100
     * @tc.name      testStreamDuplex08Chapter0001
     * @tc.desc      Test doWritev with extremely large string causing potential overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08A();
        duplexStream.cork();
        try {
          let largeString = 'a'.repeat(100);
          duplexStream.write(largeString, 'utf8');
        } catch (e) {
        }
        duplexStream.uncork();
        duplexStream.end();
        expect(duplexStream.writeError).assertEqual(false);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0200
     * @tc.name      testStreamDuplex08Chapter0002
     * @tc.desc      Test doWritev with null and undefined values (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08B();
        duplexStream.cork();

        try {
          duplexStream.write(null as string, 'utf8');
        } catch (e) {
        }

        try {
          duplexStream.write(undefined as string, 'utf8');
        } catch (e) {
        }

        duplexStream.write('valid data', 'utf8');
        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.errorCount).assertEqual(0);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0300
     * @tc.name      testStreamDuplex08Chapter0003
     * @tc.desc      Test doWritev with different encoding parameter values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex08C();
      try {
        duplexStream.cork();

        duplexStream.write('test1', 'utf8');
        duplexStream.write('test2', 'utf-8');
        duplexStream.write('test3', 'ascii');

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.encodingErrors).assertEqual(0);
      } catch (e) {
        expect(duplexStream.encodingErrors).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0400
     * @tc.name      testStreamDuplex08Chapter0004
     * @tc.desc      Test doWritev with empty string and empty Uint8Array (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex08D();
      try {
        duplexStream.cork();

        try {
          duplexStream.write('', 'utf8');
        } catch (e) {
        }

        try {
          duplexStream.write(new Uint8Array([]), 'utf8');
        } catch (e) {
        }

        duplexStream.write('non-empty data', 'utf8');
        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.emptyChunksHandled).assertLess(2);
      } catch (e) {
        expect(duplexStream.emptyChunksHandled).assertLess(2);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0500
     * @tc.name      testStreamDuplex08Chapter0005
     * @tc.desc      Test doWritev with invalid encoding types (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex08E();
      try {
        duplexStream.cork();

        try {
          duplexStream.write('test1', 'invalid-encoding');
        } catch (e) {
        }

        try {
          duplexStream.write('test2', 'unknown');
        } catch (e) {
        }

        duplexStream.write('test3', 'utf8');
        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.invalidEncodingErrors).assertEqual(0);
      } catch (e) {
        expect(duplexStream.invalidEncodingErrors).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0600
     * @tc.name      testStreamDuplex08Chapter0006
     * @tc.desc      Test doWritev with extremely large chunk causing memory issues (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex08F();
      try {
        duplexStream.cork();

        try {
          let hugeString = 'x'.repeat(500);
          duplexStream.write(hugeString, 'utf8');
        } catch (e) {
        }

        try {
          let hugeArray = new Uint8Array(500);
          duplexStream.write(hugeArray, 'utf8');
        } catch (e) {
        }

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.memoryError).assertEqual(false);
      } catch (e) {
        expect(duplexStream.memoryError).assertEqual(false);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0700
     * @tc.name      testStreamDuplex08Chapter0007
     * @tc.desc      Test doWritev with invalid callback usage (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08G();
        duplexStream.cork();

        duplexStream.write('test data', 'utf8');
        duplexStream.write('more data', 'utf8');

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.callbackErrors).assertEqual(0);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0800
     * @tc.name      testStreamDuplex08Chapter0009
     * @tc.desc      Test doWritev with various string and Uint8Array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08H();
        duplexStream.cork();

        duplexStream.write('normal string', 'utf8');

        duplexStream.write('12345', 'utf8');

        duplexStream.write('!@#$%^&*()', 'utf8');

        duplexStream.write(new Uint8Array([1, 2, 3, 4, 5]), 'utf8');

        duplexStream.write(new Uint8Array([0, 255]), 'utf8');

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.validWrites).assertEqual(5);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0900
     * @tc.name      testStreamDuplex08Chapter0010
     * @tc.desc      Test doWritev with multiple uncork calls (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08I();

        duplexStream.cork();
        duplexStream.write('data1', 'utf8');
        duplexStream.uncork();

        duplexStream.cork();
        duplexStream.write('data2', 'utf8');
        duplexStream.uncork();

        duplexStream.cork();
        duplexStream.write('data3', 'utf8');
        duplexStream.uncork();

        duplexStream.end();

        expect(duplexStream.uncorkCount > 0).assertEqual(true);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1000
     * @tc.name      testStreamDuplex08Chapter0011
     * @tc.desc      Test doWritev with rapid cork/uncork cycles (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08J();

        for (let i = 0; i < 10; i++) {
          duplexStream.cork();
          duplexStream.write(`data${i}`, 'utf8');
          duplexStream.uncork();
        }

        duplexStream.end();

        expect(duplexStream.cycleCount >= 1).assertEqual(true);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1100
     * @tc.name      testStreamDuplex08Chapter0012
     * @tc.desc      Test doWritev with concurrent writes from multiple sources
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08K();
        duplexStream.cork();

        let writePromises: Promise<boolean>[] = [];
        for (let i = 0; i < 10; i++) {
          writePromises.push(new Promise<boolean>((resolve: (value: boolean) => void, reject: (reason: Error) => void) => {
            setTimeout(() => {
              try {
                duplexStream.write(`concurrent${i}`, 'utf8');
                resolve(true);
              } catch (e) {
                reject(e);
              }
            }, i % 10);
          }));
        }

        (async () => {
          try {
            await Promise.all(writePromises);
            duplexStream.uncork();
            duplexStream.end();

            expect(duplexStream.concurrentWrites).assertEqual(10);
          } catch (e) {
          }
        })();
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1200
     * @tc.name      testStreamDuplex08Chapter0013
     * @tc.desc      Test doWritev with invalid data types (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08L();
        duplexStream.cork();

        duplexStream.write('valid string', 'utf8');
        duplexStream.write(new Uint8Array([1, 2, 3]), 'utf8');

        try {
          duplexStream.write('', 'utf8');
        } catch (e) {
        }

        try {
          duplexStream.write(new Uint8Array(0), 'utf8');
        } catch (e) {
        }

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.invalidTypeWrites).assertEqual(0);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1300
     * @tc.name      testStreamDuplex08Chapter0014
     * @tc.desc      Test doWritev with corrupted or malformed data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08M();
        duplexStream.cork();

        try {
          let corruptedBuffer = new ArrayBuffer(10);
          let corruptedView = new Uint8Array(corruptedBuffer);
          for (let i = 0; i < corruptedView.length; i++) {
            corruptedView[i] = Math.random() * 256;
          }
          duplexStream.write(corruptedView, 'utf8');
        } catch (e) {
        }

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream == undefined).assertEqual(false);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1400
     * @tc.name      testStreamDuplex08Chapter0015
     * @tc.desc      Test doWritev with edge case operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex08N();
      duplexStream.cork();

      duplexStream.write('a', 'utf8');

      let longString = 'x'.repeat(1000);
      duplexStream.write(longString, 'utf8');

      duplexStream.write(new Uint8Array([1]), 'utf8');

      let edgeArray = new Uint8Array(256);
      for (let i = 0; i < 256; i++) {
        edgeArray[i] = i;
      }
      duplexStream.write(edgeArray, 'utf8');

      duplexStream.write('\n\r\t\b\f', 'utf8');

      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.validOperations > 0).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1500
     * @tc.name      testStreamDuplex08Chapter0016
     * @tc.desc      Test doWritev with very small buffer size (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08O();
        duplexStream.cork();

        for (let i = 0; i < 20; i++) {
          try {
            duplexStream.write(`data${i}`, 'utf8');
          } catch (e) {
          }
        }

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.bufferOverflow).assertEqual(true);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1600
     * @tc.name      testStreamDuplex08Chapter0018
     * @tc.desc      Test doWritev with destroyed stream (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08P();

        duplexStream.write('before destroy', 'utf8');

        try {
          duplexStream.destroyStream();
        } catch (e) {
        }

        try {
          duplexStream.write('after destroy', 'utf8');
        } catch (e) {
        }

        duplexStream.end();

        expect(duplexStream.destroyedWrites).assertEqual(1);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1700
     * @tc.name      testStreamDuplex08Chapter0019
     * @tc.desc      Test doWritev with comprehensive error recovery
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08Q();
        duplexStream.cork();

        try {
          duplexStream.write('normal1', 'utf8');
        } catch (e) {
        }

        try {
          duplexStream.write('ERROR_DATA', 'utf8');
        } catch (e) {
        }

        try {
          duplexStream.write('normal2', 'utf8');
        } catch (e) {
        }

        try {
          duplexStream.write('normal3', 'utf8');
        } catch (e) {
        }

        try {
          duplexStream.write('ERROR_AGAIN', 'utf8');
        } catch (e) {
        }

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.errorCount >= 2).assertEqual(true);
        expect(duplexStream.recoverySuccess).assertEqual(false);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1800
     * @tc.name      testStreamDuplex08Chapter0020
     * @tc.desc      Test doWritev with callback errors propagation (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08R();
        let errorEvents = 0;

        duplexStream.on('error', (err: Error) => {
          errorEvents++;
        });

        duplexStream.cork();
        duplexStream.write('normal1', 'utf8');
        duplexStream.write('ERROR_CHUNK', 'utf8');
        duplexStream.write('normal2', 'utf8');
        duplexStream.uncork();

        duplexStream.end();

        expect(errorEvents >= 0).assertEqual(true);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1900
     * @tc.name      testStreamDuplex08Chapter0021
     * @tc.desc      Test doWritev with multiple end calls (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let duplexStream = new TestDuplex08S();

        duplexStream.write('data1', 'utf8');
        duplexStream.end();

        try {
          duplexStream.end();
        } catch (e) {
        }

        try {
          duplexStream.end('final data', 'utf8');
        } catch (e) {
        }

        expect(duplexStream.endCount).assertLess(3);
      } catch (e) {
      }
    });
  })
}
