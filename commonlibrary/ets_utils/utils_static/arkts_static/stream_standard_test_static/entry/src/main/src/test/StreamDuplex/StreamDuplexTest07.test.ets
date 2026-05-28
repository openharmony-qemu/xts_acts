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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { stream } from '@kit.ArkTS';
import Utils from '../Util.test';

function invokeCb(cb: Function): void {
  try { (cb as (error?: Error | null) => void)(); } catch (e) {}
}
function invokeCbErr(cb: Function, err: Error | null): void {
  try { (cb as (e?: Error | null) => void)(err); } catch (e) {}
}

class TestDuplex07_01 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(2);
    expect(typeof chunks[0]).assertEqual('string');
    expect(chunks[0]).assertEqual('data1');
    expect(chunks[1]).assertEqual('data2');
    invokeCb(callback);
  }
}

class TestDuplex07_02 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(2);
    expect(chunks[0] instanceof Uint8Array).assertTrue();
    expect(chunks[1] instanceof Uint8Array).assertTrue();
    let arr1 = chunks[0] as Uint8Array;
    let arr2 = chunks[1] as Uint8Array;
    expect(arr1[0]).assertEqual(72);
    expect(arr1[1]).assertEqual(101);
    invokeCb(callback);
  }
}

class TestDuplex07_03 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(0);
    invokeCb(callback);
  }
}

class TestDuplex07_04 extends stream.Duplex {
  doWritevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.doWritevCalled = true;
    expect(chunks.length).assertLargerOrEqual(1);
    invokeCb(callback);
  }
}

class TestDuplex07_05 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(1);
    expect(chunks[0]).assertEqual('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
    invokeCb(callback);
  }
}

class TestDuplex07_06 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(1);
    let str = chunks[0] as string;
    expect(str.charCodeAt(0)).assertEqual(7);
    expect(str.charCodeAt(1)).assertEqual(8);
    expect(str.charCodeAt(2)).assertEqual(12);
    expect(str.charCodeAt(3)).assertEqual(10);
    expect(str.charCodeAt(4)).assertEqual(13);
    expect(str.charCodeAt(5)).assertEqual(9);
    expect(str.charCodeAt(6)).assertEqual(11);
    invokeCb(callback);
  }
}

class TestDuplex07_07 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(3);
    expect(chunks[0]).assertEqual('\uD83D\uDC46');
    expect(chunks[1]).assertEqual('\uD83D\uDC7F');
    expect(chunks[2]).assertEqual('\uD83D\uDC40');
    invokeCb(callback);
  }
}

class TestDuplex07_08 extends stream.Duplex {
  writeCount: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writeCount += chunks.length;
    invokeCb(callback);
  }
}

class TestDuplex07_09 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(4);
    let arr1 = chunks[0] as Uint8Array;
    let arr2 = chunks[1] as Uint8Array;
    let arr3 = chunks[2] as Uint8Array;
    let arr4 = chunks[3] as Uint8Array;
    expect(arr1[0]).assertEqual(0);
    expect(arr2[0]).assertEqual(255);
    invokeCb(callback);
  }
}

class TestDuplex07_10 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(2);
    let arr1 = chunks[0] as Uint8Array;
    let arr2 = chunks[1] as Uint8Array;
    expect(arr1.length).assertEqual(4);
    expect(arr2.length).assertEqual(4);
    invokeCb(callback);
  }
}

class TestDuplex07_11 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(3);
    invokeCb(callback);
  }
}

class TestDuplex07_12 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(2);
    invokeCb(callback);
  }
}

class TestDuplex07_13 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(2);
    invokeCb(callback);
  }
}

class TestDuplex07_14 extends stream.Duplex {
  clampedValues: number[] = [];
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    expect(chunks.length).assertEqual(4);
    for (let chunk of chunks) {
      if (chunk instanceof Uint8Array) {
        this.clampedValues.push(chunk[0]);
      }
    }
    invokeCb(callback);
  }
}

class TestDuplex07_15 extends stream.Duplex {
  totalBytes: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    for (let chunk of chunks) {
      if (chunk instanceof Uint8Array) {
        this.totalBytes += chunk.length;
      } else {
        this.totalBytes += (chunk as string).length;
      }
    }
    invokeCb(callback);
  }
}

