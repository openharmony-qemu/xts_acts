/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium-dynamic';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'queueImage';

export default function queueImageImageTest() {
  describe('queueImageImageTest', () => {

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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0001
     * @tc.desc   ImageCreator_queueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      const outputImage: image.Image = await creator.dequeueImage();
      let queued: boolean = false;

      try {
        const component: image.Component = await outputImage.getComponent(image.ComponentType.JPEG);
        const buffer: Uint8Array = new Uint8Array(component.byteBuffer);
        for (let offset: number = 0; offset + 3 < buffer.length; offset += 4) {
          buffer[offset] = 0;
          buffer[offset + 1] = 0;
          buffer[offset + 2] = 255;
          buffer[offset + 3] = 255;
        }
        await creator.queueImage(outputImage);

        const outputImageSecond: image.Image = await creator.dequeueImage();
        const componentSencond: image.Component = await outputImageSecond.getComponent(image.ComponentType.JPEG);
        const bufferSecond: Uint8Array = new Uint8Array(componentSencond.byteBuffer);
        if (bufferSecond[0] === buffer[0]) {
          queued = true;
          console.info(testName, 'Producer queued one image.');
          expect(queued).assertTrue();
        }
      }catch (error){
        let err = error as BusinessError;
        console.log(testName, "err is ", err, "err.code is ", err.code);
      }finally {
        await creator.release();
        console.info(testName, 'Succeeded in releasing creator.');
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0002
     * @tc.desc   ImageCreator_queueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0002';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      let result: Boolean = false;
      const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      try {
        await creator.queueImage(null);
      }catch (error){
        let err = error as BusinessError;
        console.log(testName, "err is ", err, "err.code is ", err.code);
        result = true;
      }finally {
        await creator.release();
        console.info(testName, 'Succeeded in releasing creator.');
      }
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0003
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0003
     * @tc.desc   ImageCreator_queueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0003';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      let result: Boolean = false;
      const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      try {
        await creator.queueImage(undefined);
      }catch (error){
        let err = error as BusinessError;
        console.log(testName, "err is ", err, "err.code is ", err.code);
        result = true;
      }finally {
        await creator.release();
        console.info(testName, 'Succeeded in releasing creator.');
      }
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0004
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0004
     * @tc.desc   ImageCreator_queueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUE_IMAGE_0004';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      let result: Boolean = true;
      const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      const outputImage: image.Image = await creator.dequeueImage();

      const component: image.Component = await outputImage.getComponent(image.ComponentType.JPEG);
      const buffer: Uint8Array = new Uint8Array(component.byteBuffer);
      for (let offset: number = 0; offset + 3 < buffer.length; offset += 4) {
        buffer[offset] = 0;
        buffer[offset + 1] = 0;
        buffer[offset + 2] = 255;
        buffer[offset + 3] = 255;
      }

      try {
        let testNumber = 10;
        for(let i = 0; i < testNumber; i++) {
          await creator.queueImage(outputImage);
          console.info(testName, 'Succeeded in queueImage creator.');
          expect(result).assertTrue();
        }
      }catch (error){
        let err = error as BusinessError;
        console.log(testName, "err is ", err, "err.code is ", err.code);
        expect().assertFail();
      }finally {
        await creator.release();
        console.info(testName, 'Succeeded in releasing creator.');
      }
      done();
    });
  })
}