/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { buffer } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function bufferTest() {
  describe("ActsBufferTest", () => {
    /**
     * @tc.name   testBufferAlloc0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1010
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0001';
      try {
        let buf1 = buffer.alloc(0);
        expect(buf1.length).assertEqual(0);
        expect(buf1.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAlloc0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1020
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0002';
      try {
        let buf2 = buffer.alloc(3, 'a');
        expect(buf2.length).assertEqual(3);
        expect(buf2.toString()).assertEqual('aaa');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferAlloc0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1030
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0003';
      try {
        let buf3 = buffer.alloc(5, buffer.from('hello'));
        const result = buf3.toString();
        console.log(`${TAG}result${result}`);
        expect(buf3.toString()).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferAlloc0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1040
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0004';
      try {
        let buf4 = buffer.alloc(0, 0);
        const result = buf4.toString();
        console.log(`${TAG}result${result}`);
        expect(buf4.length).assertEqual(0);
        expect(buf4.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferAlloc0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1050
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0005';
      try {
        let buf5 = buffer.alloc(0, -1);
        expect(buf5.length).assertEqual(0);
        expect(buf5.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferAlloc0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1060
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0006';
      try {
        let buf6 = buffer.alloc(0, Infinity);
        expect(buf6.length).assertEqual(0);
        expect(buf6.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferAlloc0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1070
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0007';
      try {
        let buf7 = buffer.alloc(0, -Infinity);
        expect(buf7.length).assertEqual(0);
        expect(buf7.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAlloc0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1080
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0008';
      try {
        let buf8 = buffer.alloc(3, 1);
        expect(buf8.length).assertEqual(3);
        for (let i = 0; i < buf8.length; i++) {
          expect(buf8[i]).assertEqual(1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAlloc0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1090
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0009';
      try {
        let buf9 = buffer.alloc(3, '');
        expect(buf9.length).assertEqual(3);
        for (let i = 0; i < buf9.length; i++) {
          expect(buf9[i]).assertEqual(0);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAlloc0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1100
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0010';
      try {
        let buf10 = buffer.alloc(3, undefined);
        expect(buf10.length).assertEqual(3);
        for (let i = 0; i < buf10.length; i++) {
          expect(buf10[i]).assertEqual(0);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAlloc0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1110
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0011';
      try {
        let buf11 = buffer.alloc(11, 'aGVsbG8gd29ybGQ=', 'base64');
        console.log(`${TAG} buf11:${buf11.toString()}`);
        expect(buf11.length).assertEqual(11);
        expect(buf11.toString()).assertEqual('hello world');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAlloc0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1120
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0012';
      try {
        let buf12 = buffer.alloc(3, 'hello', 'utf8');
        expect(buf12.length).assertEqual(3);
        expect(buf12.toString()).assertEqual('hel');
        expect(buf12.toString('base64')).assertEqual('aGVs');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAlloc0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1130
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0013';
      try {
        let buf = buffer.alloc(0, 0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAlloc0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1140
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0014';
      try {
        let buf = buffer.alloc(0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 'base64');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAlloc0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1150
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0015';
      try {
        let buf = buffer.alloc(0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 'utf-8');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAlloc0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1160
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0016';
      try {
        let buf = buffer.alloc(0, -1, 'base64');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAlloc0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1170
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0017';
      try {
        let buf = buffer.alloc(0, -1, 'utf-8');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAlloc0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1180
     * @tc.desc   Test the function of the interface Alloc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAlloc0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferAlloc0018';
      try {
        let buf = buffer.alloc(0, -1, 'base64');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1190
     * @tc.desc   Test the function of the interface ByteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferByteLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferByteLength0001';
      try {
        let str = '\u00bd + \u00bc = \u00be'
        const res = buffer.byteLength(str);
        expect(res).assertEqual(12);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1200
     * @tc.desc   Test the function of the interface ByteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferByteLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferByteLength0002';
      try {
        let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        const res = buffer.byteLength(buf);
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1210
     * @tc.desc   Test the function of the interface ByteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferByteLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferByteLength0003';
      try {
        let uint8Array = new Uint8Array([0x74, 0x79, 0x70, 0x65, 0x64]);
        const res = buffer.byteLength(uint8Array);
        expect(res).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1220
     * @tc.desc   Test the function of the interface ByteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferByteLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferByteLength0004';
      try {
        let arrayBuffer = new ArrayBuffer(8);
        let dataView = new DataView(arrayBuffer);
        const res = buffer.byteLength(dataView);
        expect(res).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1230
     * @tc.desc   Test the function of the interface ByteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferByteLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferByteLength0005';
      try {
        let arrayBuffer = new ArrayBuffer(8);
        expect(buffer.byteLength(arrayBuffer)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1240
     * @tc.desc   Test the function of the interface ByteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferByteLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferByteLength0006';
      try {
        const sharedBuffer = new SharedArrayBuffer(8);
        expect(buffer.byteLength(sharedBuffer)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1250
     * @tc.desc   Test the function of the interface ByteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferByteLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferByteLength0007';
      try {
        let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        const res = buffer.byteLength(buf, 'utf8');
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1260
     * @tc.desc   Test the function of the interface ByteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferByteLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferByteLength0008';
      try {
        let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        const res = buffer.byteLength(buf, 'base64');
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1270
     * @tc.desc   Test the function of the interface ByteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferByteLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferByteLength0009';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const dataView = new DataView(arrayBuffer);
        dataView.setUint8(0, 104);
        dataView.setUint8(1, 101);
        dataView.setUint8(2, 108);
        dataView.setUint8(3, 108);
        dataView.setUint8(4, 111);
        let buf = buffer.byteLength(dataView);
        expect(buf).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1280
     * @tc.desc   Test the function of the interface ByteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferByteLength0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testBufferByteLength0010';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const dataView = new DataView(arrayBuffer);
        dataView.setUint8(0, 104);
        dataView.setUint8(1, 101);
        dataView.setUint8(2, 108);
        dataView.setUint8(3, 108);
        dataView.setUint8(4, 111);
        let buf = buffer.byteLength(dataView, 'utf8');
        expect(buf).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1290
     * @tc.desc   Test the function of the interface ByteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferByteLength0011';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const dataView = new DataView(arrayBuffer);
        dataView.setUint8(0, 104);
        dataView.setUint8(1, 101);
        dataView.setUint8(2, 108);
        dataView.setUint8(3, 108);
        dataView.setUint8(4, 111);
        let buf = buffer.byteLength(dataView, 'base64');
        expect(buf).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferConcat0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1300
     * @tc.desc   Test the function of the interface Concat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferConcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0001';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        let buf = buffer.concat([buf1, buf2]);
        expect(buf.length).assertEqual(8);
        expect(buf.toString('utf8')).assertEqual('1234abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferConcat0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1310
     * @tc.desc   Test the function of the interface Concat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0002';
      try {
        let uint8Arr1 = new Uint8Array([1, 2, 3, 4]);
        let uint8Arr2 = new Uint8Array([5, 6, 7, 8]);
        let buf3 = buffer.concat([uint8Arr1, uint8Arr2]);
        expect(buf3.toString('hex')).assertEqual('0102030405060708');
        expect(buf3.length).assertEqual(8);
        expect(buf3.toString('utf8')).assertEqual('\u0001\u0002\u0003\u0004\u0005\u0006\u0007\u0008');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferConcat0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1320
     * @tc.desc   Test the function of the interface Concat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferConcat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0003';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        let buf4 = buffer.concat([buf1, buf2], undefined);
        expect(buf4.toString('hex')).assertEqual('3132333461626364');
        expect(buf4.length).assertEqual(8);
        expect(buf4.toString('utf8')).assertEqual('1234abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferConcat0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1330
     * @tc.desc   Test the function of the interface Concat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferConcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0004';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        let buf5 = buffer.concat([buf1, buf2], 0);
        expect(buf5.toString()).assertEqual('1234abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferConcat0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1340
     * @tc.desc   Test the function of the interface Concat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferConcat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0005';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        buffer.concat([buf1, buf2], -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferConcat0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1350
     * @tc.desc   Test the function of the interface Concat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferConcat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      6
      const TAG = 'testBufferConcat0006';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        buffer.concat([buf1, buf2], Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: Infinity');
      }
    })
    /**
     * @tc.name   testBufferConcat0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1360
     * @tc.desc   Test the function of the interface Concat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferConcat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0007';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        buffer.concat([buf1, buf2], -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: -Infinity');
      }
    })
    /**
     * @tc.name   testBufferConcat0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1370
     * @tc.desc   Test the function of the interface Concat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferConcat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0008';
      try {
        let buf1 = buffer.from("L234");
        let buf2 = buffer.from("abcd");
        let buf3 = buffer.concat([buf1, buf2], 1);
        expect(buf3.toString()).assertEqual('L');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferConcat0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1380
     * @tc.desc   Test the function of the interface Concat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferConcat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0009';
      try {
        const arr1 = new Uint8Array([104, 101, 108, 108, 111]);
        const arr2 = new Uint8Array([119, 111, 114, 108, 100]);
        const buf1 = buffer.from(arr1);
        const buf2 = buffer.from(arr2);
        const concatBuf = buffer.concat([buf1, buf2], -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferConcat0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1390
     * @tc.desc   Test the function of the interface Concat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferConcat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0010';
      try {
        const arr1 = new Uint8Array([104, 101, 108, 108, 111]);
        const arr2 = new Uint8Array([119, 111, 114, 108, 100]);
        const buf1 = buffer.from(arr1);
        const buf2 = buffer.from(arr2);
        const concatBuf = buffer.concat([buf1, buf2], 1);
        expect(concatBuf.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom10001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1400
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10001';
      try {
        const ab1 = new ArrayBuffer(8);
        const buf1 = buffer.from(ab1);
        expect(buf1.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom10002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1410
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10002';
      try {
        const ab2 = new SharedArrayBuffer(8);
        const buf2 = buffer.from(ab2);
        expect(buf2.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom10003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1420
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10003';
      try {
        const ab1 = new ArrayBuffer(8);
        const buf3 = buffer.from(ab1, undefined);
        expect(buf3.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
    })
    /**
     * @tc.name   testBufferFrom10004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1430
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10004';
      try {
        const ab1 = new ArrayBuffer(8);
        const buf4 = buffer.from(ab1, 0);
        expect(buf4.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
    })
    /**
     * @tc.name   testBufferFrom10005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1440
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10005';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 8. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferFrom10006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1450
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10006';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 8. Received value is: Infinity')

      }
    })
    /**
     * @tc.name   testBufferFrom10007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1460
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10007';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 8. Received value is: -Infinity');
      }
    })
    /**
     * @tc.name   testBufferFrom10008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1470
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10008';
      try {
        const ab1 = new ArrayBuffer(8);
        const res = buffer.from(ab1, 4, 0);
        expect(res.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom10009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1480
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10009';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferFrom10010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1490
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10010';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, 0, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: Infinity')

      }
    })
    /**
     * @tc.name   testBufferFrom10011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1500
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10011';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, 0, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: -Infinity');
      }
    })
    /**
     * @tc.name   testBufferFrom10012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1510
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10012';
      try {
        const ab1 = new ArrayBuffer(8);
        const res = buffer.from(ab1, 0, 1);
        expect(ab1.byteLength).assertEqual(8);
        expect(res.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom10013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1520
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10013';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const uint8Array = new Uint8Array(arrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111]);
        const buf = buffer.from(arrayBuffer, Infinity, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 5. Received value is: Infinity');
      }
    })
    /**
     * @tc.name   testBufferFrom10014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1530
     * @tc.desc   Test the function of the interface From1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10014';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const uint8Array = new Uint8Array(arrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111]);
        const buf = buffer.from(arrayBuffer, Infinity, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 5. Received value is: Infinity');
      }
    })
    /**
     * @tc.name   testBufferFrom20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1540
     * @tc.desc   Test the function of the interface From2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20001';
      try {
        const buf1 = buffer.from('test');
        const buf2 = buffer.from(buf1);
        expect(buf2.toString()).assertEqual('test');
        buf1[0] = 'T'.charCodeAt(0);
        expect(buf2.toString()).assertEqual('test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom20002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1550
     * @tc.desc   Test the function of the interface From2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20002';
      try {
        const uint8Arr = new Uint8Array([1, 2, 3]);
        const buf3 = buffer.from(uint8Arr);
        const result: number[] = [];
        for (let i = 0; i < buf3.length; i++) {
          result.push(buf3[i]);
        }
        console.log(`${TAG} result: ${result}`);
        expect(result.join(',')).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom20003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1560
     * @tc.desc   Test the function of the interface From2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20003';
      try {
        const invalidInput = new String('invalid');
        const result = buffer.from(invalidInput);
        expect(result.length).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom20004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1570
     * @tc.desc   Test the function of the interface From2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20004';
      try {
        buffer.from(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, Array-like, string, object. Received value is: undefined');
      }
    });
    /**
     * @tc.name   testBufferFrom20005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1580
     * @tc.desc   Test the function of the interface From2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20005';
      try {
        const emptyBuf = buffer.from(new Uint8Array(0));
        expect(emptyBuf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
    })
    /**
     * @tc.name   testBufferFrom20006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1590
     * @tc.desc   Test the function of the interface From2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20006';
      try {
        const sharedArrayBuffer = new SharedArrayBuffer(10);
        const uint8Array = new Uint8Array(sharedArrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111, 119, 111, 114, 108, 100]);
        const buf = buffer.from(sharedArrayBuffer, undefined);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom20007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1600
     * @tc.desc   Test the function of the interface From2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20007';
      try {
        const sharedArrayBuffer = new SharedArrayBuffer(10);
        const uint8Array = new Uint8Array(sharedArrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111, 119, 111, 114, 108, 100]);
        const buf = buffer.from(sharedArrayBuffer, 0);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom20008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1610
     * @tc.desc   Test the function of the interface From2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20008';
      try {
        const sharedArrayBuffer = new SharedArrayBuffer(10);
        const uint8Array = new Uint8Array(sharedArrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111, 119, 111, 114, 108, 100]);
        const buf = buffer.from(sharedArrayBuffer, 0, 0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom30001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1620
     * @tc.desc   Test the function of the interface From3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30001';
      try {
        let buf = buffer.from(new String('this is a test'), 11, 0);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1630
     * @tc.desc   Test the function of the interface From3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30002';
      try {
        let buf = buffer.from(new String('this is a test'), 11, -1);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom30003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1640
     * @tc.desc   Test the function of the interface From3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30003';
      try {
        let buf = buffer.from(new String('this is a test'), 11, Infinity);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom30004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1650
     * @tc.desc   Test the function of the interface From3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30004';
      try {
        let buf = buffer.from(new String('hello world'), 1, -Infinity);
        expect(buf.length).assertEqual(11);
        expect(buf.toString()).assertEqual('hello world');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom30005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1660
     * @tc.desc   Test the function of the interface From3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30005';
      try {
        let buf = buffer.from(new String('hello world'), 'test', 1);
        expect(buf).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('Parameter error. The type of "encoding" must be BufferEncoding. the encoding test is unknown');
      }
    })
    /**
     * @tc.name   testBufferFrom30006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1670
     * @tc.desc   Test the function of the interface From3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom30006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30006';
      try {
        let buf = buffer.from(new String('this is a test'), 'utf8', -1);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom30007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1680
     * @tc.desc   Test the function of the interface From3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom30007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30007';
      try {
        let buf = buffer.from(new String('this is a test'), 'utf8', Infinity);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom30008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1690
     * @tc.desc   Test the function of the interface From3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30008';
      try {
        let buf = buffer.from(new String('this is a test'), 'utf8', -Infinity);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom30009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1700
     * @tc.desc   Test the function of the interface From3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom30009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30009';
      try {
        class Person {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }
        }

        const person = new Person("Alice", 30);
        buffer.from(person, 11, 0);
        buffer.from(person, 11, -1);
        buffer.from(person, 11, Infinity);
        buffer.from(person, 11, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertContain('Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, Array-like.');
      }
    })
    /**
     * @tc.name   testBufferFrom30010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1710
     * @tc.desc   Test the function of the interface From3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom30010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30010';
      try {
        const testStringObject = new String('hello');
        const buf = buffer.from(testStringObject, 'utf-8', -1);
        expect(buf.toString('utf-8')).assertEqual('hello');
        expect(buf.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferFrom30011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1720
     * @tc.desc   Test the function of the interface From3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom30011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30011';
      try {
        class MyClass {
          public value: string;

          constructor(value: string) {
            this.value = value;
          }

          toString(): string {
            return this.value;
          }
        }

        const testStringObject = new MyClass('hello');
        const buf = buffer.from(testStringObject, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertContain('Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, Array-like.');
      }
    })
    /**
     * @tc.name   testBufferFrom40001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1730
     * @tc.desc   Test the function of the interface From4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom40001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom40001';
      try {
        let buf = buffer.from('this is a test');
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferFrom40002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1740
     * @tc.desc   Test the function of the interface From4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom40002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom40002';
      try {
        let buf = buffer.from('abc', 'base64');
        expect(buf.toString()).assertEqual('i·');
        expect(buf.length).assertEqual(2);
        expect(buf.toString('base64')).assertEqual('abc=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferFrom40003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1750
     * @tc.desc   Test the function of the interface From4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFrom40003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom40003';
      try {
        let buf = buffer.from('this is a test', 'utf-8');
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCompare0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1760
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0001';
      try {
        let buf1 = buffer.from('1234');
        let buf2 = buffer.from('0123');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferCompare0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1770
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0002';
      try {
        let buf1 = buffer.from('1234');
        let buf2 = new Uint8Array([1, 2, 3, 4]);
        let res = buf1.compare(buf2);
        console.info(Number(res).toString());
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferCompare0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1780
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0003';
      try {
        let buf1 = new Uint8Array([1, 2, 3, 4]);
        let buf2 = buffer.from('1234');
        let res = buf2.compare(buf1);
        console.info(Number(res).toString());
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferCompare0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1790
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0004';
      try {
        let buf1 = new Uint8Array([1, 2, 3, 4]);
        let buf2 = new Uint8Array([1, 2, 3, 4]);
        let buf1Buffer = buffer.from(buf1);
        let buf2Buffer = buffer.from(buf2);
        let res = buf1Buffer.compare(buf2Buffer);
        console.info(Number(res).toString());
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferTranscode0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1800
     * @tc.desc   Test the function of the interface Transcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferTranscode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0001';
      try {
        let buf = buffer.from('€')
        let newBuf = buffer.transcode(buf, 'base64', 'base64');
        expect(newBuf.toString()).assertEqual('€');
        expect(newBuf.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferTranscode0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1810
     * @tc.desc   Test the function of the interface Transcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferTranscode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0002';
      try {
        let buf = buffer.from('hello world');
        let newBuf = buffer.transcode(buf, 'base64', 'utf-8');
        expect(newBuf.toString()).assertEqual('aGVsbG8gd29ybGQ=');
        expect(newBuf.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferTranscode0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1820
     * @tc.desc   Test the function of the interface Transcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferTranscode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0003';
      try {
        let buf = buffer.from('hello world');
        let newBuf = buffer.transcode(buf, 'utf-8', 'base64');
        console.log(`${TAG} newBuf:${newBuf}`);
        expect(newBuf.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferTranscode0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1830
     * @tc.desc   Test the function of the interface Transcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferTranscode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0004';
      try {
        let buf = buffer.from('hello world');
        let newBuf = buffer.transcode(buf, 'utf-8', 'utf-8');
        expect(newBuf.toString()).assertEqual('hello world');
        expect(newBuf.length).assertEqual(11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferTranscode0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1840
     * @tc.desc   Test the function of the interface Transcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferTranscode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0005';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'base64', 'base64');
        expect(newBuf.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferTranscode0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1850
     * @tc.desc   Test the function of the interface Transcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferTranscode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0006';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'base64', 'utf-8');
        expect(newBuf.toString('utf-8')).assertEqual('1,2,3,4');
        expect(newBuf.length).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testBufferTranscode0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1860
     * @tc.desc   Test the function of the interface Transcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferTranscode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0007';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'utf-8', 'base64');
        expect(newBuf.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferTranscode0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1870
     * @tc.desc   Test the function of the interface Transcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferTranscode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0008';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'utf-8', 'utf-8');
        expect(newBuf.toString('utf-8')).assertEqual('1,2,3,4');
        expect(newBuf.length).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.name   testBufferFill0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1880
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0001';
      try {
        const buf = buffer.allocUninitializedFromPool(5);
        buf.fill(0x41);
        const result = buf.toString('utf-8');
        expect(result).assertEqual('AAAAA');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferFill0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1890
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0002';
      try {
        const buf = buffer.allocUninitializedFromPool(3);
        buf.fill('a');
        expect(buf.toString()).assertEqual('aaa');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferFill0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1900
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0003';
      try {
        let buf1 = buffer.from([1])
        let buf2 = buffer.allocUninitializedFromPool(4);
        buf2.fill(buf1)
        for (let i = 0; i < buf2.length; i++) {
          expect(buf2[i]).assertEqual(1);
        }
        let expectedBuf = buffer.from([1, 1, 1, 1]);
        expect(buf2.equals(expectedBuf)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferFill0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1910
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0004';
      try {
        let uint = new Uint8Array([0x48, 0x49]);
        let buf = buffer.allocUninitializedFromPool(5);
        buf.fill(uint);
        let expectedBuf = buffer.from([72, 73, 72, 73, 72]);
        expect(buf.equals(expectedBuf)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferFill0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1920
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0005';
      try {
        const buf = buffer.alloc(3)
        buf.fill(3)
        const res = buffer.from([3, 3, 3]);
        expect(buf.equals(res)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferFill0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1930
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0006';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', 0);
        expect(buf.toString()).assertEqual('DDDDDD');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferFill0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1940
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0007';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    });
    /**
     * @tc.name   testBufferFill0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1950
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0008';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4294967296. Received value is: Infinity');
      }
    });
    /**
     * @tc.name   testBufferFill0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1960
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0009';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4294967296. Received value is: -Infinity');
      }
    });
    /**
     * @tc.name   testBufferFill0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1970
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0010';
      try {
        const buf = buffer.alloc(3);
        buf.fill('A', 1);
        expect(buf.toString()).assertEqual('\x00AA');
        expect(buf[1]).assertEqual(0x41);
        expect(buf[2]).assertEqual(0x41);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferFill0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1980
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0011';
      try {
        const buf = buffer.alloc(3)
        buf.fill('A', 0, 0);
        expect(buf.toString()).assertEqual('\x00\x00\x00');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferFill0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_1990
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0012';
      try {
        const buf = buffer.alloc(5);
        buf.fill(0x4B, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "end" is out of range. It must be >= 0 and <= 5. Received value is: -1');
      }
    });
    /**
     * @tc.name   testBufferFill0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2000
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0013';
      try {
        const buf = buffer.alloc(5);
        buf.fill(0x4B, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "end" is out of range. It must be >= 0 and <= 5. Received value is: Infinity');
      }
    });
    /**
     * @tc.name   testBufferFill0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2010
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0014';
      try {
        const buf = buffer.alloc(5);
        buf.fill(0x4B, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "end" is out of range. It must be >= 0 and <= 5. Received value is: -Infinity');
      }
    });
    /**
     * @tc.name   testBufferFill0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2020
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0015';
      try {
        const buf = buffer.alloc(3);
        buf.fill('A', 0, 1);
        expect(buf.toString()).assertEqual('A\x00\x00');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferFill0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2030
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0016';
      try {
        const buf = buffer.alloc(5);
        buf.fill('A', 0, 5, 'base64');
        expect(buf.toString('base64')).assertEqual('AAAAAAA=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferFill0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2040
     * @tc.desc   Test the function of the interface Fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferFill0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0017';
      try {
        const buf = buffer.alloc(5);
        buf.fill('a', 0, 5, 'utf8');
        expect(buf.toString('utf8')).assertEqual('aaaaa');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2050
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0001';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        expect(buf1.compare(buf2)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2060
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0002';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const u8 = new Uint8Array([0, 2, 3]);
        expect(buf1.compare(u8)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferBufferCompare0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2070
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0003';
      try {
        const buf1 = buffer.from([3, 2, 1]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, 0);
        expect(buf1.compare(buf2, 0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2080
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0004';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, -1);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2090
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0005';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, Infinity);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: Infinity');
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2100
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0006';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, -Infinity);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -Infinity');
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2110
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0007';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, 1);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2120
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0008';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2130
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0009';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, 0);
        const result = buf1.compare(buf2);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2140
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0010';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([4, 5, 6]);
        buf1.compare(buf2, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetEnd" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2150
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0011';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3, 4]);
        const result = buf1.compare(buf2, undefined, Infinity);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetEnd" is out of range. It must be >= 0 and <= 4. Received value is: Infinity');
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2160
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0012';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, -Infinity);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetEnd" is out of range. It must be >= 0 and <= 3. Received value is: -Infinity');
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2170
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0013';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, 1);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferBufferCompare0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2180
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0014';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([4, 5, 6]);
        buf1.compare(buf2, undefined, undefined);
        expect(buf1.compare(buf2, undefined, undefined)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferBufferCompare0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2190
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0015';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, 0);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferBufferCompare0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2200
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0016';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferBufferCompare0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2210
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0017';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, undefined, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: Infinity');
      }
    })
    /**
     * @tc.name   testBufferBufferCompare0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2220
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0018';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -Infinity');
      }
    })
    /**
     * @tc.name   testBufferBufferCompare0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2230
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0019';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, 1);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferBufferCompare0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2240
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0020';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferBufferCompare0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2250
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0021';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, 0);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferBufferCompare0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2260
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0022';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, -1);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferBufferCompare0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2270
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0023';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 3. Received value is: Infinity');
      }
    })
    /**
     * @tc.name   testBufferBufferCompare0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2280
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0024';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 3. Received value is: -Infinity');
      }
    })
    /**
     * @tc.name   testBufferBufferCompare0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2290
     * @tc.desc   Test the function of the interface Compare.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferBufferCompare0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0025';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, 1);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2300
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0001';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2310
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0002';
      try {
        const buf1 = buffer.alloc(26);
        for (let i = 0; i < 26; i++) {
          buf1[i] = i + 97;
        }
        const buf2 = new Uint8Array(26);
        buf1.copy(buf2);
        for (let i = 0; i < 26; i++) {
          expect(buf2[i]).assertEqual(97 + i);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferCopy0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2320
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0003';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, 0);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2330
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0004';
      try {
        let buf1 = buffer.alloc(6);
        let buf2 = buffer.alloc(6).fill('!');
        buf1.copy(buf2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferCopy0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2340
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0005';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, Infinity);
        expect(buf2.toString()).assertEqual('!!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2350
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0006';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0. Received value is: -Infinity');
      }
    })
    /**
     * @tc.name   testBufferCopy0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2360
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0007';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, 1);
        expect(buf2.toString()).assertEqual('!abcdefghijklmnopqrstuvwxy');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2370
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0008';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2380
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0009';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, 0);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2390
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0010';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferCopy0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2400
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0011';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, Infinity);
        expect(buf2.toString()).assertEqual('!!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2410
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0012';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0. Received value is: -Infinity');
      }
    })
    /**
     * @tc.name   testBufferCopy0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2420
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0013';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, 1);
        expect(buf2.toString()).assertEqual('bcdefghijklmnopqrstuvwxyz!');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2430
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0014';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2440
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0015';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, 0);
        expect(buf2.toString()).assertEqual('!!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2450
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0016';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferCopy0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2460
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0017';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, Infinity);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2470
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0018';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0. Received value is: -Infinity');
      }
    })
    /**
     * @tc.name   testBufferCopy0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2480
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0019';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, 1);
        expect(buf2.toString()).assertEqual('a!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferCopy0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2490
     * @tc.desc   Test the function of the interface Copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferCopy0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0020';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, undefined);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferEquals0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2500
     * @tc.desc   Test the function of the interface Equals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferEquals001';
      try {
        const buf1 = buffer.from('ABC');
        const buf2 = buffer.from('414243', 'hex');
        const result = buf1.equals(buf2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferEquals0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2510
     * @tc.desc   Test the function of the interface Equals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferEquals0002';
      try {
        const buf1 = buffer.from('ABC');
        const buf2 = new Uint8Array([1, 2, 3]);
        const result = buf1.equals(buf2);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferEquals0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2520
     * @tc.desc   Test the function of the interface Equals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferEquals0003';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const u8 = new Uint8Array([1, 2, 3]);
        const result = buf1.equals(u8);
        expect(result).assertEqual(true);
        expect([...u8].indexOf(2)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferEquals0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2530
     * @tc.desc   Test the function of the interface Equals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferEquals0004';
      try {
        const target = buffer.from([1, 2, 3, 4]);
        const source = buffer.from([3, 4, 5]);
        expect(target.equals(source)).assertEqual(
          target[3] === source[0]
        );
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2540
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0001';
      try {
        let buf = buffer.from('hello world');
        expect(buf.includes('hello')).assertTrue();
        expect(buf.includes('be')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2550
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0002';
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        expect(buf.includes(1)).assertTrue();
        expect(buf.includes(5)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2560
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0003';
      try {
        let buf = buffer.from('hello world');
        let searchBuf = buffer.from('world');
        expect(buf.includes(searchBuf)).assertTrue();
        expect(buf.includes(buffer.from('test'))).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2570
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0004';
      try {
        let buf = buffer.from('hello world');
        let arr = new Uint8Array([0x68, 0x65]);
        expect(buf.includes(arr)).assertTrue();
        expect(buf.includes(new Uint8Array([0x7a]))).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2580
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0005';
      try {
        let buf = buffer.from('hello');
        const result = buf.includes('hello', 0);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2590
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0006';
      try {
        let buf = buffer.from('abcdefg');
        buf.includes('def', -1);
        expect(buf.includes('def', -1)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2600
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0007';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('a', Infinity)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2610
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0008';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('c', -Infinity)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2620
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferIncludes0009';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('a', 1)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2630
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0010';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('a', undefined)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2640
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0011';
      try {

        let buf = buffer.from('test');
        expect(buf.includes('dGVzdA==', undefined, 'base64')).assertTrue();
        expect(buf.includes('abcd', undefined, 'base64')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2650
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0012';
      try {
        let buf = buffer.from('你好');
        expect(buf.includes('你好', undefined, 'utf-8')).assertTrue();
        expect(buf.includes('hello', undefined, 'utf-8')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2660
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0013';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, Infinity);
        expect(includesTrue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2670
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0014';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, Infinity, 'utf-8');
        expect(includesTrue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2680
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0015';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, 1, 'utf-8');
        expect(includesTrue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2690
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0016';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, 1, 'base64');
        expect(includesTrue).assertEqual(true)

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2700
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0017';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf);
        expect(includes).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2710
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0018';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, Infinity, 'utf-8');
        expect(includes).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2720
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0019';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, Infinity, 'base64');
        expect(includes).assertEqual(false)

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2730
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0020';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, 1, 'utf-8');
        expect(includes).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIncludes0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2740
     * @tc.desc   Test the function of the interface Includes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIncludes0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0021';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, 1);
        expect(includes).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2750
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0001';
      try {
        let buf = buffer.from('this is a buffer');
        let result = buf.indexOf('this');
        expect(result).assertEqual(0);
        expect(buf.indexOf('is')).assertEqual(2);
        expect(buf.indexOf('a')).assertEqual(8);
        expect(buf.indexOf('buffer')).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2760
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0002';
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        let result = buf.indexOf(3);
        expect(result).assertEqual(2);
        expect(buf.indexOf(4)).assertEqual(3);
        expect(buf.indexOf(1)).assertEqual(0);
        expect(buf.indexOf(5)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2770
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0003';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6]);
        let buf1 = buffer.from([1, 2, 3]);
        let result = buf.indexOf(buf1);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2780
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0004';
      try {
        let buf = buffer.from('this');
        let uint8Arr = new Uint8Array([0x74]);
        let result = buf.indexOf(uint8Arr);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2790
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0005';
      try {
        let buf = buffer.from('this is a buffer');
        expect(buf.indexOf('this', 0).toString()).assertEqual('0');
        expect(buf.indexOf('is', 0).toString()).assertEqual('2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2800
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0006';
      try {
        let buf = buffer.from([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf1 = buffer.from([0, 1, 2, 3, 4, 5]);
        expect(buf.indexOf(buf1, -1)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2810
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0007';
      try {
        let buf = buffer.from('this is a buffer');
        buf.indexOf('this', Infinity);
        buf.indexOf('is', Infinity);
        expect(buf.indexOf('this', Infinity)).assertEqual(-1);
        expect(buf.indexOf('is', Infinity)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2820
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0008';
      try {
        let buf = buffer.from('this is a buffer');
        buf.indexOf('this', -Infinity);
        buf.indexOf('is', -Infinity);
        expect(buf.indexOf('this', -Infinity)).assertEqual(0);
        expect(buf.indexOf('is', -Infinity)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2830
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0009';
      try {
        let buf = buffer.from('this is a buffer');
        buf.indexOf('this', 1);
        buf.indexOf('is', 1);
        expect(buf.indexOf('this', 1)).assertEqual(-1);
        expect(buf.indexOf('is', 1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2840
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0010';
      try {
        let buf = buffer.from('this is a buffer');
        let result = buf.indexOf('this', undefined);
        expect(result).assertEqual(0);
        expect(buf.indexOf('is', undefined)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2850
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0011';
      try {
        let buf = buffer.from('hello this is a buffer');
        let base64Value = 'aGVsbG8=';
        let result = buf.indexOf(base64Value, undefined, 'base64');
        expect(result).assertEqual(0);
        expect(buf.indexOf('this', undefined, 'base64')).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2860
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0012';
      try {
        let buf = buffer.from('this is a buffer');
        expect(buf.indexOf('this', undefined, 'utf-8')).assertEqual(0);
        expect(buf.indexOf('is', undefined, 'utf-8')).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2870
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0013';
      try {
        let buf = buffer.from('test');
        let emptyBuf = buffer.alloc(0);
        let result = buf.indexOf(emptyBuf);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2880
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0014';
      try {
        const buf = buffer.from('Hello World');
        const index = buf.indexOf('World', 1, 'utf-8');
        expect(index).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2890
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0015';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 0);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2900
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0016';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 0, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2910
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0017';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 0, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2920
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0018';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -1);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2930
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0019';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -1, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2940
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0020';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -1, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2950
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0021';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, Infinity, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2960
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0022';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, Infinity, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2970
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0023';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2980
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0024';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -Infinity, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_2990
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0025';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 1, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3000
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0026';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 1, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3010
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0027';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, 0, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3020
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0028';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, 0, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3030
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0029';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3040
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0030';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, Infinity);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3050
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0031';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, Infinity, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferIndexOf0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3060
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0032';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, -Infinity);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3070
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0033';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 0);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3080
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0034';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 0, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferIndexOf0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3090
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0035';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, -1);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3100
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0036';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, Infinity);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3110
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0037';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3120
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0038';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, Infinity, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3130
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0039';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, -Infinity);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3140
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0040';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, -Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3150
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0041';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, -Infinity, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3160
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0042';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 1);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3170
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0043';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 1, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIndexOf0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3180
     * @tc.desc   Test the function of the interface IndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIndexOf0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0042';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 1, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3190
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0001';
      try {
        let buf = buffer.from('this buffer is a buffer');
        expect(buf.lastIndexOf('buffer')).assertEqual(17);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3200
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0002';
      try {
        let buf = buffer.from([1, 23, 4, 6, 3, 45, 4, 5, 55, 16, 66, 2]);
        expect(buf.lastIndexOf(6)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3210
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0003';
      try {
        let valueBuf = buffer.from('buffer');
        let mainBuf = buffer.from('this buffer is a buffer');
        const result = mainBuf.lastIndexOf(valueBuf);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual(19);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3220
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0004';
      try {
        let uintArr = new Uint8Array([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        let mainBuf = buffer.from('this buffer is a buffer');
        const result = mainBuf.lastIndexOf(uintArr);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual(19);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3230
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0005';
      try {
        let buf = buffer.from('abcabc');
        expect(buf.lastIndexOf('abc', 0)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3240
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0006';
      try {
        let buf = buffer.from('abcdef');
        expect(buf.lastIndexOf('cd', -1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3250
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0007';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', Infinity)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3260
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0008';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', -Infinity)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3270
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0009';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', 1)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3280
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0010';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', undefined)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3290
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0011';
      try {
        let valueBase64 = 'YmFzZTY0';
        let buf = buffer.from('base64', 'utf8');
        expect(buf.lastIndexOf(valueBase64, undefined, 'base64')).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3300
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0012';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', undefined, 'utf8')).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3310
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0013';
      try {
        const buf = buffer.from('Hello World');
        const value = 'World';
        const index = buf.lastIndexOf(value, 1, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3320
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0014';
      try {
        const buf = buffer.from('Hello World');
        const value = 'World';
        const index = buf.lastIndexOf(value, 1, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3330
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0015';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, 0, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3340
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0016';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, 0, 'utf8');
        expect(index).assertEqual(0)

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3350
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0017';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, 0, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3360
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0018';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, -1, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3370
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0019';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, -1, 'utf8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3380
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0020';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferLastIndexOf0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3390
     * @tc.desc   Test the function of the interface LastIndexOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferLastIndexOf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferLastIndexOf0021';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, Infinity, 'utf8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigInt64BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3400
     * @tc.desc   Test the function of the interface readBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigInt64BE0001';
      try {
        let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        expect(buf.readBigInt64BE().toString()).assertEqual('7161960797921896816');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigInt64BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3410
     * @tc.desc   Test the function of the interface readBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigInt64BE0002';
      try {
        let buf = buffer.alloc(8)
        buf.writeBigInt64BE(BigInt(0x0102030405060708), 0);
        expect(buf.readBigInt64BE(0).toString()).assertEqual(BigInt(0x0102030405060708).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigInt64BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3420
     * @tc.desc   Test the function of the interface readBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigInt64BE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = BigInt(0x0203040506070809);
        buf.writeBigInt64BE(expectedValue, 1);
        expect(buf.readBigInt64BE(1).toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigInt64BE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3430
     * @tc.desc   Test the function of the interface readBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigInt64BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigInt64BE0004';
      try {
        let buf = buffer.alloc(8)
        buf.readBigInt64BE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadBigInt64LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ READ_0500
     * @tc.desc   Test the function of the interface ReadBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigInt64LE0001';
      try {
        let buf = buffer.alloc(8);
        const expectedValue = BigInt("0x0102030405060708");
        buf.writeBigInt64LE(expectedValue, 0);
        const actualValue = buf.readBigInt64LE();
        expect(actualValue.toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigInt64LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3440
     * @tc.desc   Test the function of the interface ReadBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigInt64LE0002';
      try {
        let buf = buffer.alloc(8)
        buf.writeBigInt64LE(BigInt(0x0102030405060708), 0);
        expect(buf.readBigInt64LE(0).toString()).assertEqual(BigInt(0x0102030405060708).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigInt64LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3450
     * @tc.desc   Test the function of the interface ReadBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigInt64LE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = BigInt(0x0203040506070809);
        buf.writeBigInt64LE(expectedValue, 1);
        expect(buf.readBigInt64LE(1).toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigInt64LE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3460
     * @tc.desc   Test the function of the interface ReadBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigInt64LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigInt64LE0004';
      try {
        let buf = buffer.alloc(8)
        buf.readBigInt64LE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadBigUInt64BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3470
     * @tc.desc   Test the function of the interface ReadBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigUInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigUInt64BE0001';
      try {
        let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        console.info(buf.readBigUInt64BE(0).toString());
        expect(buf.readBigUInt64BE(0).toString()).assertEqual('7161960797921896816');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigUInt64BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3480
     * @tc.desc   Test the function of the interface ReadBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigUInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigUInt64BE0002';
      try {
        let buf = buffer.alloc(8)
        buf.writeBigUInt64BE(BigInt(0x0102030405060708), 0);
        expect(buf.readBigUInt64BE(0).toString()).assertEqual(BigInt(0x0102030405060708).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigUInt64BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3490
     * @tc.desc   Test the function of the interface ReadBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigUInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigUInt64BE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = BigInt(0x0203040506070809);
        buf.writeBigUInt64BE(expectedValue, 1);
        expect(buf.readBigUInt64BE(1).toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigUInt64BE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3500
     * @tc.desc   Test the function of the interface ReadBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigUInt64BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigUInt64BE0004';
      try {
        let buf = buffer.alloc(8)
        buf.readBigUInt64BE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadBigUInt64LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3510
     * @tc.desc   Test the function of the interface ReadBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigUInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigUInt64LE0001';
      try {
        let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        console.info(buf.readBigUInt64LE(0).toString());
        expect(buf.readBigUInt64LE(0).toString()).assertEqual('8100120198111388771');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigUInt64LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3520
     * @tc.desc   Test the function of the interface ReadBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigUInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigUInt64LE0002';
      try {
        let buf = buffer.alloc(8)
        buf.writeBigUInt64LE(BigInt(0x0102030405060708), 0);
        expect(buf.readBigUInt64LE(0).toString()).assertEqual(BigInt(0x0102030405060708).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigUInt64LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3530
     * @tc.desc   Test the function of the interface ReadBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigUInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigUInt64LE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = BigInt(0x0203040506070809);
        buf.writeBigUInt64LE(expectedValue, 1);
        expect(buf.readBigUInt64LE(1).toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadBigUInt64LE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3540
     * @tc.desc   Test the function of the interface ReadBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadBigUInt64LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadBigUInt64LE0004';
      try {
        let buf = buffer.alloc(8)
        buf.readBigUInt64LE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadDoubleBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3550
     * @tc.desc   Test the function of the interface readDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadDoubleBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadDoubleBE0001';
      try {
        const buf = buffer.alloc(8);
        buf.writeDoubleBE(123.456, 0);
        const result = buf.readDoubleBE();
        expect(result).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadDoubleBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3560
     * @tc.desc   Test the function of the interface readDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadDoubleBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadDoubleBE0002';
      try {
        const buf = buffer.alloc(8);
        buf.writeDoubleBE(0, 0);
        const result = buf.readDoubleBE();
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadDoubleBE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3570
     * @tc.desc   Test the function of the interface readDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadDoubleBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadDoubleBE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = 123.456;
        buf.writeDoubleBE(expectedValue, 1);
        const actualValue = buf.readDoubleBE(1);
        expect(actualValue).assertEqual(expectedValue);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadDoubleBE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3580
     * @tc.desc   Test the function of the interface readDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadDoubleBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadDoubleBE0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(8);
        buf1.readDoubleBE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadDoubleLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3590
     * @tc.desc   Test the function of the interface readDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadDoubleLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadDoubleLE0001';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        console.info(buf.readDoubleLE().toString());
        expect(buf.readDoubleLE().toString()).assertEqual('5.447603722011605e-270');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadDoubleLE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3600
     * @tc.desc   Test the function of the interface readDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadDoubleLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadDoubleLE0002';
      try {
        let buf1 = buffer.allocUninitializedFromPool(8);
        let result = buf1.writeDoubleLE(123.456, 0);
        console.info("result = " + result);
        expect(buf1.readDoubleLE(0).toString()).assertEqual('123.456');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadDoubleLE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3610
     * @tc.desc   Test the function of the interface readDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadDoubleLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadDoubleLE0003';
      try {
        let buf1 = buffer.allocUninitializedFromPool(9);
        buf1.writeDoubleLE(123.456, 1);
        expect(buf1.readDoubleLE(1).toString()).assertEqual('123.456');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadDoubleLE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3620
     * @tc.desc   Test the function of the interface readDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadDoubleLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadDoubleLE0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(8);
        buf1.readDoubleLE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadFloatBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3630
     * @tc.desc   Test the function of the interface readFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadFloatBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadFloatBE0001';
      try {
        const buf = buffer.alloc(8);
        buf.writeFloatBE(123.456, 0);
        const result = buf.readFloatBE();
        expect(result).assertEqual(123.45600128173828);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadFloatBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3640
     * @tc.desc   Test the function of the interface readFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadFloatBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadFloatBE0002';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        console.info(buf.readFloatBE(0).toString());
        expect(buf.readFloatBE(0).toString()).assertEqual('2.387939260590663e-38');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadFloatBE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3650
     * @tc.desc   Test the function of the interface readFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadFloatBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadFloatBE0003';
      try {
        const buf = buffer.alloc(5);
        const value = 789.12;
        buf.writeFloatBE(value, 1);
        const readValue = buf.readFloatBE(1);
        expect(readValue).assertClose(value, 0.001);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadFloatBE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3660
     * @tc.desc   Test the function of the interface readFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadFloatBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadFloatBE0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(4);
        buf1.readFloatBE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadFloatLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3670
     * @tc.desc   Test the function of the interface readFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadFloatLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadFloatLE0001';
      try {
        const buf = buffer.alloc(8);
        buf.writeFloatLE(123.456, 0);
        const result = buf.readFloatLE();
        expect(result).assertEqual(123.45600128173828);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadFloatLE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3680
     * @tc.desc   Test the function of the interface readFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadFloatLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadFloatLE0002';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        console.info(buf.readFloatLE(0).toString());
        expect(buf.readFloatLE(0).toString()).assertEqual('1.539989614439558e-36');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadFloatLE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3690
     * @tc.desc   Test the function of the interface readFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadFloatLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadFloatLE0003';
      try {
        const buf = buffer.alloc(5)
        const expectedValue = 50.125;
        buf.writeFloatLE(expectedValue, 1);
        const actualValue = buf.readFloatLE(1);
        expect(actualValue).assertClose(expectedValue, 1e-6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadFloatLE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3700
     * @tc.desc   Test the function of the interface readFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadFloatLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadFloatLE0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(4);
        buf1.readFloatLE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadInt80001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3710
     * @tc.desc   Test the function of the interface readInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt80001';
      try {
        const buf = buffer.from([-42, 100]);
        const value = buf.readInt8();
        const result = value.toString();
        console.log(`${TAG} result is ${result}`);
        expect(result).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt80002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3720
     * @tc.desc   Test the function of the interface readInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt80002';
      try {
        let buf = buffer.from([-1, 5]);
        expect(buf.readInt8(0).toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt80003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3730
     * @tc.desc   Test the function of the interface readInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt80003';
      try {
        let buf = buffer.from([-1, 5]);
        expect(buf.readInt8(1).toString()).assertEqual('5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt80004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3740
     * @tc.desc   Test the function of the interface readInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt80004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(4);
        buf1.readInt8(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadInt16BE001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3750
     * @tc.desc   Test the function of the interface readInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt16BE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt16BE001';
      try {
        let buf = buffer.from([0x12, 0x34]);
        expect(buf.readInt16BE().toString()).assertEqual('4660');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt16BE002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3760
     * @tc.desc   Test the function of the interface readInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt16BE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt16BE002';
      try {
        let buf = buffer.from([0, 5]);
        expect(buf.readInt16BE(0).toString()).assertEqual('5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt16BE003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3770
     * @tc.desc   Test the function of the interface readInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt16BE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt16BE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        expect(buf.readInt16BE(1).toString()).assertEqual('13398');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt16BE004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3780
     * @tc.desc   Test the function of the interface readInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt16BE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt16BE004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(2);
        buf1.readInt16BE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadInt16LE001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3790
     * @tc.desc   Test the function of the interface readInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt16LE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt16LE001';
      try {
        let buf = buffer.from([0, 5]);
        console.info(buf.readInt16LE().toString());
        expect(buf.readInt16LE().toString()).assertEqual('1280');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt16LE002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3800
     * @tc.desc   Test the function of the interface readInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt16LE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt16LE002';
      try {
        let buf = buffer.from([0, 5]);
        expect(buf.readInt16LE(0).toString()).assertEqual('1280');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt16LE003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3810
     * @tc.desc   Test the function of the interface readInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt16LE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt16LE003';
      try {
        let buf = buffer.from([0, 5, 10]);
        let result = buf.readInt16LE(1);
        expect(result).assertEqual(2565);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt16LE004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3820
     * @tc.desc   Test the function of the interface readInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt16LE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt16LE004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(2);
        buf1.readInt16LE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadInt32BE001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3830
     * @tc.desc   Test the function of the interface readInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt32BE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt32BE001';
      try {
        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        console.info(buf.readInt32BE().toString());
        expect(buf.readInt32BE().toString()).assertEqual('5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt32BE002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3840
     * @tc.desc   Test the function of the interface readInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt32BE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt32BE002';
      try {
        let buf1 = buffer.alloc(4);
        let result = buf1.writeInt32BE(0x12345678, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt32BE003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3850
     * @tc.desc   Test the function of the interface readInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt32BE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt32BE003';
      try {
        let buf = buffer.from([0x00, 0x01, 0x02, 0x03, 0x04]);
        console.log(buf.readInt32BE(1).toString());
        expect(buf.readInt32BE(1).toString()).assertEqual('16909060');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt32BE004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3860
     * @tc.desc   Test the function of the interface readInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt32BE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt32BE004';
      try {
        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        buf.readInt32BE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadInt32LE001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3870
     * @tc.desc   Test the function of the interface readInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt32LE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt32LE001';
      try {

        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        console.info(buf.readInt32LE().toString());
        expect(buf.readInt32LE().toString()).assertEqual('83886080');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt32LE002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3880
     * @tc.desc   Test the function of the interface readInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt32LE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt32LE002';
      try {

        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        console.info(buf.readInt32LE(0).toString());
        expect(buf.readInt32LE(0).toString()).assertEqual('83886080');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt32LE003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3890
     * @tc.desc   Test the function of the interface readInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt32LE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt32LE003';
      try {
        let buf = buffer.from([0x00, 0x01, 0x02, 0x03, 0x04]);
        const value = buf.readInt32LE(1);
        console.log(value.toString());
        expect(value.toString()).assertEqual('67305985');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadInt32LE004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3900
     * @tc.desc   Test the function of the interface readInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadInt32LE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadInt32LE004';
      try {
        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        buf.readInt32LE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadUInt8001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3910
     * @tc.desc   Test the function of the interface readIntBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt8001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt8001';
      try {
        let buf = buffer.from([1, -2]);
        console.info(buf.readUInt8().toString());
        expect(buf.readUInt8().toString()).assertEqual('1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadUInt8002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3920
     * @tc.desc   Test the function of the interface ReadUInt8002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt8002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt8002';
      try {
        let buf = buffer.from([1, -2]);
        console.info(buf.readUInt8(0).toString());
        expect(buf.readUInt8(0).toString()).assertEqual('1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadUInt8003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3930
     * @tc.desc   Test the function of the interface ReadUInt8003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt8003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt8003';
      try {
        let buf = buffer.from([1, -2]);
        console.info(buf.readUInt8(1).toString());
        expect(buf.readUInt8(1).toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadUInt8004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3940
     * @tc.desc   Test the function of the interface ReadUInt8004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt8004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt8004';
      try {
        let buf = buffer.from([1, -2]);
        buf.readUInt8(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadUInt16BE001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3950
     * @tc.desc   Test the function of the interface ReadUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt16BE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt16BE001';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16BE().toString(16));
        expect(buf.readUInt16BE().toString(16)).assertEqual('1234');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadUInt16BE002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3960
     * @tc.desc   Test the function of the interface ReadUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt16BE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt16BE002';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16BE(0).toString(16));
        expect(buf.readUInt16BE(0).toString(16)).assertEqual('1234');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadUInt16BE003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3970
     * @tc.desc   Test the function of the interface ReadUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt16BE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt16BE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16BE(1).toString(16));
        expect(buf.readUInt16BE(1).toString(16)).assertEqual('3456');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadUInt16BE004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3980
     * @tc.desc   Test the function of the interface ReadUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt16BE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt16BE004';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        buf.readUInt16BE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadUInt16LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_3990
     * @tc.desc   Test the function of the interface ReadUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt16LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt16LE0001';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16LE(0).toString(16));
        expect(buf.readUInt16LE(0).toString(16)).assertEqual('3412');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadUInt16LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4000
     * @tc.desc   Test the function of the interface ReadUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt16LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt16LE0002';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16LE(0).toString(16));
        expect(buf.readUInt16LE(0).toString(16)).assertEqual('3412');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadUInt16LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4010
     * @tc.desc   Test the function of the interface ReadUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt16LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt16LE0003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16LE(1).toString(16));
        expect(buf.readUInt16LE(1).toString(16)).assertEqual('5634');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadUInt16LE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4020
     * @tc.desc   Test the function of the interface ReadUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt16LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt16LE0004';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        buf.readUInt16LE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadUInt32BE001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4030
     * @tc.desc   Test the function of the interface ReadUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt32BE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt32BE001';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        console.info(buf.readUInt32BE().toString(16));
        expect(buf.readUInt32BE().toString(16)).assertEqual('12345678');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadUInt32BE002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4040
     * @tc.desc   Test the function of the interface ReadUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt32BE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt32BE002';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        console.info(buf.readUInt32BE(0).toString(16));
        expect(buf.readUInt32BE(0).toString(16)).assertEqual('12345678');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadUInt32BE003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4050
     * @tc.desc   Test the function of the interface ReadUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt32BE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt32BE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        buf.writeUInt32BE(0x12345678, 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual(
          'The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1'
        );
      }
    });
    /**
     * @tc.name   testBufferReadUInt32BE004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4060
     * @tc.desc   Test the function of the interface ReadUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt32BE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt32BE004';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        buf.readUInt32BE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    });
    /**
     * @tc.name   testBufferReadUInt32LE001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4070
     * @tc.desc   Test the function of the interface ReadUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt32LE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt32LE001';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        console.info(buf.readUInt32LE(0).toString(16));
        expect(buf.readUInt32LE(0).toString(16)).assertEqual('78563412');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferReadUInt32LE002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4080
     * @tc.desc   Test the function of the interface ReadUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt32LE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt32LE002';
      try {

        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        const result = buf.readUInt32LE(1).toString(16);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    })
    /**
     * @tc.name   testBufferReadUInt32LE003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4090
     * @tc.desc   Test the function of the interface ReadUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt32LE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt32LE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        buf.writeUInt32LE(0x12345678, -1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferReadUInt32LE004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4100
     * @tc.desc   Test the function of the interface ReadUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferReadUInt32LE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferReadUInt32LE004';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        buf.readUInt32LE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferSubarray0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4110
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0001';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray();
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4120
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0002';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(0, 3);
        const res = buf2.toString('ascii', 0, buf2.length);
        expect(res).assertEqual('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4130
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0003';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(-1);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4140
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(Infinity);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4150
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0005';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(-Infinity);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4160
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0006';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('bcdefghijklmnopqrstuvwxyz');
        expect(buf2.length).assertEqual(25);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4170
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0007';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, 0);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4180
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0008';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, 1);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4190
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0009';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, -1);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
        expect(buf2.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4200
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0010';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, Infinity);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('bcdefghijklmnopqrstuvwxyz');
        expect(buf2.length).assertEqual(25);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4210
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0011';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, -Infinity);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
        expect(buf2.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4220
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0012';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-1, 1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4230
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0013';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(Infinity, 0);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4240
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0014';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(Infinity, -1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4250
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0015';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(Infinity, Infinity);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4260
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0016';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(Infinity, 1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4270
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0017';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, 0);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4280
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0018';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, -1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4290
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0019';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, Infinity);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4300
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0020';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, 1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4310
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0021';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, -Infinity);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4320
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0022';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(1, 0);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4330
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0023';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(1, -1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4340
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0024';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(1, Infinity);
        expect(buf2.length).assertEqual(7);
        expect(buf2.toString()).assertEqual('fghijkl');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSubarray0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4350
     * @tc.desc   Test the function of the interface Subarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSubarray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferSubarray0025';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(1, -Infinity);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4360
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0001';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        expect(buf1.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4370
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0002';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        expect(buf1.toString('base64')).assertEqual('YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXo=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4380
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0003';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 30);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4390
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0004';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 5, 3);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4400
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0005';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 0);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4410
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0006';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', -1);
        console.log(`${TAG} str: ${str}`);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4420
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0007';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', Infinity);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4430
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0008';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', -Infinity);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4440
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0009';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 1);
        expect(str).assertEqual('bcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4450
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0010';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4460
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0011';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined, 3);
        expect(str).assertEqual('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4470
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0012';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined, 0);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4480
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0013';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 0, 1);
        expect(str).assertEqual('a');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.name   testBufferToString0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4490
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0014';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined, Infinity)
        console.log(`${TAG} str: ${str}`);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4500
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0015';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 0, -Infinity);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4510
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0016';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined, -1);
        console.log(`${TAG} str: ${str}`);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4520
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0017';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4530
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0018';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4540
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0019';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, Infinity);
        expect(res.length).assertEqual(8);
        expect(res).assertEqual('aGVsbG8=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4550
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0020';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4560
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0021';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, 1);
        expect(res.length).assertEqual(4);
        expect(res).assertEqual('aA==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4570
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0022';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4580
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0023';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, 1);
        expect(res.length).assertEqual(4);
        expect(res).assertEqual('aA==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4590
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0024';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, Infinity);
        expect(res.length).assertEqual(8);
        expect(res).assertEqual('aGVsbG8=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4600
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0025';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4610
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0026';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, 1);
        expect(res.length).assertEqual(4);
        expect(res).assertEqual('aA==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4620
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0027';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4630
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0028';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4640
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0029';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4650
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0030';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4660
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0031';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4670
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0032';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4680
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0033';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4690
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0034';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, Infinity);
        expect(res.length).assertEqual(8);
        expect(res).assertEqual('aGVsbG8=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4700
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0035';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4710
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0036';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, 1);
        expect(res.length).assertEqual(4);
        expect(res).assertEqual('aA==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4720
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0037';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4730
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0038';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4740
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0039';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, Infinity);
        expect(res.length).assertEqual(8);
        expect(res).assertEqual('ZWxsbw==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4750
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0040';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4760
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0041';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4770
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0042';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4780
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0043';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4790
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0044';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4800
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0045';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4810
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0046';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4820
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0047';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, 1);
        expect(res.length).assertEqual(1);
        expect(res).assertEqual('h');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4830
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0048';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4840
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0049';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4850
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0050';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4860
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0051';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4870
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0052';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4880
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0053';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, 1);
        expect(res.length).assertEqual(1);
        expect(res).assertEqual('h');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4890
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0054';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, Infinity, undefined);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4900
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0055';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, Infinity, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4910
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0056';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, Infinity, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4920
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0057';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, Infinity, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4930
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0058';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, Infinity, Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4940
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0059';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, Infinity, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4950
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0060';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', undefined, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4960
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0061';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 0, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4970
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0062';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 0, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4980
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0063';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 0, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_4990
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0064';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 0, 1);
        expect(res.length).assertEqual(1);
        expect(res).assertEqual('h');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5000
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0065';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 0, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5010
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0066';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 0, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5020
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0067';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -1, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5030
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0068';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -1, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5040
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0069';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -1, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5050
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0070';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -1, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5060
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0071';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -1, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5070
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0072';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -1, 1);
        expect(res.length).assertEqual(1);
        expect(res).assertEqual('h');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5080
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0073';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', Infinity, undefined);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5090
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0074';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', Infinity, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5100
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0075';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', Infinity, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5110
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0076';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', Infinity, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5120
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0077';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', Infinity, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5130
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0078';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -Infinity, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5140
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0079';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 1, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferToString0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5150
     * @tc.desc   Test the function of the interface toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferToString0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferToString0080';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -Infinity, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5160
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0001';
      try {
        let buf = buffer.alloc(5);
        let len = buf.write("abc");
        expect(len).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5170
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0002';
      try {
        let buf = buffer.alloc(5);
        expect(buf.write("test", 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5180
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0003';
      try {
        let buf = buffer.alloc(5);
        let len = buf.write("abcd", undefined);
        expect(len).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5190
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0004';
      try {
        let buf = buffer.alloc(5);
        let len = buf.write("abcd", -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferWrite0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5200
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0005';
      try {
        let buf = buffer.alloc(10);
        const result = buf.write("test", Infinity);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 9. Received value is: Infinity');
      }
    })
    /**
     * @tc.name   testBufferWrite0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5210
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0006';
      try {
        let buf = buffer.alloc(10);
        const result = buf.write("test", -Infinity);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 9. Received value is: -Infinity');
      }
    })
    /**
     * @tc.name   testBufferWrite0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5220
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0007';
      try {
        let buf = buffer.alloc(5);
        const result = buf.write("abc", 1)
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5230
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0008';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", undefined);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5240
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0009';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, 0);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5250
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0010';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, -1);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 10. Received value is: -1');
      }
    })
    /**
     * @tc.name   testBufferWrite0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5260
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0011';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, Infinity);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 10. Received value is: Infinity');
      }
    })
    /**
     * @tc.name   testBufferWrite0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5270
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0012';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, -Infinity);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 10. Received value is: -Infinity');
      }
    })
    /**
     * @tc.name   testBufferWrite0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5280
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0013';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, 1);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5290
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0014';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, undefined);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5300
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0015';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, 1, 'base64');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5310
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0016';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 4, 2, 'utf8');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5320
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0017';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 4, 2, undefined);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5330
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0018';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("", 0, 0, 'utf8');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5340
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0019';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefghijklmnopqrstuvwxyz", 0, 10, 'utf8');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5350
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0020';
      try {
        let buf = buffer.alloc(5);
        const res = buf.write("abc", 6, 1, 'utf8');
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4. Received value is: 6');
      }
    })
    /**
     * @tc.name   testBufferWrite0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5360
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0021';
      try {
        let buf = buffer.alloc(5);
        const res = buf.write("abcdefg", 2, 5, 'utf8');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5370
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0022';
      try {
        let buf = buffer.alloc(5);
        const res = buf.write("abc", 0, 3, 'invalid_encoding');
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('Parameter error. The type of "encoding" must be BufferEncoding. the encoding invalid_encoding is unknown');
      }
    })
    /**
     * @tc.name   testBufferWrite0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5380
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0023';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abc", undefined, undefined, 'utf8');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5390
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0024';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abc", Infinity, Infinity, 'utf8');
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 9. Received value is: Infinity');
      }
    })
    /**
     * @tc.name   testBufferWrite0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5400
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0025';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abc", 0, 0, 'utf8');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWrite0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5410
     * @tc.desc   Test the function of the interface write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWrite0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWrite0026';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abc", -Infinity, -Infinity, 'utf8');
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 9. Received value is: -Infinity');
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5420
     * @tc.desc   Test the function of the interface writeBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64BE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        const res = buf.writeBigInt64BE(BigInt(0x1234567890abcdef), 0);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5430
     * @tc.desc   Test the function of the interface writeBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64BE0002';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(0x0304), 1);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5440
     * @tc.desc   Test the function of the interface writeBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64BE0003';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(0x05060708));
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64BE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5450
     * @tc.desc   Test the function of the interface writeBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64BE0004';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(0xbeef));
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64BE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5460
     * @tc.desc   Test the function of the interface writeBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64BE0005';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(0x4));
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64BE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5470
     * @tc.desc   Test the function of the interface writeBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64BE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64BE0006';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(0xfeedface));

        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(8);
        const result = buf.toString('hex')
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual('00000000feedface0000');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64BE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5480
     * @tc.desc   Test the function of the interface writeBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64BE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64BE0007';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(-2)).toString()
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual('8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64BE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5490
     * @tc.desc   Test the function of the interface writeBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64BE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64BE0008';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(2)).toString()
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual('8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64BE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5500
     * @tc.desc   Test the function of the interface writeBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64BE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64BE0009';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(0xcafebabe))
        console.log(`${TAG} res: ${res}`);
        expect(res.toString()).assertEqual('8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64BE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5510
     * @tc.desc   Test the function of the interface writeBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64BE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64BE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        const res = buf.writeBigInt64BE(BigInt(123.456));
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('The number cannot be converted to a BigInt because it is not an integer');
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64BE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5520
     * @tc.desc   Test the function of the interface writeBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64BE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64BE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        const res = buf.writeBigInt64BE(BigInt(0xdecafafecacefade))
        console.log(`${TAG} res: ${res}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -(2n ** 63n) and <= 2n ** 63n. Received value is: 16053919793946753024');
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64BE0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5530
     * @tc.desc   Test the function of the interface writeBigInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64BE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64BE0012';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        const res = buf.writeBigInt64BE(BigInt(0x0102030405060708n))
        console.log(`${TAG} res: ${res}`);
        expect(res.toString()).assertEqual('8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5540
     * @tc.desc   Test the function of the interface writeBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64LE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0x0102030405060708), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5550
     * @tc.desc   Test the function of the interface writeBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64LE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0x03048), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5560
     * @tc.desc   Test the function of the interface writeBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64LE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0x05060708), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64LE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5570
     * @tc.desc   Test the function of the interface writeBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64LE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0xbeef), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64LE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5580
     * @tc.desc   Test the function of the interface writeBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64LE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64LE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0x4), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64LE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5590
     * @tc.desc   Test the function of the interface writeBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64LE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64LE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0xfeedface), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64LE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5600
     * @tc.desc   Test the function of the interface writeBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64LE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64LE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(-2), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64LE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5610
     * @tc.desc   Test the function of the interface writeBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64LE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64LE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(2), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64LE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5620
     * @tc.desc   Test the function of the interface writeBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64LE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64LE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0xcafebabe), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64LE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5630
     * @tc.desc   Test the function of the interface writeBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64LE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64LE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64LE(BigInt(123.456), 0);

        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('The number cannot be converted to a BigInt because it is not an integer');
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64LE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5640
     * @tc.desc   Test the function of the interface writeBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64LE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64LE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64LE(BigInt(0xdecafafecacefade), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -(2n ** 63n) and <= 2n ** 63n. Received value is: 16053919793946753024');
      }
    })
    /**
     * @tc.name   testBufferWriteBigInt64LE0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5650
     * @tc.desc   Test the function of the interface writeBigInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigInt64LE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigInt64LE0012';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        const result = buf.writeBigInt64LE(BigInt(0x0102030405060708n), 0);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5660
     * @tc.desc   Test the function of the interface writeBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64BE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0x0304), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5670
     * @tc.desc   Test the function of the interface writeBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64BE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0x05060708), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5680
     * @tc.desc   Test the function of the interface writeBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64BE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0xbeef), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64BE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5690
     * @tc.desc   Test the function of the interface writeBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64BE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0x4), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64BE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5700
     * @tc.desc   Test the function of the interface writeBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64BE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0xfeedface), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64BE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5710
     * @tc.desc   Test the function of the interface writeBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64BE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64BE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(BigInt(-2), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 2n ** 64n - 1n. Received value is: -2');
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64BE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5720
     * @tc.desc   Test the function of the interface writeBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64BE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64BE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(2), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64BE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5730
     * @tc.desc   Test the function of the interface writeBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64BE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64BE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0xcafebabe));
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64BE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5740
     * @tc.desc   Test the function of the interface writeBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64BE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64BE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(123.456));
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('The number cannot be converted to a BigInt because it is not an integer');
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64BE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5750
     * @tc.desc   Test the function of the interface writeBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64BE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64BE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0xdecafafecacefade), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64BE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5760
     * @tc.desc   Test the function of the interface writeBigUInt64BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64BE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64BE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(BigInt(0x0102030405060708n), 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5770
     * @tc.desc   Test the function of the interface writeBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64LE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0x0304), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5780
     * @tc.desc   Test the function of the interface writeBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64LE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0x05060708), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5790
     * @tc.desc   Test the function of the interface writeBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64LE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0xbeef), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64LE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5800
     * @tc.desc   Test the function of the interface writeBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64LE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0x4), 0);
        ;
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64L0E005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5810
     * @tc.desc   Test the function of the interface writeBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64L0E005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64LE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0xfeedface), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64L0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5820
     * @tc.desc   Test the function of the interface writeBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64L0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64LE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(BigInt(-2), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 2n ** 64n - 1n. Received value is: -2');
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64LE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5830
     * @tc.desc   Test the function of the interface writeBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64LE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64LE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(2), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64LE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5840
     * @tc.desc   Test the function of the interface writeBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64LE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64LE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0xcafebabe), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64LE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5850
     * @tc.desc   Test the function of the interface writeBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64LE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64LE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(BigInt(123.456), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('The number cannot be converted to a BigInt because it is not an integer');
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64LE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5860
     * @tc.desc   Test the function of the interface writeBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64LE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64LE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0xdecafafe), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64LE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5870
     * @tc.desc   Test the function of the interface writeBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64LE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64LE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0x0102030405060708n), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteBigUInt64LE0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5880
     * @tc.desc   Test the function of the interface writeBigUInt64LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteBigUInt64LE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteBigUInt64LE0012';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(BigInt(0x0102030405060708n), 10);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 10');
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5890
     * @tc.desc   Test the function of the interface writeDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleBE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(0x0304, 0);
        let result = buf.writeDoubleBE(0x0304, 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
        expect(buf.readDoubleBE(0)).assertEqual(0x0304);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5900
     * @tc.desc   Test the function of the interface writeDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleBE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(0x05060708, 0);
        let result = buf.writeDoubleBE(0x05060708, 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleBE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5910
     * @tc.desc   Test the function of the interface writeDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleBE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        const result = buf.writeDoubleBE(0xbeef,);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleBE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5920
     * @tc.desc   Test the function of the interface writeDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleBE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        expect(buf.writeDoubleBE(0x4)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleBE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5930
     * @tc.desc   Test the function of the interface writeDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleBE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleBE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(0xfeedface);
        expect(buf.writeDoubleBE(0xfeedface)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleBE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5940
     * @tc.desc   Test the function of the interface writeDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleBE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleBE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(-2, 10);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 10');
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleBE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5950
     * @tc.desc   Test the function of the interface writeDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleBE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleBE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(2);
        expect(buf.writeDoubleBE(2)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleBE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5960
     * @tc.desc   Test the function of the interface writeDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleBE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleBE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(0xcafebabe, 0);
        expect(buf.writeDoubleBE(0xcafebabe, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleBE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5970
     * @tc.desc   Test the function of the interface writeDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleBE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleBE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        expect(buf.writeDoubleBE(123.456, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleBE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5980
     * @tc.desc   Test the function of the interface writeDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleBE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleBE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(0xdecafafecacefade, 0);
        expect(buf.writeDoubleBE(0xdecafafecacefade, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleBE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_5990
     * @tc.desc   Test the function of the interface writeDoubleBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleBE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleBE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let res = 0x0102030405060708n;
        buf.writeDoubleBE(Number(res), 0);
        expect(buf.writeDoubleBE(Number(res), 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6000
     * @tc.desc   Test the function of the interface writeDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleLE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(0x0304);
        const res = buf.writeDoubleLE(0x0304).toString()
        console.log(`${TAG}result:${res}`);
        expect(buf.writeDoubleLE(0x0304).toString()).assertEqual('8');
        expect(buf.writeDoubleLE(0x0304)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleLE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6010
     * @tc.desc   Test the function of the interface writeDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleLE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(0x05060708, 0);
        expect(buf.writeDoubleLE(0x05060708, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleLE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6020
     * @tc.desc   Test the function of the interface writeDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleLE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(0xbeef, 0);
        expect(buf.writeDoubleLE(0xbeef, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleLE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6030
     * @tc.desc   Test the function of the interface writeDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleLE0004';
      try {
        let buf = buffer.alloc(19)
        buf.writeDoubleLE(0x4, 0);
        const res = buf.writeDoubleLE(0x4, 0).toString()
        console.log(`${TAG}res:${res}`);
        expect(buf.writeDoubleLE(0x4, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleLE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6040
     * @tc.desc   Test the function of the interface writeDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleLE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleLE0005';
      try {
        let buf = buffer.alloc(8);
        buf.writeDoubleLE(0xfeedface, 0);
        expect(buf.writeDoubleLE(0xfeedface, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleLE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6050
     * @tc.desc   Test the function of the interface writeDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleLE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleLE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(-2, 0);
        expect(buf.writeDoubleLE(-2, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleLE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6060
     * @tc.desc   Test the function of the interface writeDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleLE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleLE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(2, 0);
        expect(buf.writeDoubleLE(2, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleLE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6070
     * @tc.desc   Test the function of the interface writeDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleLE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleLE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(0xcafebabe, 0);
        expect(buf.writeDoubleLE(0xcafebabe, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleLE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6080
     * @tc.desc   Test the function of the interface writeDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleLE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleLE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeDoubleLE(123.456, 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleLE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6090
     * @tc.desc   Test the function of the interface writeDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleLE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleLE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(3);
        let result = buf.writeDoubleLE(0xdecafafecacefade, 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual("The value of \"offset\" is out of range. It must be >= 0 and <= -5. Received value is: 0");
      }
    })
    /**
     * @tc.name   testBufferWriteDoubleLE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6100
     * @tc.desc   Test the function of the interface writeDoubleLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteDoubleLE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteDoubleLE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(3);
        let result = buf.writeDoubleLE(Number(0x0102030405060708n), 1);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= -5. Received value is: 1');
      }
    })
    /**
     * @tc.name   testBufferWriteFloatBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6110
     * @tc.desc   Test the function of the interface WriteFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatBE0001';
      try {
        let buf = buffer.alloc(4);
        buf.writeFloatBE(0x0304, 0);
        expect(buf.writeFloatBE(0x0304, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6120
     * @tc.desc   Test the function of the interface WriteFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatBE0002';
      try {
        let buf = buffer.alloc(4);
        buf.writeFloatBE(0x05060708, 0);
        expect(buf.writeFloatBE(0x05060708, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatBE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6130
     * @tc.desc   Test the function of the interface WriteFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatBE0003';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(0xbeef, 0);
        expect(buf.writeFloatBE(0xbeef, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatBE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6140
     * @tc.desc   Test the function of the interface WriteFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatBE0004';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(0x4, 0);
        expect(buf.writeFloatBE(0x4, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatBE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6150
     * @tc.desc   Test the function of the interface WriteFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatBE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatBE0005';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(0xfeedface, 0);
        expect(buf.writeFloatBE(0xfeedface, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatBE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6160
     * @tc.desc   Test the function of the interface WriteFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatBE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatBE0006';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(-2, 0);
        expect(buf.writeFloatBE(-2, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatBE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6170
     * @tc.desc   Test the function of the interface WriteFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatBE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatBE0007';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(2, 0);
        expect(buf.writeFloatBE(2, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatBE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6180
     * @tc.desc   Test the function of the interface WriteFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatBE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatBE0008';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(0xcafebabe, 0);
        expect(buf.writeFloatBE(0xcafebabe, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatBE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6190
     * @tc.desc   Test the function of the interface WriteFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatBE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatBE0009';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(123.456, 0);
        expect(buf.writeFloatBE(123.456, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatBE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6200
     * @tc.desc   Test the function of the interface WriteFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatBE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatBE0010';
      try {
        let buf = buffer.alloc(16);
        buf.writeFloatBE(0xdecafafecacefade, 0);
        expect(buf.writeFloatBE(0xdecafafecacefade, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatBE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6210
     * @tc.desc   Test the function of the interface WriteFloatBE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatBE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatBE0011';
      try {
        let buf = buffer.alloc(16);
        expect(buf.writeFloatBE(Number(0x0102030405060708n), 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6220
     * @tc.desc   Test the function of the interface WriteFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatLE0001';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0x0304, 0);
        expect(buf.writeFloatLE(0x0304, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatLE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6230
     * @tc.desc   Test the function of the interface WriteFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatLE0002';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0x05060708, 0);
        expect(buf.writeFloatLE(0x05060708, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatLE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6240
     * @tc.desc   Test the function of the interface WriteFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatLE0003';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0xbeef, 0);
        expect(buf.writeFloatLE(0xbeef, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatLE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6250
     * @tc.desc   Test the function of the interface WriteFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatLE0004';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0x4, 0);
        expect(buf.writeFloatLE(0x4, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatLE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6260
     * @tc.desc   Test the function of the interface WriteFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatLE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatLE0005';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0xfeedface, 0);
        expect(buf.writeFloatLE(0xfeedface, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatLE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6270
     * @tc.desc   Test the function of the interface WriteFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatLE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatLE0006';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(-2, 0);
        expect(buf.writeFloatLE(-2, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatLE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6280
     * @tc.desc   Test the function of the interface WriteFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatLE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatLE0007';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(2, 0);
        expect(buf.writeFloatLE(2, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatLE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6290
     * @tc.desc   Test the function of the interface WriteFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatLE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatLE0008';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(Number(0x0102030405060708n), 0);
        expect(buf.writeFloatLE(Number(0x0102030405060708n), 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatLE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6300
     * @tc.desc   Test the function of the interface WriteFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatLE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatLE0009';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0xcafebabe, 0);
        expect(buf.writeFloatLE(0xcafebabe, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatLE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6310
     * @tc.desc   Test the function of the interface WriteFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatLE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatLE0010';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(123.456, 0);
        expect(buf.writeFloatLE(123.456, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteFloatLE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6320
     * @tc.desc   Test the function of the interface WriteFloatLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteFloatLE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteFloatLE0011';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0xdecafafecacefade, 0);
        expect(buf.writeFloatLE(0xdecafafecacefade, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt80001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6330
     * @tc.desc   Test the function of the interface WriteInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt80001';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0x0304, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 772');
      }
    })
    /**
     * @tc.name   testBufferWriteInt80002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6340
     * @tc.desc   Test the function of the interface WriteInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt80002';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(-2, 0);
        expect(buf.writeInt8(-2, 0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt80003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6350
     * @tc.desc   Test the function of the interface WriteInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt80003';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(2, 0);
        expect(buf.writeInt8(2, 0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.name   testBufferWriteInt80004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6360
     * @tc.desc   Test the function of the interface WriteInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt80004';
      try {
        let buf = buffer.alloc(5);
        const res = buf.writeInt8(Number(0x0102030405060708n), 0);
        console.log(`${TAG}res:$${res}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 72623859790382850');
      }
    })
    /**
     * @tc.name   testBufferWriteInt80005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6370
     * @tc.desc   Test the function of the interface WriteInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt80005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt80005';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0xcafebabe, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 3405691582');
      }
    })
    /**
     * @tc.name   testBufferWriteInt80006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6380
     * @tc.desc   Test the function of the interface WriteInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt80006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt80006';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(123.456, 0);
        expect(buf.writeInt8(123.456, 0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt80007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6390
     * @tc.desc   Test the function of the interface WriteInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt80007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt80007';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 16053919793946753000');
      }
    })
    /**
     * @tc.name   testBufferWriteInt80008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6400
     * @tc.desc   Test the function of the interface WriteInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt80008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt80008';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0x05060708, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 84281096');
      }
    })
    /**
     * @tc.name   testBufferWriteInt80009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6410
     * @tc.desc   Test the function of the interface WriteInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt80009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt80009';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0xbeef, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 48879');
      }
    })
    /**
     * @tc.name   testBufferWriteInt80010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6420
     * @tc.desc   Test the function of the interface WriteInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt80010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt80010';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0x4, 0);
        expect(buf.writeInt8(0x4, 0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt80011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6430
     * @tc.desc   Test the function of the interface WriteInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt80011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt80011';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0xfeedface, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 4277009102');
      }
    })
    /**
     * @tc.name   testBufferWriteInt16BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6440
     * @tc.desc   Test the function of the interface WriteInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16BE0001';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0x0304, 0);
        expect(buf.writeInt16BE(0x0304, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt16BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6450
     * @tc.desc   Test the function of the interface WriteInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16BE0002';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0x05060708, 0);
        expect(buf.writeInt16BE(0x05060708, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.name   testBufferWriteInt16BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6460
     * @tc.desc   Test the function of the interface WriteInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16BE0003';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0xbeef, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 48879');
      }
    })
    /**
     * @tc.name   testBufferWriteInt16BE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6470
     * @tc.desc   Test the function of the interface WriteInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16BE0004';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0x4, 0);
        expect(buf.writeInt16BE(0x4, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt16BE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6480
     * @tc.desc   Test the function of the interface WriteInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16BE0005';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0xfeedface, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 4277009102');
      }
    })
    /**
     * @tc.name   testBufferWriteInt16BE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6490
     * @tc.desc   Test the function of the interface WriteInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16BE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16BE0006';
      try {
        let buf = buffer.alloc(5);
        expect(buf.writeInt16BE(-2, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt16BE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6500
     * @tc.desc   Test the function of the interface WriteInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16BE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16BE0007';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(2, 0);
        expect(buf.writeInt16BE(2, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt16BE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6510
     * @tc.desc   Test the function of the interface WriteInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16BE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16BE0008';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0xcafebabe, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 3405691582');
      }
    })
    /**
     * @tc.name   testBufferWriteInt16BE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6520
     * @tc.desc   Test the function of the interface WriteInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16BE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16BE0009';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(123.456, 0);
        expect(buf.writeInt16BE(123.456, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt16BE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6530
     * @tc.desc   Test the function of the interface WriteInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16BE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16BE0010';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 16053919793946753000');
      }
    })
    /**
     * @tc.name   testBufferWriteInt16BE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6540
     * @tc.desc   Test the function of the interface WriteInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16BE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16BE0011';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 72623859790382850');
      }
    })
    /**
     * @tc.name   testBufferWriteInt16LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6550
     * @tc.desc   Test the function of the interface WriteInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt160001';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0x0304, 0);
        expect(buf.writeInt16LE(0x0304, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt16LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6560
     * @tc.desc   Test the function of the interface WriteInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16LE0002';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0x05060708, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 84281096');
      }
    })
    /**
     * @tc.name   testBufferWriteInt16LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6570
     * @tc.desc   Test the function of the interface WriteInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16LE0003';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0xbeef, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 48879');
      }
    })
    /**
     * @tc.name   testBufferWriteInt16LE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6580
     * @tc.desc   Test the function of the interface WriteInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16LE0004';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0x4, 0);
        expect(buf.writeInt16LE(0x4, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt16LE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6590
     * @tc.desc   Test the function of the interface WriteInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16LE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16LE0005';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0xfeedface, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 4277009102');
      }
    })
    /**
     * @tc.name   testBufferWriteInt16LE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6600
     * @tc.desc   Test the function of the interface WriteInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16LE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16LE0006';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(-2, 0);
        expect(buf.writeInt16LE(-2, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt16LE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6610
     * @tc.desc   Test the function of the interface WriteInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16LE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16LE0007';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(2, 0);
        expect(buf.writeInt16LE(2, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt16LE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6620
     * @tc.desc   Test the function of the interface WriteInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16LE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16LE0008';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0xcafebabe, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 3405691582');
      }
    })
    /**
     * @tc.name   testBufferWriteInt16LE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6630
     * @tc.desc   Test the function of the interface WriteInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16LE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16LE0009';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(123.456, 0);
        expect(buf.writeInt16LE(123.456, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt16LE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6640
     * @tc.desc   Test the function of the interface WriteInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16LE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16LE0010';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 16053919793946753000');
      }
    })
    /**
     * @tc.name   testBufferWriteInt16LE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6650
     * @tc.desc   Test the function of the interface WriteInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt16LE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt16LE0011';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 72623859790382850');
      }
    })
    /**
     * @tc.name   testBufferWriteInt32BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6660
     * @tc.desc   Test the function of the interface writeInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32BE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0x01020304, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6670
     * @tc.desc   Test the function of the interface writeInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32BE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0x0304, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6680
     * @tc.desc   Test the function of the interface writeInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32BE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0x05060708, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32BE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6690
     * @tc.desc   Test the function of the interface writeInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32BE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0xbeef, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32BE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6700
     * @tc.desc   Test the function of the interface writeInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32BE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0x4, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32BE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6710
     * @tc.desc   Test the function of the interface writeInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32BE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32BE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0xfeedface, 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 4277009102');
      }
    })
    /**
     * @tc.name   testBufferWriteInt32BE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6720
     * @tc.desc   Test the function of the interface writeInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32BE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32BE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(-2, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32BE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6730
     * @tc.desc   Test the function of the interface writeInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32BE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32BE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(2, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32BE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6740
     * @tc.desc   Test the function of the interface writeInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32BE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32BE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0xcafebabe, 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 3405691582');
      }
    })
    /**
     * @tc.name   testBufferWriteInt32BE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6750
     * @tc.desc   Test the function of the interface writeInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32BE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32BE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(123.456, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32BE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6760
     * @tc.desc   Test the function of the interface writeInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32BE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32BE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0xdecafafecacefade, 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 16053919793946753000');
      }
    })
    /**
     * @tc.name   testBufferWriteInt32BE0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6770
     * @tc.desc   Test the function of the interface writeInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32BE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32BE0012';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(Number(0x0102030405060708n), 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message);
      }
    })
    /**
     * @tc.name   testBufferWriteInt32LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6780
     * @tc.desc   Test the function of the interface writeInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32LE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(0x0304, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6790
     * @tc.desc   Test the function of the interface writeInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32LE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(0x050607084, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6800
     * @tc.desc   Test the function of the interface writeInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32LE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(0xbeef, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32LE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6810
     * @tc.desc   Test the function of the interface writeInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32LE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(0x4, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32LE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6820
     * @tc.desc   Test the function of the interface writeInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32LE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32LE0005';
      try {

        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(0xfeedface, 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 4277009102');
      }
    })
    /**
     * @tc.name   testBufferWriteInt32LE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6830
     * @tc.desc   Test the function of the interface writeInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32LE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32LE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(-2, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32LE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6840
     * @tc.desc   Test the function of the interface writeInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32LE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32LE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(2, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32LE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6850
     * @tc.desc   Test the function of the interface writeInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32LE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32LE0008';
      try {

        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeInt32LE(0xcafebabe, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 3405691582');
      }
    })
    /**
     * @tc.name   testBufferWriteInt32LE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6860
     * @tc.desc   Test the function of the interface writeInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32LE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32LE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(123.456, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteInt32LE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6870
     * @tc.desc   Test the function of the interface writeInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32LE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32LE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeInt32LE(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 16053919793946753000')

      }
    })
    /**
     * @tc.name   testBufferWriteInt32LE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6880
     * @tc.desc   Test the function of the interface writeInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteInt32LE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteInt32LE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeInt32LE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 72623859790382850');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt80001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6890
     * @tc.desc   Test the function of the interface writeUInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt80001';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(0x3, 0);
        console.info("result = " + result);
        expect(result).assertEqual(1);
        let result1 = buf.writeUInt8(0x4, 1);
        console.info("result1 = " + result1);
        expect(result1).assertEqual(2);
        let result2 = buf.writeUInt8(0x23, 2);
        console.info("result2 = " + result2);
        expect(result2).assertEqual(3);
        let result3 = buf.writeUInt8(0x42, 3);
        console.info("result3 = " + result3);
        expect(result3).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt80002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6900
     * @tc.desc   Test the function of the interface writeUInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt80002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(0x0304, 1);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 772');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt80003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6910
     * @tc.desc   Test the function of the interface writeUInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt80003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(0x05060708, 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 84281096');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt80004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6920
     * @tc.desc   Test the function of the interface writeUInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt80004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(0xbeef, 1);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 48879');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt80005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6930
     * @tc.desc   Test the function of the interface writeUInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt80005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt80005';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(0x4f, 2);
        console.info("result = " + result);
        console.log(`${TAG}reslut:${result}`);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt80006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6940
     * @tc.desc   Test the function of the interface writeUInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt80006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt80006';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0xfeedface, 3);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 4277009102');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt80007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6950
     * @tc.desc   Test the function of the interface writeUInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt80007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt80007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(-2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: -2')

      }
    })
    /**
     * @tc.name   testBufferWriteUInt80008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6960
     * @tc.desc   Test the function of the interface writeUInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt80008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt80008';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0xcafebabe, 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 3405691582')

      }
    })
    /**
     * @tc.name   testBufferWriteUInt80009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6970
     * @tc.desc   Test the function of the interface writeUInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt80009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt80009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(123.456, 0);
        let result1 = buf.writeUInt8(123.456, 1);
        console.log(`${TAG}reslut:${result}`)
        console.log(`${TAG}reslut1:${result1}`);
        expect(result).assertEqual(1);
        expect(result1).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt80010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6980
     * @tc.desc   Test the function of the interface writeUInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt80010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt80010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0xdecafafecacefade, 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 16053919793946753000');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt80011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_6990
     * @tc.desc   Test the function of the interface writeUInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt80011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt80011';
      try {

        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(Number(0x0102030405060708n), 2);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 72623859790382850');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt80012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7000
     * @tc.desc   Test the function of the interface writeUInt8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt80012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt80012';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(2, 3);
        console.log(`${TAG} reslut:${result}`);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7010
     * @tc.desc   Test the function of the interface writeUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16BE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt16BE(0xdead, 0);
        console.info("result = " + result);
        expect(result).assertEqual(2);
        let result1 = buf.writeUInt16BE(0xbeef, 2);
        console.info("result1 = " + result1);
        expect(result1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7020
     * @tc.desc   Test the function of the interface writeUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16BE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        const res = buf.writeUInt16BE(0x0304, 0);
        console.log(`${TAG}+reslut:+${res}`);
        expect(buf.writeUInt16BE(0x0304, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBufferWriteUInt16BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7030
     * @tc.desc   Test the function of the interface writeUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16BE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x05060708, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 84281096');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16BE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7040
     * @tc.desc   Test the function of the interface writeUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16BE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        const res = buf.writeUInt16BE(0xbeef, 0);
        console.log(`${TAG} reslut:${res}`);
        expect(buf.writeUInt16BE(0xbeef, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16BE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7050
     * @tc.desc   Test the function of the interface writeUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16BE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        const res = buf.writeUInt16BE(0x4, 0);
        console.log(`${TAG} reslut:${res}`);
        expect(buf.writeUInt16BE(0x4, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16BE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7060
     * @tc.desc   Test the function of the interface writeUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16BE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16BE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0xfeedface, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 4277009102');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16BE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7070
     * @tc.desc   Test the function of the interface writeUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16BE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16BE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(-2, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: -2');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16BE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7080
     * @tc.desc   Test the function of the interface writeUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16BE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16BE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        const res = buf.writeUInt16BE(2, 0);
        console.log(`${TAG} res = ${res}`);
        expect(res).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16BE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7090
     * @tc.desc   Test the function of the interface writeUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16BE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16BE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0xcafebabe, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 3405691582');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16BE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7100
     * @tc.desc   Test the function of the interface writeUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16BE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16BE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        const result = buf.writeUInt16BE(123.456, 0);
        const result1 = buf.readUInt16BE(0)
        console.log(`${TAG} result: ${result}`)
        console.log(`${TAG} result1: ${result1}`);
        expect(buf.readUInt16BE(0)).assertEqual(123);
        expect(buf.writeUInt16BE(123.456, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBufferWriteUInt16BE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7110
     * @tc.desc   Test the function of the interface writeUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16BE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16BE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0xdeadbeef, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 3735928559');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16BE0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7120
     * @tc.desc   Test the function of the interface writeUInt16BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16BE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16BE0012';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 72623859790382850')

      }
    })
    /**
     * @tc.name   testBufferWriteUInt16LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7130
     * @tc.desc   Test the function of the interface writeUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16LE0001';
      try {

        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x0304, 0);
        expect(buf.writeUInt16LE(0x0304, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7140
     * @tc.desc   Test the function of the interface writeUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16LE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x05060708, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 84281096')

      }
    })
    /**
     * @tc.name   testBufferWriteUInt16LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7150
     * @tc.desc   Test the function of the interface writeUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16LE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0xbeef, 0);
        expect(buf.writeUInt16LE(0xbeef, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16LE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7160
     * @tc.desc   Test the function of the interface writeUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16LE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x4, 0);
        expect(buf.writeUInt16LE(0x4, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16LE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7170
     * @tc.desc   Test the function of the interface writeUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16LE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16LE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0xfeedface, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 4277009102')

      }
    })

    /**
     * @tc.name   testBufferWriteUInt16LE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7180
     * @tc.desc   Test the function of the interface writeUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16LE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16LE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(-2, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: -2');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16LE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7190
     * @tc.desc   Test the function of the interface writeUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16LE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16LE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(2, 0);
        expect(buf.writeUInt16LE(2, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16LE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7200
     * @tc.desc   Test the function of the interface writeUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16LE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16LE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0xcafebabe, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 3405691582');
      }
    })

    /**
     * @tc.name   testBufferWriteUInt16LE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7210
     * @tc.desc   Test the function of the interface writeUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16LE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16LE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(123.456, 0);
        expect(buf.writeUInt16LE(123.456, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16LE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7220
     * @tc.desc   Test the function of the interface writeUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16LE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16LE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 16053919793946753000');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt16LE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7230
     * @tc.desc   Test the function of the interface writeUInt16LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt16LE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt16LE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 72623859790382850');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt32BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7240
     * @tc.desc   Test the function of the interface writeUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32BE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x0304, 0);
        expect(buf.writeUInt32BE(0x0304, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt32BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7250
     * @tc.desc   Test the function of the interface writeUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32BE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x05060708, 0);
        expect(buf.writeUInt32BE(0x05060708, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt32BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7260
     * @tc.desc   Test the function of the interface writeUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32BE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0xbeef, 0);
        expect(buf.writeUInt32BE(0xbeef, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBufferWriteUInt32BE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7270
     * @tc.desc   Test the function of the interface writeUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32BE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x4, 0);
        expect(buf.writeUInt32BE(0x4, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBufferWriteUInt32BE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7280
     * @tc.desc   Test the function of the interface writeUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32BE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0xfeedface, 0);
        expect(buf.writeUInt32BE(0xfeedface, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBufferWriteUInt32BE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7290
     * @tc.desc   Test the function of the interface writeUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32BE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32BE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(-2, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 4294967295. Received value is: -2');
      }
    })

    /**
     * @tc.name   testBufferWriteUInt32BE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7300
     * @tc.desc   Test the function of the interface writeUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32BE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32BE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(2, 0);
        expect(buf.writeUInt32BE(2, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBufferWriteUInt32BE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7310
     * @tc.desc   Test the function of the interface writeUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32BE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32BE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0xcafebabe, 0);
        expect(buf.writeUInt32BE(0xcafebabe, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBufferWriteUInt32BE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7320
     * @tc.desc   Test the function of the interface writeUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32BE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32BE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(123.456, 0);
        expect(buf.writeUInt32BE(123.456, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt32BE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7330
     * @tc.desc   Test the function of the interface writeUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32BE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32BE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0xdecafafecacefade, 0);
        expect(buf.writeUInt32BE(0xdecafafecacefade, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })

    /**
     * @tc.name   testBufferWriteUInt32BE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7340
     * @tc.desc   Test the function of the interface writeUInt32BE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32BE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32BE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 4294967295. Received value is: 72623859790382850');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt32LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7350
     * @tc.desc   Test the function of the interface writeUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32LE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x0304, 0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt32LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7360
     * @tc.desc   Test the function of the interface writeUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32LE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x05060708, 0);
        expect(buf.writeUInt32LE(0x05060708, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBufferWriteUInt32LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7370
     * @tc.desc   Test the function of the interface writeUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32LE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0xbeef, 0);
        expect(buf.writeUInt32LE(0xbeef, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBufferWriteUInt32LE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7380
     * @tc.desc   Test the function of the interface writeUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32LE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x4, 0);
        expect(buf.writeUInt32LE(0x4, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBufferWriteUInt32LE0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7390
     * @tc.desc   Test the function of the interface writeUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32LE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32LE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0xfeedface, 0);
        expect(buf.writeUInt32LE(0xfeedface, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt32LE0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7400
     * @tc.desc   Test the function of the interface writeUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32LE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32LE0006';
      try {

        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(-2, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 4294967295. Received value is: -2')

      }
    })
    /**
     * @tc.name   testBufferWriteUInt32LE0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7410
     * @tc.desc   Test the function of the interface writeUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32LE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32LE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(2, 0);
        expect(buf.writeUInt32LE(2, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt32LE0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7420
     * @tc.desc   Test the function of the interface writeUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32LE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32LE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0xcafebabe, 0);
        expect(buf.writeUInt32LE(0xcafebabe, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt32LE0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7430
     * @tc.desc   Test the function of the interface writeUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32LE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32LE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(123.456, 0);
        expect(buf.writeUInt32LE(123.456, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferWriteUInt32LE0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7440
     * @tc.desc   Test the function of the interface writeUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32LE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32LE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 4294967295. Received value is: 16053919793946753000');
      }
    })
    /**
     * @tc.name   testBufferWriteUInt32LE0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7450
     * @tc.desc   Test the function of the interface writeUInt32LE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferWriteUInt32LE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferWriteUInt32LE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 4294967295. Received value is: 72623859790382850');
      }
    })
    /**
     * @tc.name   testBufferSlice0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7460
     * @tc.desc   Test the function of the interface slice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSlice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testBufferSlice0001';
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c']);
        let newBlob = blob.slice();
        expect(newBlob instanceof buffer.Blob).assertTrue();
        expect(newBlob.size).assertEqual(3);
        expect(newBlob.type).assertEqual('');
        const content = await newBlob.text();
        console.log(`${TAG} content: ${content}`);
        expect(content).assertEqual('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSlice0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7470
     * @tc.desc   Test the function of the interface slice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSlice0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testBufferSlice0002';
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c']);
        let newBlob = blob.slice(undefined);
        expect(newBlob instanceof buffer.Blob).assertTrue();
        expect(newBlob.size).assertEqual(3);
        expect(newBlob.type).assertEqual('');
        const content = await newBlob.text();
        console.log(`${TAG} content: ${content}`);
        expect(content).assertEqual('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSlice0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7480
     * @tc.desc   Test the function of the interface slice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSlice0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testBufferSlice0003';
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c', 'd']);
        const newBlob = blob.slice(undefined, undefined);
        expect(newBlob.size).assertEqual(4);
        expect(newBlob.type).assertEqual('');
        const content = await newBlob.text();
        console.log(`${TAG} content: ${content}`);
        expect(content).assertEqual('abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSlice0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7490
     * @tc.desc   Test the function of the interface slice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSlice0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testBufferSlice0004';
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c', 'd', 'e']);
        const newBlob = blob.slice(0, 2, 'MIME');
        const res1 = newBlob.size
        console.log(`${TAG} res1: ${res1}`)
        const res2 = newBlob.type
        console.log(`${TAG} res2: ${res2}`);
        expect(newBlob.size).assertEqual(5);
        expect(newBlob.type).assertEqual('MIME');
        const content = await newBlob.text();
        console.log(`${TAG} content: ${content}`);
        expect(content).assertEqual('ab');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSlice0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7500
     * @tc.desc   Test the function of the interface slice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSlice0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testBufferSlice0005';
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c', 'd', 'e']);
        const newBlob = blob.slice(1, 4);
        console.log(`${TAG} newBlob: ${newBlob}`)
        const res1 = newBlob.size
        console.log(`${TAG} res1: ${res1}`)
        const res2 = newBlob.type
        console.log(`${TAG} res2: ${res2}`);
        expect(newBlob.size).assertEqual(5);
        const content = await newBlob.text();
        console.log(`${TAG} content: ${content}`);
        expect(content).assertEqual('bcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSlice0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7510
     * @tc.desc   Test the function of the interface slice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSlice0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testBufferSlice0006';
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c', 'd', 'e']);
        const newBlob = blob.slice(1, 4, 'MIME');
        expect(newBlob.size).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferSlice0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUFFER2_7520
     * @tc.desc   Test the function of the interface slice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferSlice0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testBufferSlice0007';
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c', 'd', 'e']);
        const newBlob = blob.slice(undefined, undefined, 'MIME');
        expect(newBlob.size).assertEqual(5);
        expect(newBlob.type).assertEqual('MIME');
        const content = await newBlob.text();
        console.log(`${TAG} content: ${content}`);
        expect(content).assertEqual('abcde');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  });
}