class TestDuplex07_16 extends stream.Duplex {
  zeroCount: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    for (let chunk of chunks) {
      if (chunk instanceof Uint8Array) {
        for (let i = 0; i < chunk.length; i++) {
          if (chunk[i] === 0) {
            this.zeroCount++;
          }
        }
      }
    }
    invokeCb(callback);
  }
}

class TestDuplex07_17 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(3);
    expect(chunks[0]).assertEqual('0');
    expect(chunks[1]).assertEqual('NaN');
    expect(chunks[2]).assertEqual('Infinity');
    invokeCb(callback);
  }
}

class TestDuplex07_18 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(1);
    const asciiStr =
      '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
    expect(chunks[0]).assertEqual(asciiStr);
    invokeCb(callback);
  }
}

class TestDuplex07_19 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(1);
    const escapeStr = '\x00\x07\x08\x0C\x0A\x0D\x09\x0B\\\'\"?';
    expect(chunks[0]).assertEqual(escapeStr);
    invokeCb(callback);
  }
}

class TestDuplex07_20 extends stream.Duplex {
  chunkTypes: string[] = [];
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    for (let chunk of chunks) {
      if (typeof chunk === 'string') {
        this.chunkTypes.push('string');
      } else if (chunk instanceof Uint8Array) {
        this.chunkTypes.push('Uint8Array');
      }
    }
    expect(this.chunkTypes.length).assertEqual(3);
    invokeCb(callback);
  }
}

class TestDuplex07_21 extends stream.Duplex {
  nanCount: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.nanCount = chunks.length;
    invokeCb(callback);
  }
}

class TestDuplex07_22 extends stream.Duplex {
  chunkCount: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.chunkCount += chunks.length;
    invokeCb(callback);
  }
}

class TestDuplex07_23 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(5);
    expect(chunks[0]).assertEqual('\uD83D\uDC46');
    expect(chunks[1]).assertEqual('\uD83D\uDC7F');
    expect(chunks[2]).assertEqual('\uD83D\uDC40');
    expect(chunks[3]).assertEqual('\uD83D\uDCAF');
    expect(chunks[4]).assertEqual('\uD83C\uDF85');
    invokeCb(callback);
  }
}

class TestDuplex07_24 extends stream.Duplex {
  totalLength: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    for (let chunk of chunks) {
      if (chunk instanceof Uint8Array) {
        this.totalLength += chunk.length;
      }
    }
    invokeCb(callback);
  }
}

class TestDuplex07_25 extends stream.Duplex {
  emptyCount: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    for (let chunk of chunks) {
      if (chunk instanceof Uint8Array && chunk.length === 0) {
        this.emptyCount++;
      }
    }
    invokeCb(callback);
  }
}

class TestDuplex07_26 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(1);
    const repeatedStr = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
    expect(chunks[0]).assertEqual(repeatedStr);
    invokeCb(callback);
  }
}

class TestDuplex07_27 extends stream.Duplex {
  totalLength: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.totalLength = 0;
    for (let chunk of chunks) {
      if (chunk instanceof Uint8Array) {
        this.totalLength += chunk.length;
      } else {
        this.totalLength += (chunk as string).length;
      }
    }
    invokeCb(callback);
  }
}

class TestDuplex07_28 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(2);
    expect(chunks[0]).assertEqual('true');
    expect(chunks[1]).assertEqual('false');
    invokeCb(callback);
  }
}

class TestDuplex07_29 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(2);
    expect(chunks[0]).assertEqual('undefined');
    expect(chunks[1]).assertEqual('null');
    invokeCb(callback);
  }
}

class TestDuplex07_30 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(3);
    invokeCb(callback);
  }
}

class TestDuplex07_31 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(5);
    expect(chunks[0]).assertEqual('0x0102');
    expect(chunks[1]).assertEqual('0o377');
    expect(chunks[2]).assertEqual('1e3');
    expect(chunks[3]).assertEqual('2.5e-2');
    expect(chunks[4]).assertEqual('8');
    invokeCb(callback);
  }
}

