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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium} from '../../../../../../hypium';

const TAG = 'ImageXts.createImageCreator';

export default function ImageCreateImageCreatorTestSupp(): void {
  describe('ImageCreateImageCreatorTestSupp', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_createImageCreator_static_0600
     * @tc.number SUB_MEDIA_IMAGE_createImageCreator_static_0600
     * @tc.desc   createImageCreator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageCreator_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageCreator_static_0600';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8
        };
        const ImageFormat = image.ImageFormat.JPEG;
        let receiver: image.ImageCreator = await image.createImageCreator(size, ImageFormat, 8);
        expect(receiver.capacity != undefined).assertTrue();
        done();
      }catch(error){
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageCreator_static_0700
     * @tc.number SUB_MEDIA_IMAGE_createImageCreator_static_0700
     * @tc.desc   createImageCreator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageCreator_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageCreator_static_0700';
      try {
        let size: image.Size = {
          height: 8,
          width: 8192
        };
        const ImageFormat = image.ImageFormat.JPEG;
        let receiver: image.ImageCreator = await image.createImageCreator(size, ImageFormat, 8);
        expect(receiver.capacity != undefined).assertTrue();
        done();
      }catch(error){
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageCreator_static_0300
     * @tc.number SUB_MEDIA_IMAGE_createImageCreator_static_0300
     * @tc.desc   createImageCreator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageCreator_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageCreator_static_0300';
      try {
        let size: image.Size = {
          height: 0,
          width: 0
        };
        const ImageFormat = image.ImageFormat.JPEG;
        let receiver: image.ImageCreator = await image.createImageCreator(size, ImageFormat, 8);
        expect(receiver.capacity != undefined).assertTrue();
        done();
      }catch(error){
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageCreator_static_0400
     * @tc.number SUB_MEDIA_IMAGE_createImageCreator_static_0400
     * @tc.desc   createImageCreator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageCreator_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageCreator_static_0400';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8
        };
        const ImageFormat = image.ImageFormat.YCBCR_422_SP;
        let receiver: image.ImageCreator = await image.createImageCreator(size, ImageFormat, 8);
        expect(receiver.capacity != undefined).assertTrue();
        done();
      }catch(error){
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageCreator_static_0500
     * @tc.number SUB_MEDIA_IMAGE_createImageCreator_static_0500
     * @tc.desc   createImageCreator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageCreator_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageCreator_static_0500';
      try {
        let size: image.Size = {
          height: 8,
          width: 8192
        };
        const ImageFormat = image.ImageFormat.YCBCR_422_SP;
        let receiver: image.ImageCreator = await image.createImageCreator(size, ImageFormat, 8);
        expect(receiver.capacity != undefined).assertTrue();
        done();
      }catch(error){
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
        done();
      }
    })

  })
}