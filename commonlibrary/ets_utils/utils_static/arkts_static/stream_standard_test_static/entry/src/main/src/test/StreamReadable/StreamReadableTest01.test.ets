'use static';
﻿/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { stream, util, buffer } from '@kit.ArkTS';
import Utils from '../Util.test';

function createReadable(): stream.Readable {
  return new stream.Readable();
}

class TestReadable0023 extends stream.Readable {
  readCalled: boolean = false;

  doRead(size: int): void {
    if (!this.readCalled) {
      this.push('test data');
      this.readCalled = true;
    }
  }
}

class TestReadable0024 extends stream.Readable {
  readCalled: boolean = false;

  doRead(size: int): void {
    if (!this.readCalled) {
      this.push('test data');
      this.readCalled = true;
    }
  }
}

class TestReadable0025 extends stream.Readable {
  readCalled: boolean = false;

  doRead(size: int): void {
    if (!this.readCalled) {
      this.push('test data');
      this.readCalled = true;
    }
  }
}

class TestReadable0026 extends stream.Readable {
  readCalled: boolean = false;

  doRead(size: int): void {
    if (!this.readCalled) {
      this.push('test data');
      this.readCalled = true;
    }
  }
}

class TestReadable0027 extends stream.Readable {
  readCalled: boolean = false;

  doRead(size: int): void {
    if (!this.readCalled) {
      this.push('test data');
      this.readCalled = true;
    }
  }
}

class TestReadable0028 extends stream.Readable {
  constructor() {
    super();
    this.push('test data');
  }

  doRead(size: int): void {
  }
}

class TestReadable0029 extends stream.Readable {
  constructor() {
    super();
    this.push('test data');
  }

  doRead(size: int): void {
  }
}

class TestReadable0030 extends stream.Readable {
  constructor() {
    super();
    this.push('test data');
  }

  doRead(size: int): void {
  }
}

class TestReadable0031 extends stream.Readable {
  constructor() {
    super();
    this.push('test data');
  }

  doRead(size: int): void {
  }
}

class TestReadable0032 extends stream.Readable {
  constructor() {
    super();
    this.push('test data');
  }

  doRead(size: int): void {
  }
}

class TestReadable0033 extends stream.Readable {
  readCalled: boolean = false;

  doRead(size: int): void {
    if (!this.readCalled) {
      this.push('test data');
      this.readCalled = true;
    }
  }
}

class TestReadable0034 extends stream.Readable {
  readCalled: boolean = false;

  doRead(size: int): void {
    if (!this.readCalled) {
      this.push('test data');
      this.readCalled = true;
    }
  }
}

class TestReadable0035 extends stream.Readable {
  constructor() {
    super();
    this.push('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
  }

  doRead(size: int): void {
  }
}

class TestReadable0036 extends stream.Readable {
  doRead(size: int): void {
    this.push(undefined);
  }
}

class TestReadable0037 extends stream.Readable {
  doRead(size: int): void {
    this.push(null);
  }
}

class TestReadable0038 extends stream.Readable {
  constructor() {
    super();
    this.push('👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴');
  }

  doRead(size: int): void {
  }
}

class TestReadable0039 extends stream.Readable {
  pushCount: number = 0;

  doRead(size: int): void {
    if (this.pushCount === 0) {
      this.push('\n\t\r\b\f\\\'\"\\0');
      this.pushCount++;
    }
  }
}

class TestReadable0040 extends stream.Readable {
  pushCount: number = 0;

  doRead(size: int): void {
    if (this.pushCount === 0) {
      this.push('test data');
      this.pushCount++;
    }
  }
}

class TestReadable0041 extends stream.Readable {
  pushCount: number = 0;

  doRead(size: int): void {
    if (this.pushCount === 0) {
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      this.push(uint8Array);
      this.pushCount++;
    }
  }
}

class TestReadable0042 extends stream.Readable {
  pushCount: number = 0;

  doRead(size: int): void {
    if (this.pushCount === 0) {
      let largeString = 'a'.repeat(100);
      this.push(largeString);
      this.pushCount++;
    }
  }
}

class TestReadable0043 extends stream.Readable {
  readCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: int): void {
    if (!this.readCalled) {
      this.push('test data');
      this.readCalled = true;
    }
  }
}

class TestReadable0044 extends stream.Readable {
  doRead(size: int): void {
    this.push('test data');
  }
}

class TestReadable0045 extends stream.Readable {
  constructor() {
    super();
  }
  doRead(size: int): void {
    this.push('test data');
    this.push(null);
  }
}

class TestReadable0046 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
    this.push('flowing data');
    this.push(null);
  }
}

class TestReadable0047 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
    this.push('test');
    this.push(null);
  }
}