class TestDuplex07_32 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(2);
    let arr1 = chunks[0] as Uint8Array;
    let arr2 = chunks[1] as Uint8Array;
    expect(arr1.length > 0).assertTrue();
    expect(arr2.length > 0).assertTrue();
    invokeCb(callback);
  }
}

class TestDuplex07_33 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(1);
    let arr = chunks[0] as Uint8Array;
    expect(arr.length).assertEqual(0);
    invokeCb(callback);
  }
}

class TestDuplex07_34 extends stream.Duplex {
  clampedValues: number[] = [];
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    expect(chunks.length).assertEqual(1);
    let arr = chunks[0] as Uint8Array;
    for (let i = 0; i < arr.length; i++) {
      this.clampedValues.push(arr[i]);
    }
    invokeCb(callback);
  }
}

class TestDuplex07_35 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(4);
    invokeCb(callback);
  }
}

class TestDuplex07_36 extends stream.Duplex {
  specialValueCount: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.specialValueCount = chunks.length;
    invokeCb(callback);
  }
}

class TestDuplex07_37 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(6);
    invokeCb(callback);
  }
}

class TestDuplex07_38 extends stream.Duplex {
  charValues: number[] = [];
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    for (let chunk of chunks) {
      if (chunk instanceof Uint8Array) {
        for (let i = 0; i < chunk.length; i++) {
          this.charValues.push(chunk[i]);
        }
      }
    }
    invokeCb(callback);
  }
}

class TestDuplex07_39 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(6);
    expect(chunks[0]).assertEqual('\uD83D\uDCAF');
    expect(chunks[1]).assertEqual('\uD83C\uDF85');
    expect(chunks[2]).assertEqual('\uD83D\uDC3C');
    expect(chunks[3]).assertEqual('\uD83D\uDD27');
    expect(chunks[4]).assertEqual('\uD83D\uDC87');
    expect(chunks[5]).assertEqual('\uD83D\uDEA2');
    invokeCb(callback);
  }
}

class TestDuplex07_40 extends stream.Duplex {
  writevCalled: boolean = false;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.writevCalled = true;
    expect(chunks.length).assertEqual(2);
    let testStr1 = "Line1\nLine2\r\nLine3\tTabbed";
    let testStr2 = "Null\0Bell\x07Backspace\x08";
    expect(chunks[0]).assertEqual(testStr1);
    expect(chunks[1]).assertEqual(testStr2);
    invokeCb(callback);
  }
}

