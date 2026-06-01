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

const TAG = '[ImageCreator].queueImage';

async function queueImagePromiseTest(done: () => void, testName: string, size: image.Size): Promise<void> {
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  const img: image.Image = await creator.dequeueImage();
  const component: image.Component = await img.getComponent(image.ComponentType.JPEG);
  expect(component != undefined).assertTrue();
  let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
  for (let i = 0; i < bufferArr.length; i += 4) {
    bufferArr[i] = 0;
    bufferArr[i + 1] = 0;
    bufferArr[i + 2] = 255;
    bufferArr[i + 3] = 255;
  }
  await creator.queueImage(img);
  console.info(TAG, 'Succeeded in queuing the Image.');
  await creator.release();
  done();
}

async function queueImageCallbackTest(done: () => void, testName: string, size: image.Size): Promise<void> {
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  const img: image.Image = await creator.dequeueImage();
  const component: image.Component = await img.getComponent(image.ComponentType.JPEG);
  expect(component != undefined).assertTrue();
  let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
  for (let i = 0; i < bufferArr.length; i += 4) {
    bufferArr[i] = 0;
    bufferArr[i + 1] = 0;
    bufferArr[i + 2] = 255;
    bufferArr[i + 3] = 255;
  }
  await creator.queueImage(img);
  console.info(TAG, 'Succeeded in queuing the Image.');
  await creator.release();
  done();
}

export default function ImageCreatorQueueImageTest(): void {
  describe('ImageCreatorQueueImageTest', () => {

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
     * @tc.name   ImageCreator_queueImage_promise_001
     * @tc.number IMAGE_CREATOR_QUEUE_IMAGE_001
     * @tc.desc   ImageCreator_queueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageCreator_queueImage_promise_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'ImageCreator_queueImage_promise_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      try {
        await queueImagePromiseTest(done, testName, size);
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, `Failed to queue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   ImageCreator_queueImage_promise_002
     * @tc.number IMAGE_CREATOR_QUEUE_IMAGE_002
     * @tc.desc   ImageCreator_queueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageCreator_queueImage_promise_002', Level.LEVEL0, async (done: () => void) => {
      const testName = 'ImageCreator_queueImage_promise_002';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      try {
        await queueImagePromiseTest(done, testName, size);
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, `Failed to queue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   ImageCreator_queueImage_callback_001
     * @tc.number IMAGE_CREATOR_QUEUE_IMAGE_003
     * @tc.desc   ImageCreator_queueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageCreator_queueImage_callback_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'ImageCreator_queueImage_callback_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      try {
        await queueImageCallbackTest(done, testName, size);
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, `Failed to queue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   ImageCreator_queueImage_callback_002
     * @tc.number IMAGE_CREATOR_QUEUE_IMAGE_004
     * @tc.desc   ImageCreator_queueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageCreator_queueImage_callback_002', Level.LEVEL0, async (done: () => void) => {
      const testName = 'ImageCreator_queueImage_callback_002';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      try {
        await queueImageCallbackTest(done, testName, size);
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, `Failed to queue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}