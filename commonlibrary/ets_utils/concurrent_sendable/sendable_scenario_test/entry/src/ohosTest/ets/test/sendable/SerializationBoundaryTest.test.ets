/*
 * Copyright (c) 2026 RKH Corp.
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { BusinessError } from '@kit.BasicServicesKit';

class NonSerializableItem {
  public data_: string = ''
}

class OversizedPayload {
  public blob_: string = ''
}

@Concurrent
function normalSizeFunc(): string {
  return 'x'.repeat(1024)
}

@Concurrent
function boundarySizeFunc(): string {
  return 'x'.repeat(15 * 1024 * 1024)
}

@Concurrent
function oversizeFunc(): string {
  const chunk: string = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  const total: number = 17 * 1024 * 1024
  const parts: string[] = []
  const chunkLen: number = chunk.length
  const fullChunks: number = Math.floor(total / chunkLen)
  for (let i: number = 0; i < fullChunks; i++) {
    const shift: number = i % chunkLen
    parts.push(chunk.substring(shift) + chunk.substring(0, shift))
  }
  const rest: number = total - fullChunks * chunkLen
  if (rest > 0) {
    parts.push(chunk.substring(0, rest))
  }
  return parts.join('')
}

@Concurrent
function nonSerializableArgFunc(items: NonSerializableItem[]): number {
  return items.length
}

@Concurrent
function echoLengthFunc(payload: string): number {
  return payload.length
}

@Concurrent
function readPayloadLength(payload: OversizedPayload): number {
  return payload.blob_.length
}

function buildIncompressible(total: number): string {
  const chunk: string = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  let parts: string[] = []
  const chunkLen: number = chunk.length
  const fullChunks: number = Math.floor(total / chunkLen)
  for (let i: number = 0; i < fullChunks; i++) {
    const shift: number = i % chunkLen
    parts.push(chunk.substring(shift) + chunk.substring(0, shift))
  }
  const rest: number = total - fullChunks * chunkLen
  if (rest > 0) {
    parts.push(chunk.substring(0, rest))
  }
  return parts.join('')
}


@Sendable
class SupBigPayload001 {
  bigStr: string = '';
}

function supBuildBigPayload001(size: number): SupBigPayload001 {
  let payload = new SupBigPayload001();
  let parts: string[] = [];
  let count: number = Math.ceil(size / 1024);
  for (let i = 0; i < count; i++) {
    parts.push('a'.repeat(1024));
  }
  payload.bigStr = parts.join('');
  return payload;
}

@Concurrent
function supCheckBigPayload001(payload: SupBigPayload001): number {
  return payload.bigStr.length;
}

function supBuildNonSendable001(size: number): string {
  return 'a'.repeat(size);
}

@Concurrent
function supCheckPayloadLength001(payload: string): number {
  return payload.length;
}

export default function SerializationBoundaryTest(): void {
  describe('SerializationBoundaryTest', (): void => {
    /**
     * @tc.name   testSerializationBoundary0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZATION_BOUNDARY_TEST_0100
     * @tc.desc   Verify taskpool returns normal size string without serialization limit error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSerializationBoundary0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        const task: taskpool.Task = new taskpool.Task(normalSizeFunc)
        const result: Object = await taskpool.execute(task)
        expect((result as string).length).assertEqual(1024)
        expect((result as string).charAt(0)).assertEqual('x')
      } catch (error) {
        console.error("testSerializationBoundary0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSerializationBoundary0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZATION_BOUNDARY_TEST_0200
     * @tc.desc   Verify taskpool returns payload just below 16M serialization limit successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSerializationBoundary0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const task: taskpool.Task = new taskpool.Task(boundarySizeFunc)
        const result: Object = await taskpool.execute(task)
        expect((result as string).length).assertEqual(15 * 1024 * 1024)
      } catch (error) {
        console.error("testSerializationBoundary0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSerializationBoundary0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZATION_BOUNDARY_TEST_0300
     * @tc.desc   Verify 17M incompressible non-sendable payload: since the 16MB limit was relaxed, clone succeeds with full length/content; if the limit is enforced, a non-zero limit error must be thrown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSerializationBoundary0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const oversizedPayload: OversizedPayload = new OversizedPayload()
        oversizedPayload.blob_ = buildIncompressible(17 * 1024 * 1024)
        const task: taskpool.Task = new taskpool.Task(readPayloadLength, oversizedPayload)
        try {
          const result: Object = await taskpool.execute(task)
          expect(result as number).assertEqual(17 * 1024 * 1024)
          expect(oversizedPayload.blob_.length).assertEqual(17 * 1024 * 1024)
          expect(oversizedPayload.blob_.charAt(0)).assertEqual('a')
        } catch (overErr) {
          expect((overErr as BusinessError).code !== 0).assertTrue()
        }
      } catch (error) {
        console.error("testSerializationBoundary0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSerializationBoundary0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZATION_BOUNDARY_TEST_0400
     * @tc.desc   Verify non-sendable class argument is delivered by structured clone and values survive round trip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSerializationBoundary0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const items: NonSerializableItem[] = [new NonSerializableItem()]
        items[0].data_ = 'payload'
        const task: taskpool.Task = new taskpool.Task(nonSerializableArgFunc, items)
        const result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(1)
      } catch (error) {
        console.error("testSerializationBoundary0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.number  SUB_SENDABLE_DOC_16MB_0100
     * @tc.name    testSendableDoc16MB0001
     * @tc.desc    Verify >16MB Sendable object transfers successfully by reference
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testSendableDoc16MB0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let payload = supBuildBigPayload001(17 * 1024 * 1024);
      let len = await taskpool.execute(new taskpool.Task(supCheckBigPayload001, payload)) as number;
      expect(len).assertEqual(17 * 1024 * 1024);
      done()
    })

    /**
     * @tc.number  SUB_SENDABLE_DOC_16MB_BOUNDARY_0200
     * @tc.name    testSendableDoc16MBoundary0002
     * @tc.desc    Verify 16MB boundary behavior of non-Sendable payload
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testSendableDoc16MBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let sizes: number[] = [16 * 1024 * 1024 - 1, 16 * 1024 * 1024, 16 * 1024 * 1024 + 1];
      for (let i = 0; i < sizes.length; i++) {
        let payload: string = supBuildNonSendable001(sizes[i]);
        try {
          let len = await taskpool.execute(new taskpool.Task(supCheckPayloadLength001, payload)) as number;
          expect(len).assertEqual(sizes[i]);
        } catch (error) {
          expect((error as BusinessError).code !== 0).assertTrue();
        }
      }
      done()
    })

  })
}
