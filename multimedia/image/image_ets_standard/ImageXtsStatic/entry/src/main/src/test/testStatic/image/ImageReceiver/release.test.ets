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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '../../../../../../hypium';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[ImageReceiver].release';

async function releasePromiseTest(done: () => void, testName: string): Promise<void> {
  try {
    const size: image.Size = { height: 8192, width: 8 };
    const receiver: image.ImageReceiver | undefined = await image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
    if (receiver === undefined) {
      expect().assertFail();
      done();
      return;
    }
    await receiver.release();
    try {
      await receiver.getReceivingSurfaceId();
      expect().assertFail();
    } catch (e) {
      console.info(TAG, 'Succeeded in releasing the ImageReceiver. Receiver is no longer usable.');
    }
    done();
  } catch (error) {
    console.error(TAG, `Failed. error: ${error}`);
    expect().assertFail();
    done();
  }
}

async function releaseCallbackTest(done: () => void, testName: string): Promise<void> {
  try {
    const size: image.Size = { height: 8192, width: 8 };
    const receiver: image.ImageReceiver | undefined = await image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
    if (receiver === undefined) {
      expect().assertFail();
      done();
      return;
    }
    receiver.release((err: BusinessError | null) => {
      if (err) {
        console.error(TAG, `Failed to release. code ${err.code}, message ${err.message}`);
        expect().assertFail();
      } else {
        try {
          receiver.getReceivingSurfaceId((e: BusinessError | null, id: string | undefined) => {
            if (e === null) {
              expect().assertFail();
            }
          });
        } catch (error) {
          console.info(TAG, 'Succeeded in releasing the ImageReceiver.');
        }
      }
      done();
    });
  } catch (error) {
    console.error(TAG, `Failed. error: ${error}`);
    expect().assertFail();
    done();
  }
}

export default function ImageReceiverReleaseTest(): void {
  describe('ImageReceiverReleaseTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_ImageReceiver_release_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_ImageReceiver_release_promise_static_0100
     * @tc.desc   ImageReceiver_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageReceiver_release_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageReceiver_release_promise_static_0100';
      try {
        await releasePromiseTest(done, testName);
      } catch (error) {
        console.info(TAG, `failed; error: ${error}, ${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_ImageReceiver_release_callback_static_0100
     * @tc.number SUB_MEDIA_IMAGE_ImageReceiver_release_callback_static_0100
     * @tc.desc   ImageReceiver_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageReceiver_release_callback_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageReceiver_release_callback_static_0100';
      try {
        await releaseCallbackTest(done, testName);
      } catch (error) {
        console.info(TAG, `failed; error: ${error}, ${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}