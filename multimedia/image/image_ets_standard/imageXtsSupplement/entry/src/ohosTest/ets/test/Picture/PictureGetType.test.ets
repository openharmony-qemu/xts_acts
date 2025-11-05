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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { LOG_TAG } from '../common';
import fs from '@ohos.file.fs';

const TAG = LOG_TAG + 'Picture.GetTypeSupp';


async function getAuxiliaryTypeTest(done: Function, testName: string, pathUri: string,
  AuxiliaryPictureType: image.AuxiliaryPictureType, callback: (res:image.AuxiliaryPictureType) => void,
) {
  try {
    let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = Context.resourceManager;
    const rawFileFd = await resourceMgr.getRawFileContent('hdr.jpg');

    let auxBuffer: ArrayBuffer = rawFileFd.buffer as ArrayBuffer;
    let auxSize: Size = {
      height: 180,
      width: 240
    };
    let auxType: image.AuxiliaryPictureType = AuxiliaryPictureType;
    let auxPictureObj: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
    console.info(TAG, testName, `createAuxiliaryPicture success`,JSON.stringify(auxPictureObj));
    if (auxPictureObj != undefined) {
      let type: image.AuxiliaryPictureType = auxPictureObj.getType();
      console.info(TAG,'Success get auxiliary picture type ' +  JSON.stringify(type));
      callback(type);
    } else {
      console.error(TAG,'Failed get auxiliary picture type ');
    }
    auxPictureObj.release();
    done();
  } catch (error) {
    console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
    expect().assertFail();
    done();
  }
}
export default function PictureGetTypeTestSupp() {
  describe('PictureGetTypeTestSupp', () => {

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
     * @tc.number   SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_001
     * @tc.name     SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_001
     * @tc.desc     Auxiliary getType
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_001';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType = 1;
      await getAuxiliaryTypeTest(done, testName, path, AuxiliaryPictureType, (res:image.AuxiliaryPictureType) => {
        expect(res).assertEqual(1);
      });
    })

    /**
     * @tc.number   SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_002
     * @tc.name     SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_002
     * @tc.desc     Auxiliary getType
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_002';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType = 2;
      await getAuxiliaryTypeTest(done, testName, path, AuxiliaryPictureType, (res:image.AuxiliaryPictureType) => {
        expect(res).assertEqual(2);
      });
    })

    /**
     * @tc.number   SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_003
     * @tc.name     SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_003
     * @tc.desc     Auxiliary getType
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_003';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType = 3;
      await getAuxiliaryTypeTest(done, testName, path, AuxiliaryPictureType, (res:image.AuxiliaryPictureType) => {
        expect(res).assertEqual(3);
      });
    })

    /**
     * @tc.number   SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_004
     * @tc.name     SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_004
     * @tc.desc     Auxiliary getType
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_004';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType = 4;
      await getAuxiliaryTypeTest(done, testName, path, AuxiliaryPictureType, (res:image.AuxiliaryPictureType) => {
        expect(res).assertEqual(4);
      });
    })

    /**
     * @tc.number   SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_005
     * @tc.name     SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_005
     * @tc.desc     Auxiliary getType
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AUXILIARY_PICTURE_GET_TYPE_005';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType = 5;
      await getAuxiliaryTypeTest(done, testName, path, AuxiliaryPictureType, (res:image.AuxiliaryPictureType) => {
        expect(res).assertEqual(5);
      });
    })


  })
}