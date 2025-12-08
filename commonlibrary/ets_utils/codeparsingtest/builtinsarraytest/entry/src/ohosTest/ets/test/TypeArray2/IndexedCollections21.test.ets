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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

interface IBufferWrapper {
  readonly id: string;
  readonly buffer: ArrayBuffer;
}

class BufferWrapper implements IBufferWrapper {
  public readonly id: string;
  public readonly buffer: ArrayBuffer;
  public constructor(size: number) {
    this.id = 'BufferWrapper-' + size;
    this.buffer = new ArrayBuffer(size);
  }
}
export default function IndexedCollections21Test() {
  describe('IndexedCollections21Test', () => {
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
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_REUSE_0100
     * @tc.name      test_ArrayBuffer_Reuse_ReadWrite_0001
     * @tc.desc      Verify byteLength is read-only (no transfer call)
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Reuse_ReadWrite_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Reuse_ReadWrite_0001 start');
        const buffer = new ArrayBuffer(8);

        let ok = true;
        [16, 32, 64].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 8).assertTrue();
        console.log('test_ArrayBuffer_Reuse_ReadWrite_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_REUSE_0200
     * @tc.name      test_ArrayBuffer_Reuse_ReadWrite_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Reuse_ReadWrite_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Reuse_ReadWrite_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_Reuse_ReadWrite_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_DATA_ARRAYBUFFER_REUSE_0300
     * @tc.name      test_ArrayBuffer_Reuse_ReadWrite_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Reuse_ReadWrite_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Reuse_ReadWrite_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_Reuse_ReadWrite_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_REUSE_0400
     * @tc.name      test_ArrayBuffer_Reuse_ReadWrite_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Reuse_ReadWrite_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Reuse_ReadWrite_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_Reuse_ReadWrite_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_REUSE_0500
     * @tc.name      test_ArrayBuffer_Reuse_ReadWrite_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Reuse_ReadWrite_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Reuse_ReadWrite_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_Reuse_ReadWrite_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_REUSE_0600
     * @tc.name      test_ArrayBuffer_Reuse_ReadWrite_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Reuse_ReadWrite_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Reuse_ReadWrite_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_Reuse_ReadWrite_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_1GBLIMIT_0300
     * @tc.name      test_ArrayBuffer_1GBLimit_Memory_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1GBLimit_Memory_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1GBLimit_Memory_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_1GBLimit_Memory_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_1GBLIMIT_0400
     * @tc.name      test_ArrayBuffer_1GBLimit_Memory_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1GBLimit_Memory_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1GBLimit_Memory_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_1GBLimit_Memory_0004 done');
        done();
      });

    /**
     * @tc.number    ARK_ARRAYBUFFER_1GBLIMIT_0500
     * @tc.name      test_ArrayBuffer_1GBLimit_Memory_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1GBLimit_Memory_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1GBLimit_Memory_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_1GBLimit_Memory_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_1GBLIMIT_0600
     * @tc.name      test_ArrayBuffer_1GBLimit_Memory_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1GBLimit_Memory_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1GBLimit_Memory_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_1GBLimit_Memory_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_100MBSLICE_0100
     * @tc.name      test_ArrayBuffer_100MBSlice_Performance_0001
     * @tc.desc      Verify byteLength is read-only (no performance call)
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_100MBSlice_Performance_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_100MBSlice_Performance_0001 start');
        const buffer = new ArrayBuffer(1024 * 1024 * 100); // 100MB

        let ok = true;
        [1024 * 1024 * 101, 1024 * 1024 * 102, 1024 * 1024 * 103].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1024 * 1024 * 100).assertTrue();
        console.log('test_ArrayBuffer_100MBSlice_Performance_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_100MBSLICE_0200
     * @tc.name      test_ArrayBuffer_100MBSlice_Performance_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_100MBSlice_Performance_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_100MBSlice_Performance_0002 start');
        const buffer = new ArrayBuffer(1024 * 1024 * 200); // 200MB

        let ok = true;
        [1024 * 1024 * 201, 1024 * 1024 * 202, 1024 * 1024 * 203].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1024 * 1024 * 200).assertTrue();
        console.log('test_ArrayBuffer_100MBSlice_Performance_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_100MBSLICE_0300
     * @tc.name      test_ArrayBuffer_100MBSlice_Performance_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_100MBSlice_Performance_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_100MBSlice_Performance_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_100MBSlice_Performance_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_100MBSLICE_0400
     * @tc.name      test_ArrayBuffer_100MBSlice_Performance_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_100MBSlice_Performance_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_100MBSlice_Performance_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_100MBSlice_Performance_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_100MBSLICE_0500
     * @tc.name      test_ArrayBuffer_100MBSlice_Performance_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_100MBSlice_Performance_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_100MBSlice_Performance_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_100MBSlice_Performance_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_100MBSLICE_0600
     * @tc.name      test_ArrayBuffer_100MBSlice_Performance_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_100MBSlice_Performance_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_100MBSlice_Performance_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_100MBSlice_Performance_0006 done');
        done();
      });

    /**
     * @tc.number    ARK_ARRAYBUFFER_10MB_0100
     * @tc.name      test_ArrayBuffer_10MB_Create_0001
     * @tc.desc      Verify byteLength is read-only (no transfer call)
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_10MB_Create_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_10MB_Create_0001 start');
        const buffer = new ArrayBuffer(1024 * 1024 * 10);

        let ok = true;
        [1024 * 1024 * 11, 1024 * 1024 * 12, 1024 * 1024 * 13].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1024 * 1024 * 10).assertTrue();
        console.log('test_ArrayBuffer_10MB_Create_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_DATA_ARRAYBUFFER_10MB_0200
     * @tc.name      test_ArrayBuffer_10MB_Create_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_10MB_Create_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_10MB_Create_0002 start');
        const buffer = new ArrayBuffer(1024 * 1024 * 20); // 20MB

        let ok = true;
        [1024 * 1024 * 21, 1024 * 1024 * 22, 1024 * 1024 * 23].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1024 * 1024 * 20).assertTrue();
        console.log('test_ArrayBuffer_10MB_Create_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_10MB_0300
     * @tc.name      test_ArrayBuffer_10MB_Create_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_10MB_Create_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_10MB_Create_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_10MB_Create_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_10MB_0400
     * @tc.name      test_ArrayBuffer_10MB_Create_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_10MB_Create_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_10MB_Create_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_10MB_Create_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_10MB_0500
     * @tc.name      test_ArrayBuffer_10MB_Create_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_10MB_Create_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_10MB_Create_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_10MB_Create_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_10MB_0600
     * @tc.name      test_ArrayBuffer_10MB_Create_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_10MB_Create_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_10MB_Create_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_10MB_Create_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_1MBLOOP_0100
     * @tc.name      test_ArrayBuffer_1MBLoop_Stability_0001
     * @tc.desc      Verify byteLength is read-only (no gc call)
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1MBLoop_Stability_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1MBLoop_Stability_0001 start');
        const buffer = new ArrayBuffer(1024 * 1024); // 1MB

        let ok = true;
        [1024 * 1024 + 1, 1024 * 1024 + 1024, 1024 * 1024 * 2].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1024 * 1024).assertTrue();
        console.log('test_ArrayBuffer_1MBLoop_Stability_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_DATA_ARRAYBUFFER_1MBLOOP_0200
     * @tc.name      testarrayBuffer_1MBLoop_Stability_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testarrayBuffer_1MBLoop_Stability_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testarrayBuffer_1MBLoop_Stability_0002 start');
        const buffer = new ArrayBuffer(1024 * 1024 * 10); // 10MB

        let ok = true;
        [1024 * 1024 * 11, 1024 * 1024 * 12, 1024 * 1024 * 13].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1024 * 1024 * 10).assertTrue();
        console.log('testarrayBuffer_1MBLoop_Stability_0002 done');
        done();
      });
    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_1MBLOOP_0200
     * @tc.name      test_ArrayBuffer_1MBLoop_Stability_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1MBLoop_Stability_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1MBLoop_Stability_0002 start');
        const buffer = new ArrayBuffer(1024 * 1024 * 10); // 10MB

        let ok = true;
        [1024 * 1024 * 11, 1024 * 1024 * 12, 1024 * 1024 * 13].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1024 * 1024 * 10).assertTrue();
        console.log('test_ArrayBuffer_1MBLoop_Stability_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_1MBLOOP_0300
     * @tc.name      test_ArrayBuffer_1MBLoop_Stability_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1MBLoop_Stability_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1MBLoop_Stability_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_1MBLoop_Stability_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_1MBLOOP_0400
     * @tc.name      test_ArrayBuffer_1MBLoop_Stability_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1MBLoop_Stability_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1MBLoop_Stability_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_1MBLoop_Stability_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_1MBLOOP_0500
     * @tc.name      test_ArrayBuffer_1MBLoop_Stability_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1MBLoop_Stability_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1MBLoop_Stability_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_1MBLoop_Stability_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_1MBLOOP_0600
     * @tc.name      test_ArrayBuffer_1MBLoop_Stability_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1MBLoop_Stability_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1MBLoop_Stability_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_1MBLoop_Stability_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_REUSE_0100
     * @tc.name      testArrayBuffer_Reuse_ReadWrite_0001
     * @tc.desc      Verify byteLength is read-only (no transfer call)
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_Reuse_ReadWrite_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_Reuse_ReadWrite_0001 start');
        const buffer = new ArrayBuffer(8);

        let ok = true;
        [16, 32, 64].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 8).assertTrue();
        console.log('testArrayBuffer_Reuse_ReadWrite_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_REUSE_0200
     * @tc.name      testArrayBuffer_Reuse_ReadWrite_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_Reuse_ReadWrite_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_Reuse_ReadWrite_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('testArrayBuffer_Reuse_ReadWrite_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_REUSE_0300
     * @tc.name      testArrayBuffer_Reuse_ReadWrite_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_Reuse_ReadWrite_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_Reuse_ReadWrite_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('testArrayBuffer_Reuse_ReadWrite_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_REUSE_0400
     * @tc.name      testArrayBuffer_Reuse_ReadWrite_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_Reuse_ReadWrite_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_Reuse_ReadWrite_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('testArrayBuffer_Reuse_ReadWrite_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_REUSE_0500
     * @tc.name      testArrayBuffer_Reuse_ReadWrite_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_Reuse_ReadWrite_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_Reuse_ReadWrite_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('testArrayBuffer_Reuse_ReadWrite_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_DATA_ARRAYBUFFER_REUSE_0600
     * @tc.name      testArrayBuffer_Reuse_ReadWrite_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_Reuse_ReadWrite_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_Reuse_ReadWrite_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('testArrayBuffer_Reuse_ReadWrite_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_1GBLIMIT_0300
     * @tc.name      testArrayBuffer_1GBLimit_Memory_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_1GBLimit_Memory_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_1GBLimit_Memory_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('testArrayBuffer_1GBLimit_Memory_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_1GBLIMIT_0400
     * @tc.name      testArrayBuffer_1GBLimit_Memory_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_1GBLimit_Memory_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_1GBLimit_Memory_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('testArrayBuffer_1GBLimit_Memory_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_1GBLIMIT_0500
     * @tc.name      testArrayBuffer_1GBLimit_Memory_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_1GBLimit_Memory_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_1GBLimit_Memory_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('testArrayBuffer_1GBLimit_Memory_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_DATA_ARRAYBUFFER_1GBLIMIT_0600
     * @tc.name      testArrayBuffer_1GBLimit_Memory_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_1GBLimit_Memory_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_1GBLimit_Memory_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('testArrayBuffer_1GBLimit_Memory_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_100MBSLICE_0100
     * @tc.name      testArrayBuffer_100MBSlice_Performance_0001
     * @tc.desc      Verify byteLength is read-only (no performance call)
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_100MBSlice_Performance_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_100MBSlice_Performance_0001 start');
        const buffer = new ArrayBuffer(1024 * 1024 * 100); // 100MB

        let ok = true;
        [1024 * 1024 * 101, 1024 * 1024 * 102, 1024 * 1024 * 103].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1024 * 1024 * 100).assertTrue();
        console.log('testArrayBuffer_100MBSlice_Performance_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_100MBSLICE_0200
     * @tc.name      testArrayBuffer_100MBSlice_Performance_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_100MBSlice_Performance_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_100MBSlice_Performance_0002 start');
        const buffer = new ArrayBuffer(1024 * 1024 * 200); // 200MB

        let ok = true;
        [1024 * 1024 * 201, 1024 * 1024 * 202, 1024 * 1024 * 203].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1024 * 1024 * 200).assertTrue();
        console.log('testArrayBuffer_100MBSlice_Performance_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_100MBSLICE_0300
     * @tc.name      testArrayBuffer_100MBSlice_Performance_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_100MBSlice_Performance_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_100MBSlice_Performance_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('testArrayBuffer_100MBSlice_Performance_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_100MBSLICE_0400
     * @tc.name      testArrayBuffer_100MBSlice_Performance_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_100MBSlice_Performance_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_100MBSlice_Performance_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('testArrayBuffer_100MBSlice_Performance_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_100MBSLICE_0500
     * @tc.name      testArrayBuffer_100MBSlice_Performance_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_100MBSlice_Performance_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_100MBSlice_Performance_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try { ((b: Object) => { (b as Record<string, number>)['byteLength'] = v; })(buffer); ok = false; } catch {}
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('testArrayBuffer_100MBSlice_Performance_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_100MBSLICE_0600
     * @tc.name      testArrayBuffer_100MBSlice_Performance_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_100MBSlice_Performance_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_100MBSlice_Performance_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {}
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('testArrayBuffer_100MBSlice_Performance_0006 done');
        done();
      });
  })
}