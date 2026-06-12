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

import { Context } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium} from '../../../../../../hypium';

const TAG = 'ImageXts.createAuxiliaryPicture';

export default function createAuxiliaryPictureTest(): void {
  describe('createAuxiliaryPictureTest', () => {
    let testContext: Context = Hypium.get("Context") as Context;
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
     * @tc.name   SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0300
     * @tc.number SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0300
     * @tc.desc   createAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0300';
      try {
        const resourceMgr = testContext.resourceManager;
        const rawFile = await resourceMgr.getRawFileContent('test.jpg');
        let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
        let auxSize: image.Size = {
          height: 180,
          width: 240
        };
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        let auxPictureObj: image.AuxiliaryPicture | undefined = await image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG, testName, 'auxPictureObj', JSON.stringify(auxPictureObj));
        expect(auxPictureObj != undefined).assertTrue();
        done();
      }catch (error){
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0400
     * @tc.number SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0400
     * @tc.desc   createAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0400';
      try {
        const resourceMgr = testContext.resourceManager;
        const rawFile = await resourceMgr.getRawFileContent('test.svg');
        let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
        let auxSize: image.Size = {
          height: 10,
          width: 20
        };
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        let auxPictureObj: image.AuxiliaryPicture | undefined = await image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG, testName, 'auxPictureObj', JSON.stringify(auxPictureObj));
        expect(auxPictureObj != undefined).assertTrue();
        done();
      }catch (error){
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0500
     * @tc.number SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0500
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0500';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(1000);
      const auxSize: image.Size = { width: 10, height: 10 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      try {
        console.info(TAG, testName, `Start`);
        let result = image.createAuxiliaryPicture(buffer,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
        expect(result != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0600
     * @tc.number SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0600
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0600';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(1000);
      const auxSize: image.Size = { width: 10, height: 10 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        console.info(TAG, testName, `Start`);
        let result = image.createAuxiliaryPicture(buffer,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
        expect(result != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0700
     * @tc.number SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0700
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0700';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(1000);
      const auxSize: image.Size = { width: 10, height: 10 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      try {
        console.info(TAG, testName, `Start`);
        let result = image.createAuxiliaryPicture(buffer,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
        expect(result != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0800
     * @tc.number SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0800
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0800';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(1000);
      const auxSize: image.Size = { width: 10, height: 10 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      try {
        console.info(TAG, testName, `Start`);
        let result = image.createAuxiliaryPicture(buffer,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
        expect(result != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0900
     * @tc.number SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0900
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0900';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(1000);
      const auxSize: image.Size = { width: 10, height: 10 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      try {
        console.info(TAG, testName, `Start`);
        let result = image.createAuxiliaryPicture(buffer,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
        expect(result != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
  })
}