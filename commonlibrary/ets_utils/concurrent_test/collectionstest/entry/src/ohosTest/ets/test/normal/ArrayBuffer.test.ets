
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections, taskpool } from '@kit.ArkTS';

declare class ArkTools {
  static forceFullGC(): void
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, ms));
}

@Concurrent
function crossThreadCreateArrayBuffer(len: number): number {
  let buf = new collections.ArrayBuffer(len);
  return buf.byteLength;
}

@Concurrent
function crossThreadSliceArrayBuffer(buf: collections.ArrayBuffer, begin: number, end: number): number {
  let sliced = buf.slice(begin, end);
  return sliced.byteLength;
}

@Concurrent
function crossThreadReadByteLength(buf: collections.ArrayBuffer): number {
  return buf.byteLength;
}

@Concurrent
function crossThreadReturnArrayBuffer(len: number): collections.ArrayBuffer {
  let buf = new collections.ArrayBuffer(len);
  return buf;
}

@Concurrent
function concurrentSliceOps(buf: collections.ArrayBuffer, iterations: number): number {
  let successCount = 0;
  for (let i = 0; i < iterations; i++) {
    try {
      let sliced = buf.slice(0, 2);
      if (sliced.byteLength === 2) {
        successCount++;
      }
    } catch (e) {
    }
  }
  return successCount;
}

@Concurrent
function taskPoolAllArrayBufferApisTest(): boolean {
  try {
    let buf = new collections.ArrayBuffer(10);
    if (buf.byteLength !== 10) return false;
    let sliced1 = buf.slice(0, 4);
    if (sliced1.byteLength !== 4) return false;
    let sliced2 = buf.slice(2);
    if (sliced2.byteLength !== 8) return false;
    let sliced3 = buf.slice(-1);
    if (sliced3.byteLength !== 1) return false;
    let sliced4 = buf.slice(0, -3);
    if (sliced4.byteLength !== 7) return false;
    let emptyBuf = new collections.ArrayBuffer(0);
    if (emptyBuf.byteLength !== 0) return false;
    if (!(buf instanceof collections.ArrayBuffer)) return false;
    if (!(sliced1 instanceof collections.ArrayBuffer)) return false;
    return true;
  } catch (e) {
    return false;
  }
}

@Concurrent
function concurrentAllOpsTryCatch(buf: collections.ArrayBuffer, iterations: number): number {
  let errorCount: number = 0;
  for (let i = 0; i < iterations; i++) {
    try {
      let len = buf.byteLength;
      if (len < 0) {
        errorCount++;
      }
    } catch (err) {
      errorCount++;
    }
    try {
      let sliced = buf.slice(0, 2);
      if (sliced.byteLength !== 2) {
        errorCount++;
      }
    } catch (err) {
      errorCount++;
    }
    try {
      let sliced = buf.slice(i % 5);
    } catch (err) {
      errorCount++;
    }
    try {
      let sliced = buf.slice(-1);
    } catch (err) {
      errorCount++;
    }
    try {
      let buf2 = new collections.ArrayBuffer(5);
      if (buf2.byteLength !== 5) {
        errorCount++;
      }
    } catch (err) {
      errorCount++;
    }
  }
  return errorCount;
}

@Concurrent
function crossThreadChainedSlice(buf: collections.ArrayBuffer, begin: number, end: number): collections.ArrayBuffer {
  let sliced = buf.slice(begin, end);
  return sliced;
}

@Concurrent
function crossThreadReadByteLengthMultiple(buf: collections.ArrayBuffer, iterations: number): number {
  let successCount: number = 0;
  let expected: number = buf.byteLength;
  for (let i = 0; i < iterations; i++) {
    try {
      if (buf.byteLength === expected) {
        successCount++;
      }
    } catch (err) {
    }
  }
  return successCount;
}

@Concurrent
function crossThreadMultipleBuffers(buf1: collections.ArrayBuffer, buf2: collections.ArrayBuffer): number {
  let sliced1 = buf1.slice(0, 2);
  let sliced2 = buf2.slice(0, 3);
  return sliced1.byteLength + sliced2.byteLength;
}

