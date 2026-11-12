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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium } from '@ohos/hypium-static/src/main/indexStatic';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "AuxiliaryPictureOxyMelMapStaticTest: ";
const GAINMAP = image.AuxiliaryPictureType.GAINMAP;

export default function auxiliaryPictureOxyMelMapStaticTest(): void {
  describe('auxiliaryPictureOxyMelMapStaticTest', (): void => {
    let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;

    beforeAll(async () => {
      console.info(TAG + 'beforeAll case');
    });

    beforeEach(() => {
      console.info(TAG + 'beforeEach case');
    });

    afterEach(() => {
      console.info(TAG + 'afterEach case');
    });

    afterAll(() => {
      console.info(TAG + 'afterAll case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_OXY_MEL_MAP_static_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_OXY_MEL_MAP_static_0100
     * @tc.desc   assert the new AuxiliaryPictureType enum values OXY_MAP and MEL_MAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_OXY_MEL_MAP_static_0100',
      Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info(TAG + '------SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_OXY_MEL_MAP_static_0100------');
        expect(image.AuxiliaryPictureType.OXY_MAP == 11).assertTrue();
        console.info(TAG + 'AuxiliaryPictureType.OXY_MAP: ' + image.AuxiliaryPictureType.OXY_MAP);
        expect(image.AuxiliaryPictureType.MEL_MAP == 12).assertTrue();
        console.info(TAG + 'AuxiliaryPictureType.MEL_MAP: ' + image.AuxiliaryPictureType.MEL_MAP);
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_ACQUIRE_PIXELMAP_static_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_ACQUIRE_PIXELMAP_static_0100
     * @tc.desc   create auxiliary picture with GAINMAP type and acquire its pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_ACQUIRE_PIXELMAP_static_0100',
      Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_ACQUIRE_PIXELMAP_static_0100';
        console.info(TAG + '------' + testName + '------');
        let imageSource: image.ImageSource | undefined;
        let pictureObj: image.Picture | null | undefined;
        let auxPictureObj: image.AuxiliaryPicture | null | undefined;
        let auxPixelmap: image.PixelMap | null | undefined;
        try {
          const resourceMgr = testContext.resourceManager;
          const rawFile = resourceMgr.getRawFileContentSync('testExif.jpg');
          imageSource = image.createImageSource(rawFile.buffer as ArrayBuffer);
          pictureObj = await imageSource!.createPicture();
          expect(pictureObj != null).assertTrue();
          if (pictureObj != null) {
            auxPictureObj = pictureObj.getAuxiliaryPicture(GAINMAP);
            if (auxPictureObj != null) {
              auxPixelmap = auxPictureObj.acquirePixelmap();
              expect(auxPixelmap != null).assertTrue();
              auxPixelmap?.release();
              auxPictureObj.release();
            }
            pictureObj.release();
          }
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(TAG + testName + ' error code is ' + err.code + ' message is ' + err.message);
          expect().assertFail();
          done();
        } finally {
          if (auxPixelmap != undefined) {
            auxPixelmap.release();
          }
          if (auxPictureObj != undefined) {
            auxPictureObj.release();
          }
          if (pictureObj != undefined) {
            pictureObj.release();
          }
          if (imageSource != undefined) {
            await imageSource.release();
          }
        }
      });
  });
}