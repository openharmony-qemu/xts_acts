'use static';
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Hypium
} from '@ohos/hypium-binary/src/main/indexStatic';
import { BusinessError } from '@ohos.base';

const TAG = 'ImageReceiver.GetReceivingSurfaceId'

async function getReceivingSurfaceIdPromiseTest(done: () => void, testName: string, size: image.Size): Promise<void> {
  try {
    const receiver: image.ImageReceiver | undefined = await image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
    await receiver?.getReceivingSurfaceId().then((id: string) => {
      expect(id.length > 0).assertTrue();
      console.info(TAG, 'Succeeded in getting the ReceivingSurfaceId.');
    }).catch((error) => {
      console.error(TAG, `Failed to get the ReceivingSurfaceId.code ${error.code},message is ${error.message}`);
      expect().assertFail();
    });
    receiver?.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getReceivingSurfaceIdCallbackTest(done: () => void, testName: string, size: image.Size): Promise<void> {
  try {
    const receiver: image.ImageReceiver | undefined = await image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
    receiver?.getReceivingSurfaceId((err: BusinessError | null, id: string | undefined) => {
      if (err) {
        console.error(TAG, `Failed to get the ReceivingSurfaceId.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        expect(id!.length > 0).assertTrue();
        console.info(TAG, 'Succeeded in getting the ReceivingSurfaceId.');
      }
      receiver?.release((err: BusinessError | null) => {
        if (err) {
          console.error(`Failed to release the receiver.code ${err.code},message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info('Succeeded in releasing the receiver.');
        }
      })
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
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
     * @tc.name   SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_promise_static_0100
     * @tc.desc   ImageReceiver_getReceivingSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_promise_static_0100';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      await getReceivingSurfaceIdPromiseTest(done, testName, size);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_promise_static_0200
     * @tc.number SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_promise_static_0200
     * @tc.desc   ImageReceiver_getReceivingSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_promise_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_promise_static_0200';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      await getReceivingSurfaceIdPromiseTest(done, testName, size);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_callback_static_0100
     * @tc.number SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_callback_static_0100
     * @tc.desc   ImageReceiver_getReceivingSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_callback_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_callback_static_0100';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      await getReceivingSurfaceIdCallbackTest(done, testName, size);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_callback_static_0200
     * @tc.number SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_callback_static_0200
     * @tc.desc   ImageReceiver_getReceivingSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_callback_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageReceiver_getReceivingSurfaceId_callback_static_0200';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      await getReceivingSurfaceIdCallbackTest(done, testName, size);
    })
  })
}