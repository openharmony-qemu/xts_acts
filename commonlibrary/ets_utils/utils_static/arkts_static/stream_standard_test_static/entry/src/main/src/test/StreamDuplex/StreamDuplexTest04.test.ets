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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import { stream, util } from '@kit.ArkTS';
import Utils from '../Util.test';

function invokeCb(cb: Function): void {
  try { (cb as (error?: Error | null) => void)(); } catch (e) {}
}
function invokeCbErr(cb: Function, err: Error | null): void {
  try { (cb as (e?: Error | null) => void)(err); } catch (e) {}
}

class TestDuplex extends stream.Duplex {
  constructor() {
    super();
  }
  _write(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    invokeCb(callback);
  }
  _read(size: number): void {
    this.push(null);
  }
  doRead(size: number): void {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function): void {
    invokeCb(callback);
  }
}

class TestDataDuplex extends stream.Duplex {
  dataWritten: string = '';
  constructor() {
    super();
  }
  _write(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (typeof chunk !== 'string') {
      this.dataWritten += util.TextDecoder.create('utf-8').decodeToString(chunk as Uint8Array);
    } else {
      this.dataWritten += chunk;
    }
    invokeCb(callback);
  }
  _read(size: number): void {
    this.push(null);
  }
  doRead(size: number): void {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (typeof chunk !== 'string') {
      this.dataWritten += util.TextDecoder.create('utf-8').decodeToString(chunk as Uint8Array);
    } else {
      this.dataWritten += chunk;
    }
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function): void {
    for (let i = 0; i < chunks.length; i++) {
      let chunk = chunks[i];
      if (typeof chunk !== 'string') {
        this.dataWritten += util.TextDecoder.create('utf-8').decodeToString(chunk as Uint8Array);
      } else {
        this.dataWritten += chunk;
      }
    }
    invokeCb(callback);
  }
}

class TestDataArrayDuplex extends stream.Duplex {
  dataWritten: Uint8Array[] = [];
  constructor() {
    super();
  }
  _write(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (chunk instanceof Uint8Array) {
      this.dataWritten.push(chunk);
    } else {
      this.dataWritten.push(new Uint8Array(Array.from(chunk).map(c => c.charCodeAt(0))));
    }
    invokeCb(callback);
  }
  _read(size: number): void {
    this.push(null);
  }
  doRead(size: number): void {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (chunk instanceof Uint8Array) {
      this.dataWritten.push(chunk);
    } else {
      this.dataWritten.push(new Uint8Array(Array.from(chunk).map(c => c.charCodeAt(0))));
    }
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function): void {
    for (let i = 0; i < chunks.length; i++) {
      let chunk = chunks[i];
      if (chunk instanceof Uint8Array) {
        this.dataWritten.push(chunk);
      } else {
        this.dataWritten.push(new Uint8Array(Array.from(chunk).map(c => c.charCodeAt(0))));
      }
    }
    invokeCb(callback);
  }
}

interface TestObj {
  cork: string;
}

interface ClosureResult {
  cork: () => boolean;
  getCallCount: () => number;
  getCorkedValue: () => number;
}

interface DuplexWrapper {
  stream: stream.Duplex;
}

