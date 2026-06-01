/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '../../../../../../hypium';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[ImageReceiver].getReceivingSurfaceId';

async function getReceivingSurfaceIdPromiseTest(done: () => void, testName: string, size: image.Size): Promise<void> {
  let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
  if (receiver === undefined) {
    console.info(TAG, 'receiver is undefined');
    expect().assertFail();
    done();
    return;
  }
  let id: string = await receiver.getReceivingSurfaceId();
  console.info(TAG, 'Succeeded in getting the ReceivingSurfaceId.');
  await receiver.release();
  done();
}

export default function ImageReceiverGetReceivingSurfaceIdTest(): void {
  describe('ImageReceiverGetReceivingSurfaceIdTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   ImageReceiver_getReceivingSurfaceId_promise_001
     * @tc.number IMAGE_RECEIVER_GET_RECEIVING_SURFACE_ID_001
     * @tc.desc   ImageReceiver_getReceivingSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageReceiver_getReceivingSurfaceId_promise_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'ImageReceiver_getReceivingSurfaceId_promise_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      try {
        await getReceivingSurfaceIdPromiseTest(done, testName, size);
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG, `failed; error: ${err}, ${err.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   ImageReceiver_getReceivingSurfaceId_promise_002
     * @tc.number IMAGE_RECEIVER_GET_RECEIVING_SURFACE_ID_002
     * @tc.desc   ImageReceiver_getReceivingSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageReceiver_getReceivingSurfaceId_promise_002', Level.LEVEL0, async (done: () => void) => {
      const testName = 'ImageReceiver_getReceivingSurfaceId_promise_002';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      try {
        await getReceivingSurfaceIdPromiseTest(done, testName, size);
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG, `failed; error: ${err}, ${err.code}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}