class TestReadable0048 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
    this.push('test');
    this.push(null);
  }
}

class TestReadable0049 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
    this.push(null);
  }
}

class TestReadable0050 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
    this.push('test');
    this.push(null);
  }
}

class TestReadable0051 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {

  }
}

class TestReadable0052 extends stream.Readable {
  data: int[] = [1, 2, 3];
  index: int = 0;

  constructor() {
    super();
  }

  doRead(size: int): void {
    if (this.index < this.data.length) {
      let chunk = new Uint8Array([this.data[this.index++]]);
      this.push(chunk);
    } else {
      this.push(null);
    }
  }
}

export default function StreamReadable01Test(): void {
  describe('StreamReadable01Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(async (): Promise<void> => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await Utils.msSleep(10)
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_0100
     * @tc.name      testStreamReadable01Chapter0001
     * @tc.desc      Test creating Readable instance normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const readableStream: stream.Readable = new stream.Readable();
      expect(readableStream != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_0200
     * @tc.name      testStreamReadable01Chapter0002
     * @tc.desc      Test creating Readable instance normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const readableStream: stream.Readable = new stream.Readable();
      expect(readableStream != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_0300
     * @tc.name      testStreamReadable01Chapter0003
     * @tc.desc      Test creating multiple Readable instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const readableStream1: stream.Readable = new stream.Readable();
      const readableStream2: stream.Readable = new stream.Readable();
      const readableStream3: stream.Readable = new stream.Readable();

      expect(readableStream1 != null).assertTrue();
      expect(readableStream2 != null).assertTrue();
      expect(readableStream3 != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_0400
     * @tc.name      testStreamReadable01Chapter0004
     * @tc.desc      Test creating Readable instance and check instance type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const readableStream: stream.Readable = new stream.Readable();
      expect(typeof readableStream).assertEqual('object');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_0500
     * @tc.name      testStreamReadable01Chapter0005
     * @tc.desc      Test creating Readable instance in different scopes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      {
        const readableStream1: stream.Readable = new stream.Readable();
        expect(readableStream1 != null).assertTrue();
      }

      const readableStream2: stream.Readable = createReadable();
      expect(readableStream2 != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_0600
     * @tc.name      testStreamReadable01Chapter0006
     * @tc.desc      Create Readable instance with valid encoding option
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readableStream = new stream.Readable();
      expect(readableStream != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_0700
     * @tc.name      testStreamReadable01Chapter0007
     * @tc.desc      Create Readable instance with ascii encoding option
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let errCaught = false;
      try {
        const readableStream = new stream.Readable();
        expect(readableStream != null).assertTrue();
      } catch (err) {
        errCaught = true;
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_0800
     * @tc.name      testStreamReadable01Chapter0008
     * @tc.desc      Create Readable instance with utf-16le encoding option
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readableStream = new stream.Readable();
      expect(readableStream != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_0900
     * @tc.name      testStreamReadable01Chapter0009
     * @tc.desc      Create Readable instance with base64 encoding option
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let errCaught = false;
      try {
        const readableStream = new stream.Readable();
        expect(readableStream != null).assertTrue();
      } catch (err) {
        errCaught = true;
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_1000
     * @tc.name      testStreamReadable01Chapter0010
     * @tc.desc      Create Readable instance with hex encoding option
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let errCaught = false;
      try {
        const readableStream = new stream.Readable();
        expect(readableStream != null).assertTrue();
      } catch (err) {
        errCaught = true;
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_1100
     * @tc.name      testStreamReadable01Chapter0011
     * @tc.desc      Create Readable instance with empty ReadableOptions object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readableStream = new stream.Readable();
      expect(readableStream != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_1200
     * @tc.name      testStreamReadable01Chapter0012
     * @tc.desc      Create Readable instance with encoding option as null (should use default)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readableStream = new stream.Readable();
        expect(readableStream != null).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_1300
     * @tc.name      testStreamReadable01Chapter0013
     * @tc.desc      Create Readable instance with undefined encoding option (should use default)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readableStream = new stream.Readable();
      expect(readableStream != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_1400
     * @tc.name      testStreamReadable01Chapter0014
     * @tc.desc      Test Readable constructor with no parameters (mandatory parameter missing)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readableStream = new stream.Readable();
        expect(readableStream != null).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_1500
     * @tc.name      testStreamReadable01Chapter0015
     * @tc.desc      Test Readable constructor with null parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readableStream = new stream.Readable();
        expect(readableStream != null).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_1600
     * @tc.name      testStreamReadable01Chapter0016
     * @tc.desc      Test Readable constructor with undefined parameter (should use default)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readableStream = new stream.Readable();
        expect(readableStream != null).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_1700
     * @tc.name      testStreamReadable01Chapter0017
     * @tc.desc      Test Readable constructor with valid options
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readableStream = new stream.Readable();
        expect(readableStream != null).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_1800
     * @tc.name      testStreamReadable01Chapter0018
     * @tc.desc      Test Readable constructor with valid encoding options
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readableStream = new stream.Readable();
        expect(readableStream != null).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_1900
     * @tc.name      testStreamReadable01Chapter0019
     * @tc.desc      Test Readable constructor with various highWaterMark values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues = [0, 1, 1024, 16384, 65536, 1024 * 1024];

      for (const value of testValues) {
        try {
        const readableStream = new stream.Readable();
        expect(readableStream instanceof stream.Readable).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
        }
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_2000
     * @tc.name      testStreamReadable01Chapter0020
     * @tc.desc      Test Readable constructor with empty options object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readableStream = new stream.Readable();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_2100
     * @tc.name      testStreamReadable01Chapter0021
     * @tc.desc      Test Readable constructor with valid encoding value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readableStream = new stream.Readable();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_2200
     * @tc.name      testStreamReadable01Chapter0022
     * @tc.desc      Test Readable constructor with unsupported encoding value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const readableStream = new stream.Readable();
        expect(readableStream instanceof stream.Readable).assertTrue();
        expect(typeof readableStream.read).assertEqual('function');
        expect(typeof readableStream.pipe).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_2300
     * @tc.name      testStreamReadable01Chapter0023
     * @tc.desc      Test read method without parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0023();
      let dataChunk = readableStream.read();
      expect(dataChunk instanceof buffer.Buffer).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_2400
     * @tc.name      testStreamReadable01Chapter0024
     * @tc.desc      Test read method with zero size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0024();
      let dataChunk = readableStream.read(0);
      expect(dataChunk).assertNull();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_2500
     * @tc.name      testStreamReadable01Chapter0025
     * @tc.desc      Test read method with positive integer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0025();
      let dataChunk = readableStream.read(4);
      expect(dataChunk instanceof buffer.Buffer).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_2600
     * @tc.name      testStreamReadable01Chapter0026
     * @tc.desc      Test read method with negative size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let readableStream = new TestReadable0026();
        let dataChunk = readableStream.read(-1);
        expect(dataChunk === null || dataChunk === undefined).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_2700
     * @tc.name      testStreamReadable01Chapter0027
     * @tc.desc      Test read method with NaN size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let readableStream = new TestReadable0027();
        let dataChunk = readableStream.read();
        expect(dataChunk === null || dataChunk === undefined).assertEqual(false);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_2800
     * @tc.name      testStreamReadable01Chapter0028
     * @tc.desc      Test read method with Infinity size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let readableStream = new TestReadable0028();
        let dataChunk = readableStream.read(65535);
        expect(dataChunk === null || dataChunk === undefined).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_2900
     * @tc.name      testStreamReadable01Chapter0029
     * @tc.desc      Test read method with -Infinity size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let readableStream = new TestReadable0029();
        let dataChunk = readableStream.read(-1);
        expect(dataChunk === null || dataChunk === undefined).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_3000
     * @tc.name      testStreamReadable01Chapter0030
     * @tc.desc      Test read method with float size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0030();
      let dataChunk = readableStream.read(3);
      expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_3100
     * @tc.name      testStreamReadable01Chapter0031
     * @tc.desc      Test read method with maximum safe integer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0031();
      let dataChunk = readableStream.read(65535);
      expect(dataChunk === null || dataChunk === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_3200
     * @tc.name      testStreamReadable01Chapter0032
     * @tc.desc      Test read method with maximum value size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let readableStream = new TestReadable0032();
        let dataChunk = readableStream.read(65535);
        expect(dataChunk === null || dataChunk === undefined).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_3300
     * @tc.name      testStreamReadable01Chapter0033
     * @tc.desc      Test read method with epsilon size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0033();
      let dataChunk = readableStream.read(0);
      expect(dataChunk === null || dataChunk === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_3400
     * @tc.name      testStreamReadable01Chapter0034
     * @tc.desc      Test read method with -0 size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0034();
      let dataChunk = readableStream.read(0);
      expect(dataChunk).assertNull();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_3500
     * @tc.name      testStreamReadable01Chapter0035
     * @tc.desc      Test read method with string data containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let readableStream = new TestReadable0035();
      let dataChunk = readableStream.read();
      expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_3600
     * @tc.name      testStreamReadable01Chapter0036
     * @tc.desc      Test read method with undefined data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let readableStream = new TestReadable0036();
      readableStream.push(undefined);
      let dataChunk = readableStream.read();
      expect(dataChunk).assertNull();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_3700
     * @tc.name      testStreamReadable01Chapter0037
     * @tc.desc      Test read method with null data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let readableStream = new TestReadable0037();
      readableStream.push(null);
      let dataChunk = readableStream.read();
      expect(dataChunk).assertNull();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_3800
     * @tc.name      testStreamReadable01Chapter0038
     * @tc.desc      Test read method with emoji string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0038();
      readableStream.push('👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴');
      let dataChunk = readableStream.read();
      expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_3900
     * @tc.name      testStreamReadable01Chapter0039
     * @tc.desc      Test read method with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0039();
      let dataChunk = readableStream.read();
      expect(dataChunk instanceof buffer.Buffer).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_4000
     * @tc.name      testStreamReadable01Chapter0040
     * @tc.desc      Test read method with array size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let readableStream = new TestReadable0040();
        readableStream.push('test data');
        let dataChunk = readableStream.read(0);
        expect(dataChunk).assertNull();
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_4100
     * @tc.name      testStreamReadable01Chapter0041
     * @tc.desc      Test read method with typed array push
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0041();
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      readableStream.push(uint8Array);
      let dataChunk = readableStream.read();
      expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_4200
     * @tc.name      testStreamReadable01Chapter0042
     * @tc.desc      Test read method with large string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0042();
      let largeString = 'a'.repeat(100);
      readableStream.push(largeString);
      let dataChunk = readableStream.read(10);
      expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_4300
     * @tc.name      testStreamReadable01Chapter0043
     * @tc.desc      Test read method with multiple pushes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream: stream.Readable = new TestReadable0043();
      readableStream.push('test data');
      let dataChunk = readableStream.read();
      expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_4400
     * @tc.name      testStreamReadable01Chapter0044
     * @tc.desc      Test read method with pause and resume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0044();
      readableStream.push('test data');
      readableStream.pause();
      let dataChunk = readableStream.read();
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_4500
     * @tc.name      testStreamReadable01Chapter0045
     * @tc.desc      resume switches stream from paused to flowing mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0045();
      let returnedStream = readableStream.resume();
      expect(returnedStream).assertEqual(readableStream);
      expect(readableStream.isPaused()).assertFalse();
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_4600
     * @tc.name      testStreamReadable01Chapter0046
     * @tc.desc      resume on already flowing stream does not change state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let readableStream = new TestReadable0046();
      let returnedStream = readableStream.resume();
      expect(returnedStream).assertEqual(readableStream);
      expect(readableStream.isPaused()).assertFalse();
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_4700
     * @tc.name      testStreamReadable01Chapter0047
     * @tc.desc      resume can be called multiple times safely
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let readableStream = new TestReadable0047();

      let stream1 = readableStream.resume();
      let stream2 = readableStream.resume();
      let stream3 = readableStream.resume();

      expect(stream1).assertEqual(readableStream);
      expect(stream2).assertEqual(readableStream);
      expect(stream3).assertEqual(readableStream);
      expect(readableStream.isPaused()).assertFalse();
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_4800
     * @tc.name      testStreamReadable01Chapter0048
     * @tc.desc      resume can switch back to flowing mode after pause
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let readableStream = new TestReadable0048();
      readableStream.resume();
      expect(readableStream.isPaused()).assertFalse();

      readableStream.pause();
      expect(readableStream.isPaused()).assertTrue();

      let returnedStream = readableStream.resume();
      expect(returnedStream).assertEqual(readableStream);
      expect(readableStream.isPaused()).assertFalse();
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_4900
     * @tc.name      testStreamReadable01Chapter0049
     * @tc.desc      resume works on empty stream with no data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0049();
      let returnedStream = readableStream.resume();
      expect(returnedStream).assertEqual(readableStream);
      expect(readableStream.isPaused()).assertFalse();
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_5000
     * @tc.name      testStreamReadable01Chapter0050
     * @tc.desc      resume returns Readable type instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0050();
      let result = readableStream.resume();
      expect(result).assertEqual(readableStream);
      expect(readableStream.isPaused()).assertFalse();
      readableStream.on('end', () => {
      });

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_5100
     * @tc.name      testStreamReadable01Chapter0051
     * @tc.desc      Test pause after stream creation, isPaused should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let readableStream = new TestReadable0051();
      let result = readableStream.pause();

      expect(readableStream.isPaused()).assertTrue();
      expect(result).assertEqual(readableStream);

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTONE_5200
     * @tc.name      testStreamReadable01Chapter0052
     * @tc.desc      Test multiple pause calls, should remain paused
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0052();
      readableStream.pause();
      readableStream.pause();
      readableStream.pause();
      expect(readableStream.isPaused()).assertTrue();

    })

  })
}