export default function StreamDuplex04Test(): void {
  describe('StreamDuplex04Test', () => {
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
    afterEach(() => {
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_0100
     * @tc.name      testStreamDuplex04Chapter0001
     * @tc.desc      test setDefaultEncoding with string containing only spaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new TestDuplex();
      let spaceStr = '   ';
      try {
        let result = duplexStream.setDefaultEncoding(spaceStr);
        expect(result).assertEqual(false);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_0200
     * @tc.name      testStreamDuplex04Chapter0002
     * @tc.desc      test setDefaultEncoding with string containing tabs and newlines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new TestDuplex();
      let whitespaceStr = '\t\n\r\f\v';
      try {
        let result = duplexStream.setDefaultEncoding(whitespaceStr);
        expect(result).assertEqual(false);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_0300
     * @tc.name      testStreamDuplex04Chapter0003
     * @tc.desc      test setDefaultEncoding with string containing zero-width characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new TestDuplex();
      let zeroWidthStr = '\u200B\u200C\u200D\uFEFF';
      try {
        let result = duplexStream.setDefaultEncoding(zeroWidthStr);
        expect(result).assertEqual(false);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_0400
     * @tc.name      testStreamDuplex04Chapter0004
     * @tc.desc      test setDefaultEncoding with string containing right-to-left characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new TestDuplex();
      let rtlStr = '????????';
      try {
        let result = duplexStream.setDefaultEncoding(rtlStr);
        expect(result).assertEqual(false);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_0500
     * @tc.name      testStreamDuplex04Chapter0005
     * @tc.desc      test setDefaultEncoding with string containing combining characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new TestDuplex();
      let combiningStr = 'c\u0327';
      try {
        let result = duplexStream.setDefaultEncoding(combiningStr);
        expect(result).assertEqual(false);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_0600
     * @tc.name      testStreamDuplex04Chapter0006
     * @tc.desc      test setDefaultEncoding with string containing surrogate pairs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new TestDuplex();
      let surrogateStr = '\uD83D\uDE00';
      try {
        let result = duplexStream.setDefaultEncoding(surrogateStr);
        expect(result).assertEqual(false);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_0700
     * @tc.name      testStreamDuplex04Chapter0007
     * @tc.desc      test setDefaultEncoding with string containing all TypedArray names.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new TestDuplex();
      let typedArrayNames =
        'Int8ArrayUint8ArrayUint8ClampedArrayInt16ArrayUint16ArrayInt32ArrayUint32ArrayFloat32ArrayFloat64ArrayBigInt64ArrayBigUint64Array';
      try {
        let result = duplexStream.setDefaultEncoding(typedArrayNames);
        expect(result).assertEqual(false);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_0800
     * @tc.name      testStreamDuplex04Chapter0008
     * @tc.desc      test setDefaultEncoding with string containing all number type names.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new TestDuplex();
      let numberTypes = 'byteshortintlongfloatdoublecharbigint';
      try {
        let result = duplexStream.setDefaultEncoding(numberTypes);
        expect(result).assertEqual(false);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_0900
     * @tc.name      testStreamDuplex04Chapter0009
     * @tc.desc      test setDefaultEncoding with string containing boolean type names.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new TestDuplex();
      let booleanTypes = 'truefalse';
      try {
        let result = duplexStream.setDefaultEncoding(booleanTypes);
        expect(result).assertEqual(false);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_1000
     * @tc.name      testStreamDuplex04Chapter0010
     * @tc.desc      test setDefaultEncoding with string containing array type names.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new TestDuplex();
      let arrayTypes = 'arraytypedarray';
      try {
        let result = duplexStream.setDefaultEncoding(arrayTypes);
        expect(result).assertEqual(false);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_1100
     * @tc.name      testStreamDuplex04Chapter0011
     * @tc.desc      test setDefaultEncoding with string containing object type names.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new TestDuplex();
      let objectTypes = 'objectmapsetpromisedateregexp';
      try {
        let result = duplexStream.setDefaultEncoding(objectTypes);
        expect(result).assertEqual(false);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_1200
     * @tc.name      testStreamDuplex04Chapter0012
     * @tc.desc      test setDefaultEncoding with string containing delete keyword.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new TestDuplex();
      let deleteStr = 'delete';
      try {
        let result = duplexStream.setDefaultEncoding(deleteStr);
        expect(result).assertEqual(false);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_1300
     * @tc.name      testStreamDuplex04Chapter0013
     * @tc.desc      Test cork method of Duplex stream, normal call should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_1400
     * @tc.name      testStreamDuplex04Chapter0014
     * @tc.desc      Test cork method of Duplex stream, check writableCorked property increment after cork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let initialCorked = duplexStream.writableCorked;
      duplexStream.cork();
      let afterCorked = duplexStream.writableCorked;
      expect(afterCorked).assertEqual(initialCorked + 1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_1500
     * @tc.name      testStreamDuplex04Chapter0015
     * @tc.desc      Test cork method of Duplex stream, multiple consecutive cork calls should increment writableCorked each time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let initialCorked = duplexStream.writableCorked;
      let result1 = duplexStream.cork();
      let result2 = duplexStream.cork();
      let result3 = duplexStream.cork();
      let finalCorked = duplexStream.writableCorked;
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(finalCorked).assertEqual(initialCorked + 3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_1600
     * @tc.name      testStreamDuplex04Chapter0016
     * @tc.desc      Test cork method of Duplex stream, check writableCorked initial value is 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let initialCorked = duplexStream.writableCorked;
      expect(initialCorked).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_1700
     * @tc.name      testStreamDuplex04Chapter0017
     * @tc.desc      Test cork method of Duplex stream, verify cork and uncork pairing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let initialCorked = duplexStream.writableCorked;
      duplexStream.cork();
      duplexStream.cork();
      let afterDoubleCork = duplexStream.writableCorked;
      duplexStream.uncork();
      let afterOneUncork = duplexStream.writableCorked;
      duplexStream.uncork();
      let afterTwoUncork = duplexStream.writableCorked;
      expect(initialCorked).assertEqual(0);
      expect(afterDoubleCork).assertEqual(2);
      expect(afterOneUncork).assertEqual(1);
      expect(afterTwoUncork).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_1800
     * @tc.name      testStreamDuplex04Chapter0018
     * @tc.desc      Test cork method of Duplex stream, call cork after stream is destroyed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let duplexStream = new stream.Duplex();

        let result = duplexStream.cork();
        expect(result).assertEqual(true);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_1900
     * @tc.name      testStreamDuplex04Chapter0019
     * @tc.desc      Test cork method of Duplex stream, call cork after stream is ended
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let duplexStream = new stream.Duplex();
        duplexStream.end();
        let result = duplexStream.cork();
        expect(result).assertEqual(true);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_2000
     * @tc.name      testStreamDuplex04Chapter0020
     * @tc.desc      Test cork method of Duplex stream, multiple cork calls followed by single uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      duplexStream.cork();
      duplexStream.cork();
      duplexStream.cork();
      let afterThreeCork = duplexStream.writableCorked;
      duplexStream.uncork();
      let afterOneUncork = duplexStream.writableCorked;
      expect(afterThreeCork).assertEqual(3);
      expect(afterOneUncork).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_2100
     * @tc.name      testStreamDuplex04Chapter0021
     * @tc.desc      Test cork method of Duplex stream, ensure cork returns boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_2200
     * @tc.name      testStreamDuplex04Chapter0022
     * @tc.desc      Test cork method of Duplex stream, verify writableCorked property exists and is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      expect(typeof duplexStream.writableCorked).assertEqual('int');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_2300
     * @tc.name      testStreamDuplex04Chapter0023
     * @tc.desc      Test cork method of Duplex stream, call on multiple independent Duplex instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream1 = new stream.Duplex();
      let duplexStream2 = new stream.Duplex();
      let duplexStream3 = new stream.Duplex();
      let result1 = duplexStream1.cork();
      duplexStream2.cork();
      duplexStream2.cork();
      let result3 = duplexStream3.cork();
      expect(result1).assertEqual(true);
      expect(duplexStream1.writableCorked).assertEqual(1);
      expect(duplexStream2.writableCorked).assertEqual(2);
      expect(result3).assertEqual(true);
      expect(duplexStream3.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_2400
     * @tc.name      testStreamDuplex04Chapter0024
     * @tc.desc      Test cork method of Duplex stream, call cork with write operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let duplexStream = new TestDuplex();
        duplexStream.cork();
        let writeResult = duplexStream.write('test data');
        expect(writeResult).assertEqual(true);
        expect(duplexStream.writableCorked).assertEqual(1);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_2500
     * @tc.name      testStreamDuplex04Chapter0025
     * @tc.desc      Test cork method of Duplex stream, call after uncork when writableCorked is 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let duplexStream = new stream.Duplex();
        let initialCorked = duplexStream.writableCorked;
        duplexStream.uncork();
        let afterUncork = duplexStream.writableCorked;
        let result = duplexStream.cork();
        let finalCorked = duplexStream.writableCorked;
        expect(initialCorked).assertEqual(0);
        expect(afterUncork).assertEqual(0);
        expect(result).assertEqual(true);
        expect(finalCorked).assertEqual(1);
      } catch (err) {
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_2600
     * @tc.name      testStreamDuplex04Chapter0026
     * @tc.desc      Test cork method of Duplex stream, verify method exists on Duplex instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      expect(typeof duplexStream.cork).assertEqual('function');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_2700
     * @tc.name      testStreamDuplex04Chapter0027
     * @tc.desc      Test cork method of Duplex stream, stress test with many cork calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let initialCorked = duplexStream.writableCorked;
      let callCount = 100;
      let allSuccessful = true;
      for (let i = 0; i < callCount; i++) {
        let result = duplexStream.cork();
        if (!result) {
          allSuccessful = false;
        }
      }
      let finalCorked = duplexStream.writableCorked;
      expect(allSuccessful).assertEqual(true);
      expect(finalCorked).assertEqual(initialCorked + callCount);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_2800
     * @tc.name      testStreamDuplex04Chapter0028
     * @tc.desc      test cork method in async context, should work properly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_2900
     * @tc.name      testStreamDuplex04Chapter0029
     * @tc.desc      test cork method with promise chain, ensure state consistency
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new stream.Duplex();
      let promise = new Promise<void>((resolve: (value: void) => void) => {
        setTimeout(() => {
          let result = duplexStream.cork();
          expect(result).assertEqual(true);
          resolve(undefined as void);
        }, 10);
      });
      await promise;
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_3000
     * @tc.name      testStreamDuplex04Chapter0030
     * @tc.desc      test cork method with setTimeout callback, verify timing behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new stream.Duplex();
      await new Promise<void>((resolve: (value: void) => void) => {
        setTimeout(() => {
          let result = duplexStream.cork();
          expect(result).assertEqual(true);
          expect(duplexStream.writableCorked).assertEqual(1);
          resolve(undefined as void);
        }, 0);
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_3100
     * @tc.name      testStreamDuplex04Chapter0031
     * @tc.desc      test cork method with setInterval, multiple timed calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new stream.Duplex();
      for (let i = 0; i < 5; i++) {
        await new Promise<void>((resolve: (value: void) => void) => {
          setTimeout(() => {
            let result = duplexStream.cork();
            expect(result).assertEqual(true);
            resolve(undefined as void);
          }, 10);
        });
      }
      expect(duplexStream.writableCorked).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_3200
     * @tc.name      testStreamDuplex04Chapter0032
     * @tc.desc      test cork method with requestAnimationFrame (or similar timing function)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new stream.Duplex();
      await new Promise<void>((resolve: (value: void) => void) => {
        setTimeout(() => {
          let result = duplexStream.cork();
          expect(result).assertEqual(true);
          expect(duplexStream.writableCorked).assertEqual(1);
          resolve(undefined as void);
        }, 16);
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_3300
     * @tc.name      testStreamDuplex04Chapter0033
     * @tc.desc      test cork method with immediate callback (setImmediate equivalent)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new stream.Duplex();
      await new Promise<void>((resolve: (value: void) => void) => {
        setTimeout(() => {
          let result = duplexStream.cork();
          expect(result).assertEqual(true);
          expect(duplexStream.writableCorked).assertEqual(1);
          resolve(undefined as void);
        }, 0);
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_3400
     * @tc.name      testStreamDuplex04Chapter0034
     * @tc.desc      test cork method in try-catch block, ensure no exceptions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let exceptionCaught = false;
      try {
        let result = duplexStream.cork();
        expect(result).assertEqual(true);
      } catch (err) {
        exceptionCaught = true;
      }
      expect(exceptionCaught).assertEqual(false);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_3500
     * @tc.name      testStreamDuplex04Chapter0035
     * @tc.desc      test cork method with finally block, ensure cleanup
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let finallyExecuted = false;
      try {
        let result = duplexStream.cork();
        expect(result).assertEqual(true);
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_3600
     * @tc.name      testStreamDuplex04Chapter0036
     * @tc.desc      test cork method after uncork when writableCorked is negative (edge case)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let initialCorked = duplexStream.writableCorked;
      for (let i = 0; i < 3; i++) {
        duplexStream.uncork();
      }
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_3700
     * @tc.name      testStreamDuplex04Chapter0037
     * @tc.desc      test cork method with object that has cork property (should not interfere)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: TestObj = { cork: 'not a function' };
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_3800
     * @tc.name      testStreamDuplex04Chapter0038
     * @tc.desc      test cork method with null stream reference (should fail in creation)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream: stream.Duplex | null = null;
      expect(duplexStream).assertNull();
      expect(duplexStream === null).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_3900
     * @tc.name      testStreamDuplex04Chapter0039
     * @tc.desc      test cork method with undefined stream reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream: stream.Duplex | undefined = undefined;
      expect(duplexStream).assertUndefined();
      expect(duplexStream === undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_4000
     * @tc.name      testStreamDuplex04Chapter0040
     * @tc.desc      test cork method with stream that has writableCorked overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_4100
     * @tc.name      testStreamDuplex04Chapter0041
     * @tc.desc      test cork method with stream that has cork method overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let originalResult = duplexStream.cork();
      expect(originalResult).assertEqual(true);
      duplexStream.cork();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_4200
     * @tc.name      testStreamDuplex04Chapter0042
     * @tc.desc      test cork method with stream created in strict mode context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      'use strict';
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_4300
     * @tc.name      testStreamDuplex04Chapter0043
     * @tc.desc      test cork method in non-strict mode (default mode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_4400
     * @tc.name      testStreamDuplex04Chapter0044
     * @tc.desc      test cork method with stream that has been garbage collected (reference lost)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let createStream = () => {
        let tempStream = new stream.Duplex();
        tempStream.cork();
        return tempStream.writableCorked;
      };
      let corkedValue = createStream();
      expect(corkedValue).assertEqual(1);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_4500
     * @tc.name      testStreamDuplex04Chapter0045
     * @tc.desc      test cork method with stream in closure, testing scope and lifetime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let createClosure = (): ClosureResult => {
        let duplexStream = new stream.Duplex();
        let callCount = 0;
        return {
          cork: () => {
            callCount++;
            return duplexStream.cork();
          },
          getCallCount: () => callCount,
          getCorkedValue: () => duplexStream.writableCorked
        };
      };
      let closure = createClosure();
      let result = closure.cork();
      expect(result).assertEqual(true);
      expect(closure.getCallCount()).assertEqual(1);
      expect(closure.getCorkedValue()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_4600
     * @tc.name      testStreamDuplex04Chapter0046
     * @tc.desc      test cork method with stream in IIFE (Immediately Invoked Function Expression)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result = (() => {
        let duplexStream = new stream.Duplex();
        return duplexStream.cork();
      })();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_4700
     * @tc.name      testStreamDuplex04Chapter0047
     * @tc.desc      test cork method with stream created in eval context (if supported)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_4800
     * @tc.name      testStreamDuplex04Chapter0048
     * @tc.desc      test cork method with stream created using Function constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_4900
     * @tc.name      testStreamDuplex04Chapter0049
     * @tc.desc      test cork method with stream in different execution context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let withResult = (() => {
        let obj: DuplexWrapper = { stream: duplexStream };
        return obj.stream.cork();
      })();
      expect(withResult).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_5000
     * @tc.name      testStreamDuplex04Chapter0050
     * @tc.desc      test cork method with stream prototype chain manipulation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_5100
     * @tc.name      testStreamDuplex04Chapter0051
     * @tc.desc      test cork method with stream that has been Object.freeze applied
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_5200
     * @tc.name      testStreamDuplex04Chapter0052
     * @tc.desc      test cork method with stream that has been Object.seal applied
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_5300
     * @tc.name      testStreamDuplex04Chapter0053
     * @tc.desc      test cork method with stream that has been Object.preventExtensions applied
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_5400
     * @tc.name      testStreamDuplex04Chapter0054
     * @tc.desc      test cork method with stream that has been proxied
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_5500
     * @tc.name      testStreamDuplex04Chapter0055
     * @tc.desc      test cork method with stream in worker-like context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let duplexStream = new stream.Duplex();
      let promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        promises.push(new Promise<void>((resolve: (value: void) => void) => {
          setTimeout(() => {
            let result = duplexStream.cork();
            expect(result).assertEqual(true);
            resolve(undefined as void);
          }, 10);
        }));
      }
      await Promise.all(promises);
      expect(duplexStream.writableCorked).assertEqual(10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_5600
     * @tc.name      testStreamDuplex04Chapter0056
     * @tc.desc      test cork method with stream in recursion depth test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      for (let i = 0; i < 50; i++) {
        let result = duplexStream.cork();
        expect(result).assertEqual(true);
      }
      expect(duplexStream.writableCorked).assertEqual(50);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_5700
     * @tc.name      testStreamDuplex04Chapter0057
     * @tc.desc      test cork method with stream in memory pressure test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let streams: stream.Duplex[] = [];
      const STREAM_COUNT = 10;
      for (let i = 0; i < STREAM_COUNT; i++) {
        let duplexStream = new stream.Duplex();
        let result = duplexStream.cork();
        expect(result).assertEqual(true);
        streams.push(duplexStream);
      }
      for (let stream of streams) {
        expect(stream.writableCorked).assertEqual(1);
      }
      streams.length = 0;
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_5800
     * @tc.name      testStreamDuplex04Chapter0058
     * @tc.desc      test cork method with stream and JSON.stringify interaction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let jsonStr = JSON.stringify(duplexStream);
      expect(typeof jsonStr).assertEqual('string');
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_5900
     * @tc.name      testStreamDuplex04Chapter0059
     * @tc.desc      test cork method with stream and console.log interaction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      console.log('Before cork:', duplexStream.writableCorked);
      let result = duplexStream.cork();
      expect(result).assertEqual(true);
      console.log('After cork:', duplexStream.writableCorked);
      expect(duplexStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_6000
     * @tc.name      testStreamDuplex04Chapter0060
     * @tc.desc      test cork method with stream and performance timing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let startTime = Date.now();
      for (let i = 0; i < 1000; i++) {
        duplexStream.cork();
      }
      let endTime = Date.now();
      let duration = endTime - startTime;
      expect(duplexStream.writableCorked).assertEqual(1000);
      console.log(`1000 cork calls took ${duration}ms`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_6100
     * @tc.name      testStreamDuplex04Chapter0061
     * @tc.desc      test cork method with stream in module import/export context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let exportedStream = duplexStream;
      let importedStream = exportedStream;
      let result = importedStream.cork();
      expect(result).assertEqual(true);
      expect(importedStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_6200
     * @tc.name      testStreamDuplex04Chapter0062
     * @tc.desc      test cork method with stream in event loop different phases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let result1 = duplexStream.cork();
      let result2 = duplexStream.cork();
      let result3 = duplexStream.cork();
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_6300
     * @tc.name      testStreamDuplex04Chapter0063
     * @tc.desc      Test uncork method of Duplex stream, normal call after cork should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let result = duplexStream.uncork();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_6400
     * @tc.name      testStreamDuplex04Chapter0064
     * @tc.desc      Test uncork method of Duplex stream, check writableCorked property decrement after uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      duplexStream.cork();
      let afterCork = duplexStream.writableCorked;
      let result = duplexStream.uncork();
      let afterUncork = duplexStream.writableCorked;
      expect(result).assertEqual(true);
      expect(afterCork).assertEqual(1);
      expect(afterUncork).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_6500
     * @tc.name      testStreamDuplex04Chapter0065
     * @tc.desc      Test uncork method of Duplex stream, flush buffered data after uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDataDuplex();
      duplexStream.cork();
      duplexStream.write('a');
      duplexStream.write('b');
      duplexStream.uncork();
      expect(duplexStream.dataWritten).assertEqual('ab');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_6600
     * @tc.name      testStreamDuplex04Chapter0066
     * @tc.desc      Test uncork method of Duplex stream, multiple cork calls followed by single uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      duplexStream.cork();
      duplexStream.cork();
      duplexStream.cork();
      let afterThreeCork = duplexStream.writableCorked;
      let result = duplexStream.uncork();
      let afterOneUncork = duplexStream.writableCorked;
      expect(afterThreeCork).assertEqual(3);
      expect(result).assertEqual(true);
      expect(afterOneUncork).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_6700
     * @tc.name      testStreamDuplex04Chapter0067
     * @tc.desc      Test uncork method of Duplex stream, multiple cork calls followed by multiple uncork calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDataDuplex();
      duplexStream.cork();
      duplexStream.cork();
      duplexStream.write('first');
      let result1 = duplexStream.uncork();
      duplexStream.write('second');
      let result2 = duplexStream.uncork();
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(duplexStream.dataWritten).assertEqual('firstsecond');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_6800
     * @tc.name      testStreamDuplex04Chapter0068
     * @tc.desc      Test uncork method of Duplex stream, call uncork without cork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let duplexStream = new stream.Duplex();
        let result = duplexStream.uncork();
        expect(result).assertEqual(true);
        expect(duplexStream.writableCorked).assertEqual(0);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_6900
     * @tc.name      testStreamDuplex04Chapter0069
     * @tc.desc      Test uncork method of Duplex stream, call uncork after stream is destroyed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let duplexStream = new stream.Duplex();
        let result = duplexStream.uncork();
        expect(result).assertEqual(true);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_7000
     * @tc.name      testStreamDuplex04Chapter0070
     * @tc.desc      Test uncork method of Duplex stream, call uncork after stream is ended
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let duplexStream = new stream.Duplex();
        duplexStream.end();
        let result = duplexStream.uncork();
        expect(result).assertEqual(true);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_7100
     * @tc.name      testStreamDuplex04Chapter0071
     * @tc.desc      Test uncork method of Duplex stream, more uncork calls than cork calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let duplexStream = new stream.Duplex();
        duplexStream.cork();
        let result1 = duplexStream.uncork();
        let result2 = duplexStream.uncork();
        let result3 = duplexStream.uncork();
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(true);
        expect(result3).assertEqual(true);
        expect(duplexStream.writableCorked).assertEqual(0);
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_7200
     * @tc.name      testStreamDuplex04Chapter0072
     * @tc.desc      Test uncork method of Duplex stream, flush Uint8Array data after uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDataArrayDuplex();
      duplexStream.cork();
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      duplexStream.write(uint8Array);
      duplexStream.uncork();
      expect(duplexStream.dataWritten.length).assertEqual(1);
      expect(duplexStream.dataWritten[0][0]).assertEqual(72);
      expect(duplexStream.dataWritten[0][1]).assertEqual(101);
      expect(duplexStream.dataWritten[0][2]).assertEqual(108);
      expect(duplexStream.dataWritten[0][3]).assertEqual(108);
      expect(duplexStream.dataWritten[0][4]).assertEqual(111);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_7300
     * @tc.name      testStreamDuplex04Chapter0073
     * @tc.desc      Test uncork method of Duplex stream, ensure uncork returns boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      duplexStream.cork();
      let result = duplexStream.uncork();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_7400
     * @tc.name      testStreamDuplex04Chapter0074
     * @tc.desc      Test uncork method of Duplex stream, data not flushed until writableCorked reaches 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDataDuplex();
      duplexStream.cork();
      duplexStream.cork();
      duplexStream.write('data1');
      duplexStream.uncork();
      expect(duplexStream.dataWritten).assertEqual('');
      duplexStream.write('data2');
      duplexStream.uncork();
      expect(duplexStream.dataWritten).assertEqual('data1data2');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_7500
     * @tc.name      testStreamDuplex04Chapter0075
     * @tc.desc      Test uncork method of Duplex stream, verify method exists on Duplex instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      expect(typeof duplexStream.uncork).assertEqual('function');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_7600
     * @tc.name      testStreamDuplex04Chapter0076
     * @tc.desc      Test uncork method of Duplex stream, stress test with many cork and uncork calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDataDuplex();
      let callCount = 100;
      let allSuccessful = true;
      for (let i = 0; i < callCount; i++) {
        duplexStream.cork();
      }
      duplexStream.write('test');
      for (let i = 0; i < callCount; i++) {
        let result = duplexStream.uncork();
        if (!result) {
          allSuccessful = false;
        }
      }
      expect(allSuccessful).assertEqual(true);
      expect(duplexStream.dataWritten).assertEqual('test');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFOUR_7700
     * @tc.name      testStreamDuplex04Chapter0077
     * @tc.desc      Test uncork method of Duplex stream, write empty string and uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex04Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new TestDataDuplex();
      duplexStream.cork();
      duplexStream.write('test');
      duplexStream.uncork();
      expect(duplexStream.dataWritten).assertEqual('test');
    });
  })
}