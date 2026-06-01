'use static'
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

const TAG = '[ImageCreator].dequeueImage';

async function dequeueImagePromiseTest(done: () => void, testName: string,  size: image.Size): Promise<void> {
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  await creator.dequeueImage().then((img: image.Image) => {
    creator.release();
    console.info(TAG, 'Succeeded in dequeuing the Image.');
  }).catch((error: Error) => {
    let error1 = error as BusinessError
    console.error(TAG, `Failed to dequeue the Image.code ${error1.code},message is ${error1.message}`);
    expect().assertFail();
  })
  done();
}

async function dequeueImageCallbackTest(done: () => void, testName: string, size: image.Size): Promise<void> {
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  creator.dequeueImage((err: BusinessError | null, img: image.Image | undefined) => {
    if (err) {
      console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
      expect().assertFail();
    } else {
      console.info(TAG, 'Succeeded in dequeuing the Image.')
    }
    creator?.release((err: BusinessError | null) => {
      if (err) {
        console.error(TAG, `Failed to release the image instance.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in releasing the image instance.');
      }
      done();
    })
  });
}

export default function ImageCreatorDequeueImageTest(): void {
  describe('ImageCreatorDequeueImageTest', () => {

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
     * @tc.name   ImageCreator_dequeueImage_promise_static_0100
     * @tc.number IMAGE_CREATOR_DEQUEUE_IMAGE_001
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageCreator_dequeueImage_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'ImageCreator_dequeueImage_promise_static_0100';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      try {
        await dequeueImagePromiseTest(done, testName, size);
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   ImageCreator_dequeueImage_promise_static_0200
     * @tc.number IMAGE_CREATOR_DEQUEUE_IMAGE_002
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageCreator_dequeueImage_promise_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'ImageCreator_dequeueImage_promise_static_0200';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      try {
        await dequeueImagePromiseTest(done, testName, size);
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   ImageCreator_dequeueImage_callback_static_0100
     * @tc.number IMAGE_CREATOR_DEQUEUE_IMAGE_003
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageCreator_dequeueImage_callback_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'ImageCreator_dequeueImage_callback_static_0100';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      try {
        await dequeueImageCallbackTest(done, testName, size);
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, `failed; error: ${err.code},message is ${err.message}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   ImageCreator_dequeueImage_callback_static_0200
     * @tc.number IMAGE_CREATOR_DEQUEUE_IMAGE_004
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageCreator_dequeueImage_callback_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'ImageCreator_dequeueImage_callback_static_0200';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      try {
        await dequeueImageCallbackTest(done, testName, size);
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, `failed; error: ${err.code},message is ${err.message}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}