class TestDuplex07_41 extends stream.Duplex {
  receivedChunks: number = 0;
  constructor() {
    super();
  }
  doRead(size: number) {
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
  doWritev(chunks: (string | Uint8Array)[], callback: Function) {
    this.receivedChunks = chunks.length;
    invokeCb(callback);
  }
}

export default function StreamDuplex07Test(): void {
  describe('StreamDuplex07Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_0100
     * @tc.name      testStreamDuplex07Chapter0001
     * @tc.desc      Test doWritev with two string chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_01();
      duplexStream.cork();
      duplexStream.write('data1', 'utf8');
      duplexStream.write('data2', 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_0200
     * @tc.name      testStreamDuplex07Chapter0002
     * @tc.desc      Test doWritev with two Uint8Array chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_02();
      duplexStream.cork();
      duplexStream.write(new Uint8Array([72, 101, 108, 108, 111]), 'utf8');
      duplexStream.write(new Uint8Array([87, 111, 114, 108, 100]), 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_0300
     * @tc.name      testStreamDuplex07Chapter0003
     * @tc.desc      Test doWritev with no data chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_03();
      duplexStream.cork();
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.writevCalled).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_0400
     * @tc.name      testStreamDuplex07Chapter0004
     * @tc.desc      Test doWritev with empty and non-empty chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_04();
      duplexStream.cork();
      duplexStream.write(new Uint8Array(0), 'utf8');
      duplexStream.write(new Uint8Array(0), 'utf8');
      duplexStream.write('non-empty', 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.doWritevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_0500
     * @tc.name      testStreamDuplex07Chapter0005
     * @tc.desc      Test doWritev with special character string
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_05();
      duplexStream.cork();
      duplexStream.write('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~', 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_0600
     * @tc.name      testStreamDuplex07Chapter0006
     * @tc.desc      Test doWritev with control character string
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_06();
      duplexStream.cork();
      let specialStr = String.fromCharCode(7, 8, 12, 10, 13, 9, 11);
      duplexStream.write(specialStr, 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_0700
     * @tc.name      testStreamDuplex07Chapter0007
     * @tc.desc      Test doWritev with emoji string chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_07();
      duplexStream.cork();
      duplexStream.write('\uD83D\uDC46', 'utf8');
      duplexStream.write('\uD83D\uDC7F', 'utf8');
      duplexStream.write('\uD83D\uDC40', 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_0800
     * @tc.name      testStreamDuplex07Chapter0008
     * @tc.desc      Test doWritev with multiple string chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_08();
      duplexStream.cork();
      for (let i = 0; i < 100; i++) {
        duplexStream.write('data' + i, 'utf8');
      }
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.writeCount).assertEqual(100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_0900
     * @tc.name      testStreamDuplex07Chapter0009
     * @tc.desc      Test doWritev with boundary value Uint8Array chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_09();
      duplexStream.cork();
      duplexStream.write(new Uint8Array([0]), 'utf8');
      duplexStream.write(new Uint8Array([255]), 'utf8');
      duplexStream.write(new Uint8Array([128]), 'utf8');
      duplexStream.write(new Uint8Array([127]), 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_1000
     * @tc.name      testStreamDuplex07Chapter0010
     * @tc.desc      Test doWritev with Uint16Array buffer chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_10();
      duplexStream.cork();
      let uint16Arr1 = new Uint16Array([0, 65535]);
      duplexStream.write(new Uint8Array(uint16Arr1.buffer), 'utf8');
      let uint16Arr2 = new Uint16Array([32768, 32767]);
      duplexStream.write(new Uint8Array(uint16Arr2.buffer), 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_1100
     * @tc.name      testStreamDuplex07Chapter0011
     * @tc.desc      Test doWritev with Float32Array special values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_11();
      duplexStream.cork();
      let arr1 = new Float32Array([Infinity]);
      duplexStream.write(new Uint8Array(arr1.buffer), 'utf8');
      let arr2 = new Float32Array([-Infinity]);
      duplexStream.write(new Uint8Array(arr2.buffer), 'utf8');
      let arr3 = new Float32Array([NaN]);
      duplexStream.write(new Uint8Array(arr3.buffer), 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_1200
     * @tc.name      testStreamDuplex07Chapter0012
     * @tc.desc      Test doWritev with Float64Array extreme values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_12();
      duplexStream.cork();
      let float64Arr1 = new Float64Array([-1.7976931348623157e308]);
      duplexStream.write(new Uint8Array(float64Arr1.buffer), 'utf8');
      let float64Arr2 = new Float64Array([1.7976931348623157e308]);
      duplexStream.write(new Uint8Array(float64Arr2.buffer), 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_1300
     * @tc.name      testStreamDuplex07Chapter0013
     * @tc.desc      Test doWritev with Int32Array and Uint32Array boundary values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_13();
      duplexStream.cork();
      let int32Arr = new Int32Array([-2147483648, 2147483647]);
      duplexStream.write(new Uint8Array(int32Arr.buffer), 'utf8');
      let uint32Arr = new Uint32Array([0, 4294967295]);
      duplexStream.write(new Uint8Array(uint32Arr.buffer), 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_1400
     * @tc.name      testStreamDuplex07Chapter0014
     * @tc.desc      Test doWritev with multiple Uint8Array chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_14();
      duplexStream.cork();
      duplexStream.write(new Uint8Array([0]), 'utf8');
      duplexStream.write(new Uint8Array([255]), 'utf8');
      duplexStream.write(new Uint8Array([0]), 'utf8');
      duplexStream.write(new Uint8Array([255]), 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.clampedValues[0]).assertEqual(0);
      expect(duplexStream.clampedValues[1]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_1500
     * @tc.name      testStreamDuplex07Chapter0015
     * @tc.desc      Test doWritev with large Uint8Array chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_15();
      duplexStream.cork();

      let largeArray = new Uint8Array(1024);
      for (let i = 0; i < largeArray.length; i++) {
        largeArray[i] = i % 256;
      }

      duplexStream.write(largeArray, 'utf8');
      duplexStream.write(largeArray, 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.totalBytes).assertEqual(2 * 1024);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_1600
     * @tc.name      testStreamDuplex07Chapter0016
     * @tc.desc      Test doWritev with zero values in Uint8Array chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_16();
      duplexStream.cork();
      duplexStream.write(new Uint8Array([72, 101, 108, 108, 111, 0, 0, 0, 0, 0, 100]), 'utf8');
      duplexStream.write(new Uint8Array([1, 0, 2, 0, 3]), 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.zeroCount).assertEqual(7);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_1700
     * @tc.name      testStreamDuplex07Chapter0017
     * @tc.desc      Test doWritev with number string representations
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_17();
      duplexStream.cork();
      duplexStream.write('0', 'utf8');
      duplexStream.write('NaN', 'utf8');
      duplexStream.write('Infinity', 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_1800
     * @tc.name      testStreamDuplex07Chapter0018
     * @tc.desc      Test doWritev with full ASCII character string
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_18();
      duplexStream.cork();
      const asciiStr =
        '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      duplexStream.write(asciiStr, 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_1900
     * @tc.name      testStreamDuplex07Chapter0019
     * @tc.desc      Test doWritev with escape character string
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_19();
      duplexStream.cork();
      const escapeStr = '\x00\x07\x08\x0C\x0A\x0D\x09\x0B\\\'\"?';
      duplexStream.write(escapeStr, 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_2000
     * @tc.name      testStreamDuplex07Chapter0020
     * @tc.desc      Test doWritev with mixed string and Uint8Array chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_20();
      duplexStream.cork();
      duplexStream.write('string1', 'utf8');
      duplexStream.write(new Uint8Array([1, 2, 3]), 'utf8');
      duplexStream.write('string2', 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.chunkTypes.length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_2100
     * @tc.name      testStreamDuplex07Chapter0021
     * @tc.desc      Test doWritev with Float32Array NaN values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_21();
      duplexStream.cork();
      let float32Arr1 = new Float32Array([NaN]);
      duplexStream.write(new Uint8Array(float32Arr1.buffer), 'utf8');
      let float32Arr2 = new Float32Array([NaN, NaN]);
      duplexStream.write(new Uint8Array(float32Arr2.buffer), 'utf8');
      let float32Arr3 = new Float32Array([1.0, NaN, 2.0]);
      duplexStream.write(new Uint8Array(float32Arr3.buffer), 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.nanCount).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_2200
     * @tc.name      testStreamDuplex07Chapter0022
     * @tc.desc      Test doWritev with 1000 string chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_22();
      duplexStream.cork();
      for (let i = 0; i < 1000; i++) {
        duplexStream.write(`chunk${i}`, 'utf8');
      }
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.chunkCount).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_2300
     * @tc.name      testStreamDuplex07Chapter0023
     * @tc.desc      Test doWritev with Unicode escape sequence strings
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_23();
      duplexStream.cork();
      duplexStream.write('\uD83D\uDC46', 'utf8');
      duplexStream.write('\uD83D\uDC7F', 'utf8');
      duplexStream.write('\uD83D\uDC40', 'utf8');
      duplexStream.write('\uD83D\uDCAF', 'utf8');
      duplexStream.write('\uD83C\uDF85', 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_2400
     * @tc.name      testStreamDuplex07Chapter0024
     * @tc.desc      Test doWritev with pattern Uint8Array chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_24();
      duplexStream.cork();

      let pattern1 = new Uint8Array([0x00, 0xFF, 0x55, 0xAA]);
      let pattern2 = new Uint8Array([0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80]);
      let pattern3 = new Uint8Array([0xDE, 0xAD, 0xBE, 0xEF]);

      duplexStream.write(pattern1, 'utf8');
      duplexStream.write(pattern2, 'utf8');
      duplexStream.write(pattern3, 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.totalLength).assertEqual(16);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_2500
     * @tc.name      testStreamDuplex07Chapter0025
     * @tc.desc      Test doWritev with empty and non-empty Uint8Array chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_25();
      duplexStream.cork();
      duplexStream.write(new Uint8Array(0), 'utf8');
      duplexStream.write(new Uint8Array([1, 2, 3]), 'utf8');
      duplexStream.write(new Uint8Array(0), 'utf8');
      duplexStream.write(new Uint8Array([4, 5]), 'utf8');
      duplexStream.write(new Uint8Array(0), 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.emptyCount).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_2600
     * @tc.name      testStreamDuplex07Chapter0026
     * @tc.desc      Test doWritev with repeated special character string
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_26();
      duplexStream.cork();
      const repeatedStr = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      duplexStream.write(repeatedStr, 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_2700
     * @tc.name      testStreamDuplex07Chapter0027
     * @tc.desc      Test doWritev with Int8Array boundary values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_27();
      duplexStream.cork();
      let int8Arr1 = new Int8Array([-128, 127]);
      duplexStream.write(new Uint8Array(int8Arr1.buffer), 'utf8');
      let int8Arr2 = new Int8Array([-129, 128]);
      duplexStream.write(new Uint8Array(int8Arr2.buffer), 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.totalLength).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_2800
     * @tc.name      testStreamDuplex07Chapter0028
     * @tc.desc      Test doWritev with boolean string representations
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_28();
      duplexStream.cork();
      duplexStream.write('true', 'utf8');
      duplexStream.write('false', 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_2900
     * @tc.name      testStreamDuplex07Chapter0029
     * @tc.desc      Test doWritev with JavaScript type string representations
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_29();
      duplexStream.cork();
      duplexStream.write('undefined', 'utf8');
      duplexStream.write('null', 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_3000
     * @tc.name      testStreamDuplex07Chapter0030
     * @tc.desc      Test doWritev with overflow Uint8Array values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_30();
      duplexStream.cork();

      let overflowArray1 = new Uint8Array([256, 257]);
      let overflowArray2 = new Uint8Array([-1, -2]);
      let overflowArray3 = new Uint8Array([65535, 65536]);

      duplexStream.write(overflowArray1, 'utf8');
      duplexStream.write(overflowArray2, 'utf8');
      duplexStream.write(overflowArray3, 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_3100
     * @tc.name      testStreamDuplex07Chapter0031
     * @tc.desc      Test doWritev with number format string representations
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_31();
      duplexStream.cork();
      duplexStream.write('0x0102', 'utf8');
      duplexStream.write('0o377', 'utf8');
      duplexStream.write('1e3', 'utf8');
      duplexStream.write('2.5e-2', 'utf8');
      duplexStream.write('8', 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_3200
     * @tc.name      testStreamDuplex07Chapter0032
     * @tc.desc      Test doWritev with mixed signed/unsigned array buffers
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_32();
      duplexStream.cork();

      let mixedArray1 = new Int8Array([72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]);
      let mixedArray2 = new Int16Array([1000, -2000, 3000, -4000]);

      duplexStream.write(new Uint8Array(mixedArray1.buffer), 'utf8');
      duplexStream.write(new Uint8Array(mixedArray2.buffer), 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_3300
     * @tc.name      testStreamDuplex07Chapter0033
     * @tc.desc      Test doWritev with empty Uint8Array chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_33();
      duplexStream.cork();
      let emptyArray = new Uint8Array([]);
      duplexStream.write(emptyArray, 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_3400
     * @tc.name      testStreamDuplex07Chapter0034
     * @tc.desc      Test doWritev with Uint8ClampedArray values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_34();
      duplexStream.cork();

      let clampedArray = new Uint8ClampedArray(4);
      clampedArray[0] = -1;
      clampedArray[1] = 0;
      clampedArray[2] = 255;
      clampedArray[3] = 256;

      duplexStream.write(new Uint8Array(clampedArray.buffer), 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.clampedValues[0]).assertEqual(0);
      expect(duplexStream.clampedValues[1]).assertEqual(0);
      expect(duplexStream.clampedValues[2]).assertEqual(255);
      expect(duplexStream.clampedValues[3]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_3500
     * @tc.name      testStreamDuplex07Chapter0035
     * @tc.desc      Test doWritev with Float32Array extreme values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_35();
      duplexStream.cork();

      let float32Arr1 = new Float32Array([-3.4028234663852886e38]);
      let float32Arr2 = new Float32Array([3.4028234663852886e38]);
      let float32Arr3 = new Float32Array([1.2e-38]);
      let float32Arr4 = new Float32Array([-3.5e38]);

      duplexStream.write(new Uint8Array(float32Arr1.buffer), 'utf8');
      duplexStream.write(new Uint8Array(float32Arr2.buffer), 'utf8');
      duplexStream.write(new Uint8Array(float32Arr3.buffer), 'utf8');
      duplexStream.write(new Uint8Array(float32Arr4.buffer), 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_3600
     * @tc.name      testStreamDuplex07Chapter0036
     * @tc.desc      Test doWritev with special Float32Array and typed array values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_36();
      duplexStream.cork();

      let float32Arr = new Float32Array([Infinity, -Infinity, NaN]);
      let int8Arr = new Int8Array([0, 0, 0]);
      let uint8Arr = new Uint8Array([0, 0, 0]);

      duplexStream.write(new Uint8Array(float32Arr.buffer), 'utf8');
      duplexStream.write(new Uint8Array(int8Arr.buffer), 'utf8');
      duplexStream.write(new Uint8Array(uint8Arr.buffer), 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.specialValueCount).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_3700
     * @tc.name      testStreamDuplex07Chapter0037
     * @tc.desc      Test doWritev with Number constants
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_37();
      duplexStream.cork();

      let num1 = new Float64Array([Number.MAX_VALUE]);
      let num2 = new Float64Array([Number.MIN_VALUE]);
      let num3 = new Float64Array([Number.EPSILON]);
      let num4 = new Float64Array([Number.MAX_SAFE_INTEGER]);
      let num5 = new Float64Array([0]);
      let num6 = new Float64Array([-0]);

      duplexStream.write(new Uint8Array(num1.buffer), 'utf8');
      duplexStream.write(new Uint8Array(num2.buffer), 'utf8');
      duplexStream.write(new Uint8Array(num3.buffer), 'utf8');
      duplexStream.write(new Uint8Array(num4.buffer), 'utf8');
      duplexStream.write(new Uint8Array(num5.buffer), 'utf8');
      duplexStream.write(new Uint8Array(num6.buffer), 'utf8');
      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_3800
     * @tc.name      testStreamDuplex07Chapter0038
     * @tc.desc      Test doWritev with Uint16Array character values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_38();
      duplexStream.cork();

      let charArray = new Uint16Array([0, 127, 255, 256, 1000, 10000, 32767, 65535]);

      duplexStream.write(new Uint8Array(charArray.buffer), 'utf8');
      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.charValues.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_3900
     * @tc.name      testStreamDuplex07Chapter0039
     * @tc.desc      Test doWritev with emoji string chunks
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_39();
      duplexStream.cork();

      duplexStream.write('\uD83D\uDCAF', 'utf8');
      duplexStream.write('\uD83C\uDF85', 'utf8');
      duplexStream.write('\uD83D\uDC3C', 'utf8');
      duplexStream.write('\uD83D\uDD27', 'utf8');
      duplexStream.write('\uD83D\uDC87', 'utf8');
      duplexStream.write('\uD83D\uDEA2', 'utf8');

      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_4000
     * @tc.name      testStreamDuplex07Chapter0040
     * @tc.desc      Test doWritev with control character strings
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_40();
      duplexStream.cork();

      let testStr1 = "Line1\nLine2\r\nLine3\tTabbed";
      let testStr2 = "Null\0Bell\x07Backspace\x08";

      duplexStream.write(testStr1, 'utf8');
      duplexStream.write(testStr2, 'utf8');

      duplexStream.uncork();
      duplexStream.end();
      expect(duplexStream.writevCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSEVEN_4100
     * @tc.name      testStreamDuplex07Chapter0041
     * @tc.desc      Test doWritev with edge case values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("testStreamDuplex07Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream = new TestDuplex07_41();
      duplexStream.cork();

      duplexStream.write('a', 'utf8');

      duplexStream.write(new Uint8Array([1]), 'utf8');

      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.receivedChunks > 0).assertTrue();
    });

  })
}