@Concurrent
function crossThreadContentVerify(buf: collections.ArrayBuffer, begin: number, end: number, expectedFirst: number): boolean {
  try {
    let sliced = buf.slice(begin, end);
    let view = new collections.Uint8Array(sliced);
    if (view[0] !== expectedFirst) return false;
    return true;
  } catch (e) {
    return false;
  }
}

export default function ArrayBufferTest() {
  describe('ArrayBufferTest', () => {
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
     * @tc.name   testCollectionsArrayBuffer0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0100
     * @tc.desc   Testing Collections of ArrayBuffer, constructor -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0001";
      try {
          let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(-1);
          console.info("byteLength: " + arrayBuffer.byteLength);
          expect().assertFail();
      } catch (err) {
       console.error(`${TAG} failed, error: ${err.message}`);
       // verify entering catch only, do not assert message
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0200
     * @tc.desc   Testing Collections of ArrayBuffer, constructor 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0002";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(0);
        console.info("byteLength: " + arrayBuffer.byteLength);
        expect(arrayBuffer.byteLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
      /**
       * @tc.name   testCollectionsArrayBuffer0003
       * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0300
       * @tc.desc   Testing Collections of ArrayBuffer, constructor 1.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testCollectionsArrayBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0003";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(1);
        console.info("byteLength: " + arrayBuffer.byteLength);
        expect(arrayBuffer.byteLength).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0400
     * @tc.desc   Testing Collections of ArrayBuffer, slice(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0004";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(0);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0500
     * @tc.desc   Testing Collections of ArrayBuffer, slice(-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0005";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(-1);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0600
     * @tc.desc   Testing Collections of ArrayBuffer, slice(2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0006";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(2);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0700
     * @tc.desc   Testing Collections of ArrayBuffer, slice(10).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0007";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(10);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0800
     * @tc.desc   Testing Collections of ArrayBuffer, slice(2,4).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0008";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(2,4);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0900
     * @tc.desc   Testing Collections of ArrayBuffer, slice(2,2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(2,2);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_1000
     * @tc.desc   Testing Collections of ArrayBuffer, slice(2,0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0010";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(2,0);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
       expect(slicedBuffer.byteLength).assertEqual(0);
       } catch (err) {
         console.error(`${TAG} failed, error: ${err.message}`);
         expect().assertFail();
       }
       done()
     });
    /**
     * @tc.name   testCollectionsArrayBuffer0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_1100
     * @tc.desc   Testing Collections of ArrayBuffer, constructor 2147483648 (exceeds SAFE_NUMBER).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0011";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(2147483648);
        console.info("byteLength: " + arrayBuffer.byteLength);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        // verify entering catch only, do not assert message
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_1200
     * @tc.desc   Testing Collections of ArrayBuffer, constructor 65536 (large buffer basic ops).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0012";
      try {
        const LARGE: number = 65536;
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(LARGE);
        console.info("byteLength: " + arrayBuffer.byteLength);
        expect(arrayBuffer.byteLength).assertEqual(LARGE);
        let sliced: collections.ArrayBuffer = arrayBuffer.slice(0, 1024);
        expect(sliced.byteLength).assertEqual(1024);
        expect(arrayBuffer.byteLength).assertEqual(LARGE);
        expect(arrayBuffer instanceof collections.ArrayBuffer).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_1400
     * @tc.desc   Testing Collections of ArrayBuffer, constructor 10.0 (float integer).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0014";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10.0);
        console.info("byteLength: " + arrayBuffer.byteLength);
        expect(arrayBuffer.byteLength).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_1800
     * @tc.desc   Testing Collections of ArrayBuffer, constructor Number.MAX_SAFE_INTEGER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0018";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(Number.MAX_SAFE_INTEGER);
        console.info("byteLength: " + arrayBuffer.byteLength);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${err.message}`);
        // verify entering catch only, do not assert message
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_2000
     * @tc.desc   Testing Collections of ArrayBuffer, slice(-5) begin equals -byteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0020";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(-5);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_2100
     * @tc.desc   Testing Collections of ArrayBuffer, slice(-6) begin less than -byteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0021";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(-6);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_2200
     * @tc.desc   Testing Collections of ArrayBuffer, slice(5) begin equals byteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0022";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(5);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_2300
     * @tc.desc   Testing Collections of ArrayBuffer, slice(0,5) end equals byteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0023";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(0, 5);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_2500
     * @tc.desc   Testing Collections of ArrayBuffer, slice(0,-1) end negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0025";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(0, -1);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_2600
     * @tc.desc   Testing Collections of ArrayBuffer, slice(0,-5) end equals -byteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0026";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(0, -5);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_2700
     * @tc.desc   Testing Collections of ArrayBuffer, slice(0,-6) end less than -byteLength.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0027";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(0, -6);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_2800
     * @tc.desc   Testing Collections of ArrayBuffer, slice(-1,-1) end equals begin negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0028";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(-1, -1);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_2900
     * @tc.desc   Testing Collections of ArrayBuffer, slice(-1,-2) end less than begin negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0029";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(-1, -2);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_3100
     * @tc.desc   Testing Collections of ArrayBuffer, slice(0,3.5) float end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0031";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(0, 3.5);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_3400
     * @tc.desc   Testing Collections of ArrayBuffer, byteLength type verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0034";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        console.info("byteLength type: " + typeof arrayBuffer.byteLength);
        expect(typeof arrayBuffer.byteLength).assertEqual('number');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_3500
     * @tc.desc   Testing Collections of ArrayBuffer, byteLength correctness after construction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0035";
      try {
        let lengths: number[] = [0, 1, 5, 10, 100, 1000];
        for (let i = 0; i < lengths.length; i++) {
          let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(lengths[i]);
          console.info("byteLength: " + arrayBuffer.byteLength);
          expect(arrayBuffer.byteLength).assertEqual(lengths[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_3600
     * @tc.desc   Testing Collections of ArrayBuffer, byteLength unchanged after slice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0036";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let originalLength: number = arrayBuffer.byteLength;
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(0, 2);
        console.info("original: " + arrayBuffer.byteLength + ", sliced: " + slicedBuffer.byteLength);
        expect(arrayBuffer.byteLength).assertEqual(originalLength);
        expect(slicedBuffer.byteLength).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_3700
     * @tc.desc   Testing Collections of ArrayBuffer, cross-thread creation via TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0037";
      try {
        let task: taskpool.Task = new taskpool.Task(crossThreadCreateArrayBuffer, 10);
        let result = await taskpool.execute(task) as number;
        console.info("cross-thread byteLength: " + result);
        expect(result).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_3800
     * @tc.desc   Testing Collections of ArrayBuffer, cross-thread slice via TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0038";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let task: taskpool.Task = new taskpool.Task(crossThreadSliceArrayBuffer, arrayBuffer, 1, 3);
        let result = await taskpool.execute(task) as number;
        console.info("cross-thread sliced byteLength: " + result);
        expect(result).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_3900
     * @tc.desc   Testing Collections of ArrayBuffer, cross-thread byteLength read via TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0039";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(20);
        let task: taskpool.Task = new taskpool.Task(crossThreadReadByteLength, arrayBuffer);
        let result = await taskpool.execute(task) as number;
        console.info("cross-thread byteLength: " + result);
        expect(result).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_4000
     * @tc.desc   Testing Collections of ArrayBuffer, concurrent slice operations via TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0040";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let count: number = 0;
        const TASK_COUNT: number = 10;
        const ITERATIONS: number = 50;
        for (let i = 0; i < TASK_COUNT; i++) {
          let task: taskpool.Task = new taskpool.Task(concurrentSliceOps, arrayBuffer, ITERATIONS);
          taskpool.execute(task).then((result: Object) => {
            count++;
          });
          concurrentSliceOps(arrayBuffer, ITERATIONS);
        }
        let waitCount: number = 0;
        while (count < TASK_COUNT && waitCount < 100) {
          await sleep(100);
          waitCount++;
        }
        console.info("completed tasks: " + count);
        expect(count).assertEqual(TASK_COUNT);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_4100
     * @tc.desc   Testing Collections of ArrayBuffer, instanceof verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0041";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(0, 5);
        console.info("instanceof check: " + (arrayBuffer instanceof collections.ArrayBuffer));
        expect(arrayBuffer instanceof collections.ArrayBuffer).assertTrue();
        expect(slicedBuffer instanceof collections.ArrayBuffer).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_4200
     * @tc.desc   Testing Collections of ArrayBuffer, cross-thread return ArrayBuffer via TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0042";
      try {
        let task: taskpool.Task = new taskpool.Task(crossThreadReturnArrayBuffer, 15);
        let result = await taskpool.execute(task) as collections.ArrayBuffer;
        console.info("cross-thread returned byteLength: " + result.byteLength);
        expect(result.byteLength).assertEqual(15);
        expect(result instanceof collections.ArrayBuffer).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_4300
     * @tc.desc   Testing Collections of ArrayBuffer, all APIs in TaskPool worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0043";
      try {
        let task: taskpool.Task = new taskpool.Task(taskPoolAllArrayBufferApisTest);
        let result = await taskpool.execute(task) as boolean;
        ArkTools.forceFullGC();
        console.info(`${TAG} all APIs result: ${result}`);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_4400
     * @tc.desc   Testing Collections of ArrayBuffer, TaskGroup concurrent slice with different ranges.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0044";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(100);
        let originalLength: number = arrayBuffer.byteLength;
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(crossThreadSliceArrayBuffer, arrayBuffer, 0, 10);
        taskGroup.addTask(crossThreadSliceArrayBuffer, arrayBuffer, 10, 20);
        taskGroup.addTask(crossThreadSliceArrayBuffer, arrayBuffer, 20, 30);
        taskGroup.addTask(crossThreadSliceArrayBuffer, arrayBuffer, 30, 40);
        taskGroup.addTask(crossThreadSliceArrayBuffer, arrayBuffer, 40, 50);
        await taskpool.execute(taskGroup);
        ArkTools.forceFullGC();
        console.info(`${TAG} original byteLength after concurrent slice: ${arrayBuffer.byteLength}`);
        expect(arrayBuffer.byteLength).assertEqual(originalLength);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_4500
     * @tc.desc   Testing Collections of ArrayBuffer, concurrent all ops try-catch, main thread + TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0045";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let count: number = 0;
        const TASK_COUNT: number = 10;
        const ITERATIONS: number = 50;
        for (let i = 0; i < TASK_COUNT; i++) {
          let task: taskpool.Task = new taskpool.Task(concurrentAllOpsTryCatch, arrayBuffer, ITERATIONS);
          taskpool.execute(task).then((result: Object) => {
            count++;
          });
          concurrentAllOpsTryCatch(arrayBuffer, ITERATIONS);
        }
        let waitCount: number = 0;
        while (count < TASK_COUNT && waitCount < 100) {
          await sleep(100);
          waitCount++;
        }
        console.info(`${TAG} completed tasks: ${count}, original byteLength: ${arrayBuffer.byteLength}`);
        expect(count).assertEqual(TASK_COUNT);
        expect(arrayBuffer.byteLength).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_4600
     * @tc.desc   Testing Collections of ArrayBuffer, stress test 1000 slice operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0046";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(100);
        let successCount: number = 0;
        const TOTAL: number = 1000;
        for (let i = 0; i < TOTAL; i++) {
          try {
            let begin: number = i % 50;
            let sliced: collections.ArrayBuffer = arrayBuffer.slice(begin, begin + 10);
            if (sliced.byteLength === 10) {
              successCount++;
            }
          } catch (err) {
          }
        }
        console.info(`${TAG} success: ${successCount}/${TOTAL}, original: ${arrayBuffer.byteLength}`);
        expect(successCount).assertEqual(TOTAL);
        expect(arrayBuffer.byteLength).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_4700
     * @tc.desc   Testing Collections of ArrayBuffer, GC survival after cross-thread transfer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0047";
      try {
        let task: taskpool.Task = new taskpool.Task(crossThreadReturnArrayBuffer, 50);
        let result = await taskpool.execute(task) as collections.ArrayBuffer;
        ArkTools.forceFullGC();
        console.info(`${TAG} after GC byteLength: ${result.byteLength}`);
        expect(result.byteLength).assertEqual(50);
        let sliced: collections.ArrayBuffer = result.slice(0, 10);
        expect(sliced.byteLength).assertEqual(10);
        ArkTools.forceFullGC();
        expect(result.byteLength).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_4800
     * @tc.desc   Testing Collections of ArrayBuffer, cross-thread chained slice operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0048";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(20);
        let task: taskpool.Task = new taskpool.Task(crossThreadChainedSlice, arrayBuffer, 5, 15);
        let sliced = await taskpool.execute(task) as collections.ArrayBuffer;
        console.info(`${TAG} chained sliced byteLength: ${sliced.byteLength}`);
        expect(sliced.byteLength).assertEqual(10);
        let secondSlice: collections.ArrayBuffer = sliced.slice(0, 5);
        expect(secondSlice.byteLength).assertEqual(5);
        expect(sliced.byteLength).assertEqual(10);
        let thirdSlice: collections.ArrayBuffer = secondSlice.slice(2);
        expect(thirdSlice.byteLength).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_4900
     * @tc.desc   Testing Collections of ArrayBuffer, large buffer (1MB) cross-thread transfer and slice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0049";
      try {
        const LARGE_SIZE: number = 1048576;
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(LARGE_SIZE);
        let task: taskpool.Task = new taskpool.Task(crossThreadSliceArrayBuffer, arrayBuffer, 0, 1024);
        let result = await taskpool.execute(task) as number;
        ArkTools.forceFullGC();
        console.info(`${TAG} large buffer sliced byteLength: ${result}`);
        expect(result).assertEqual(1024);
        expect(arrayBuffer.byteLength).assertEqual(LARGE_SIZE);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_5000
     * @tc.desc   Testing Collections of ArrayBuffer, TaskGroup concurrent create with different sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0050";
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(crossThreadCreateArrayBuffer, 10);
        taskGroup.addTask(crossThreadCreateArrayBuffer, 20);
        taskGroup.addTask(crossThreadCreateArrayBuffer, 50);
        taskGroup.addTask(crossThreadCreateArrayBuffer, 100);
        taskGroup.addTask(crossThreadCreateArrayBuffer, 500);
        await taskpool.execute(taskGroup);
        ArkTools.forceFullGC();
        console.info(`${TAG} TaskGroup concurrent create completed`);
        expect(true).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_5100
     * @tc.desc   Testing Collections of ArrayBuffer, concurrent slice with different parameters, verify all results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0051";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(50);
        let count: number = 0;
        const TASK_COUNT: number = 5;
        let results: number[] = [0, 0, 0, 0, 0];
        let tasks: taskpool.Task[] = [];
        let beginValues: number[] = [0, 10, 20, 30, 40];
        let endValues: number[] = [10, 20, 30, 40, 50];
        for (let i = 0; i < TASK_COUNT; i++) {
          let task: taskpool.Task = new taskpool.Task(crossThreadSliceArrayBuffer, arrayBuffer, beginValues[i], endValues[i]);
          let index: number = i;
          taskpool.execute(task).then((result: Object) => {
            results[index] = result as number;
            count++;
          });
        }
        let waitCount: number = 0;
        while (count < TASK_COUNT && waitCount < 100) {
          await sleep(100);
          waitCount++;
        }
        console.info(`${TAG} results: ${results}`);
        expect(count).assertEqual(TASK_COUNT);
        for (let i = 0; i < TASK_COUNT; i++) {
          expect(results[i]).assertEqual(10);
        }
        expect(arrayBuffer.byteLength).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_5200
     * @tc.desc   Testing Collections of ArrayBuffer, cross-thread byteLength consistency, multiple threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0052";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(30);
        let count: number = 0;
        const TASK_COUNT: number = 10;
        const ITERATIONS: number = 100;
        for (let i = 0; i < TASK_COUNT; i++) {
          let task: taskpool.Task = new taskpool.Task(crossThreadReadByteLengthMultiple, arrayBuffer, ITERATIONS);
          taskpool.execute(task).then((result: Object) => {
            let r = result as number;
            if (r === ITERATIONS) {
              count++;
            }
          });
        }
        let waitCount: number = 0;
        while (count < TASK_COUNT && waitCount < 100) {
          await sleep(100);
          waitCount++;
        }
        console.info(`${TAG} consistent threads: ${count}/${TASK_COUNT}`);
        expect(count).assertEqual(TASK_COUNT);
        expect(arrayBuffer.byteLength).assertEqual(30);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_5300
     * @tc.desc   Testing Collections of ArrayBuffer, slice on length-0 buffer (empty buffer boundary).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0053";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(0);
        let sliced1: collections.ArrayBuffer = arrayBuffer.slice(0);
        expect(sliced1.byteLength).assertEqual(0);
        let sliced2: collections.ArrayBuffer = arrayBuffer.slice(0, 0);
        expect(sliced2.byteLength).assertEqual(0);
        let sliced3: collections.ArrayBuffer = arrayBuffer.slice(-1);
        expect(sliced3.byteLength).assertEqual(0);
        let sliced4: collections.ArrayBuffer = arrayBuffer.slice(0, 10);
        expect(sliced4.byteLength).assertEqual(0);
        console.info(`${TAG} all empty buffer slices passed`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_5400
     * @tc.desc   Testing Collections of ArrayBuffer, multiple chained slices (slice then slice the result).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0054";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(100);
        let originalLength: number = arrayBuffer.byteLength;
        let first: collections.ArrayBuffer = arrayBuffer.slice(10, 90);
        expect(first.byteLength).assertEqual(80);
        let second: collections.ArrayBuffer = first.slice(10, 70);
        expect(second.byteLength).assertEqual(60);
        let third: collections.ArrayBuffer = second.slice(10, 50);
        expect(third.byteLength).assertEqual(40);
        let fourth: collections.ArrayBuffer = third.slice(0, 20);
        expect(fourth.byteLength).assertEqual(20);
        let fifth: collections.ArrayBuffer = fourth.slice(5);
        expect(fifth.byteLength).assertEqual(15);
        console.info(`${TAG} original unchanged: ${arrayBuffer.byteLength === originalLength}`);
        expect(arrayBuffer.byteLength).assertEqual(originalLength);
        expect(first.byteLength).assertEqual(80);
        expect(second.byteLength).assertEqual(60);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_5500
     * @tc.desc   Testing Collections of ArrayBuffer, large buffer (1MB) slice boundary verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0055";
      try {
        const LARGE_SIZE: number = 1048576;
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(LARGE_SIZE);
        let sliced1: collections.ArrayBuffer = arrayBuffer.slice(0, LARGE_SIZE);
        expect(sliced1.byteLength).assertEqual(LARGE_SIZE);
        let sliced2: collections.ArrayBuffer = arrayBuffer.slice(0, 1);
        expect(sliced2.byteLength).assertEqual(1);
        let sliced3: collections.ArrayBuffer = arrayBuffer.slice(LARGE_SIZE - 1);
        expect(sliced3.byteLength).assertEqual(1);
        let sliced4: collections.ArrayBuffer = arrayBuffer.slice(0, -1);
        expect(sliced4.byteLength).assertEqual(LARGE_SIZE - 1);
        let sliced5: collections.ArrayBuffer = arrayBuffer.slice(-1);
        expect(sliced5.byteLength).assertEqual(1);
        let sliced6: collections.ArrayBuffer = arrayBuffer.slice(LARGE_SIZE);
        expect(sliced6.byteLength).assertEqual(0);
        console.info(`${TAG} large buffer slice boundaries passed, original: ${arrayBuffer.byteLength}`);
        expect(arrayBuffer.byteLength).assertEqual(LARGE_SIZE);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_5600
     * @tc.desc   Testing Collections of ArrayBuffer, slice content verification via Uint8Array view.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0056";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        let uint8View: collections.Uint8Array = new collections.Uint8Array(arrayBuffer);
        let data: number[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
        uint8View.set(data);
        let sliced: collections.ArrayBuffer = arrayBuffer.slice(2, 7);
        let slicedView: collections.Uint8Array = new collections.Uint8Array(sliced);
        console.info(`${TAG} sliced byteLength: ${sliced.byteLength}`);
        expect(sliced.byteLength).assertEqual(5);
        expect(slicedView[0]).assertEqual(30);
        expect(slicedView[1]).assertEqual(40);
        expect(slicedView[2]).assertEqual(50);
        expect(slicedView[3]).assertEqual(60);
        expect(slicedView[4]).assertEqual(70);
        expect(uint8View[2]).assertEqual(30);
        expect(arrayBuffer.byteLength).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_5700
     * @tc.desc   Testing Collections of ArrayBuffer, slice with very large negative begin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0057";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let sliced: collections.ArrayBuffer = arrayBuffer.slice(-999999);
        console.info(`${TAG} sliced byteLength: ${sliced.byteLength}`);
        expect(sliced.byteLength).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_5800
     * @tc.desc   Testing Collections of ArrayBuffer, slice with very large positive begin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0058";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let sliced: collections.ArrayBuffer = arrayBuffer.slice(999999);
        console.info(`${TAG} sliced byteLength: ${sliced.byteLength}`);
        expect(sliced.byteLength).assertEqual(0);
        let sliced2: collections.ArrayBuffer = arrayBuffer.slice(0, 999999);
        expect(sliced2.byteLength).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_5900
     * @tc.desc   Testing Collections of ArrayBuffer, cross-thread multiple buffers via TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0059";
      try {
        let buf1: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let buf2: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        let task: taskpool.Task = new taskpool.Task(crossThreadMultipleBuffers, buf1, buf2);
        let result = await taskpool.execute(task) as number;
        ArkTools.forceFullGC();
        console.info(`${TAG} combined sliced byteLength: ${result}`);
        expect(result).assertEqual(5);
        expect(buf1.byteLength).assertEqual(5);
        expect(buf2.byteLength).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_6000
     * @tc.desc   Testing Collections of ArrayBuffer, cross-thread content verification via TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0060";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        let uint8View: collections.Uint8Array = new collections.Uint8Array(arrayBuffer);
        let data: number[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
        uint8View.set(data);
        let task: taskpool.Task = new taskpool.Task(crossThreadContentVerify, arrayBuffer, 3, 8, 40);
        let result = await taskpool.execute(task) as boolean;
        ArkTools.forceFullGC();
        console.info(`${TAG} cross-thread content verify result: ${result}`);
        expect(result).assertEqual(true);
        expect(arrayBuffer.byteLength).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_6100
     * @tc.desc   Testing Collections of ArrayBuffer, concurrent create and slice interleaved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0061";
      try {
        let sharedBuf: collections.ArrayBuffer = new collections.ArrayBuffer(20);
        let count: number = 0;
        const TASK_COUNT: number = 5;
        for (let i = 0; i < TASK_COUNT; i++) {
          let begin: number = i * 2;
          let end: number = begin + 2;
          let task: taskpool.Task = new taskpool.Task(crossThreadSliceArrayBuffer, sharedBuf, begin, end);
          taskpool.execute(task).then((result: Object) => {
            count++;
          });
          let newBuf: collections.ArrayBuffer = new collections.ArrayBuffer(10);
          newBuf.slice(0, 5);
        }
        let waitCount: number = 0;
        while (count < TASK_COUNT && waitCount < 100) {
          await sleep(100);
          waitCount++;
        }
        console.info(`${TAG} completed tasks: ${count}, sharedBuf byteLength: ${sharedBuf.byteLength}`);
        expect(count).assertEqual(TASK_COUNT);
        expect(sharedBuf.byteLength).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
   })
}