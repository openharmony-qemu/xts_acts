'use static';
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level} from '../../../../../../hypium';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';

const TAG =  'Static_setAuxiliaryPictureTest';
let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;

async function setAuxiliaryPictureTest(done: () => void, testName: string, path: string, callback: (PictureObj: image.Picture) => Promise<void>)  {
    let pathUri = `file://${testContext.filesDir}/${path}`;
    let imageSource: image.ImageSource |undefined = image.createImageSource(pathUri);
    console.info(TAG, testName, 'succeed createImageSource', imageSource!);
    let PictureObj: image.Picture | undefined = await imageSource!.createPicture();
    console.info(TAG, testName, 'succeed createPicture', PictureObj!);
    if (PictureObj != null) {
      callback(PictureObj);
    }else{
      console.error(TAG, testName, 'imageSource!.createPicture is null.');
      expect().assertFail();
      done();
  }
  await sourceRelease(imageSource!, PictureObj!);
  console.info(TAG, testName, 'done');
  done();
}

async function sourceRelease(imageSource: image.ImageSource |undefined, PictureObj: image.Picture | undefined): Promise<void> {
  await imageSource!.release();
  await PictureObj!.release();
}

export default function ImageSetAuxiliaryPictureStaticTest(): void {
  describe('ImageSetAuxiliaryPictureStaticTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0100
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0100';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
    try {
      await setAuxiliaryPictureTest(done, testName, path,  async (PictureObj: image.Picture) => {
        let auxPictureObj: image.AuxiliaryPicture | null = await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
        console.info(TAG, testName, 'succeed', JSON.stringify(auxPictureObj!));
        await PictureObj.setAuxiliaryPicture(AuxiliaryPictureType, auxPictureObj!);
        console.info(TAG, testName, 'setAuxiliaryPicture success.',);
        let lastObj: image.AuxiliaryPicture | null = await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
        console.info(TAG, testName, 'lastObj getAuxiliaryPicture success.',JSON.stringify(lastObj!.getType()));
        expect(lastObj!.getType()).assertEqual(3);
      })
    } catch (error) {
      console.info(TAG, testName, `failed; error: ${error},${error.code}`);
      expect().assertFail();
    }
      console.info(TAG, testName, 'done');
      done();
     return;
  })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0200
     * @tc.number SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0200
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0200';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      try {
        await setAuxiliaryPictureTest(done, testName, path,  async (PictureObj:image.Picture) => {
          let auxPictureObj: image.AuxiliaryPicture | null = await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
          console.info(TAG, testName, 'succeed', JSON.stringify(auxPictureObj));
          await PictureObj.setAuxiliaryPicture(AuxiliaryPictureType, auxPictureObj!);
          console.info(TAG,testName, 'setAuxiliaryPicture success.', );
          let lastObj: image.AuxiliaryPicture | null = await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
          console.info(TAG, testName, 'lastObj getAuxiliaryPicture success.',JSON.stringify(lastObj!.getType()));
          expect(lastObj!.getType()).assertEqual(5);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      console.info(TAG, testName, 'done');
      done();
      return;
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0300
     * @tc.number SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0300
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0300';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        await setAuxiliaryPictureTest(done, testName, path,  async (PictureObj: image.Picture) => {
          let auxPictureObj:  image.AuxiliaryPicture | null = await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
          console.info(TAG, testName, 'succeed', JSON.stringify(auxPictureObj!));
          await PictureObj.setAuxiliaryPicture(AuxiliaryPictureType, auxPictureObj!);
          console.info(TAG,testName, 'setAuxiliaryPicture success.', );
          let lastObj: image.AuxiliaryPicture | null = await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
          console.info(TAG, testName, 'lastObj getAuxiliaryPicture success.',JSON.stringify(lastObj!.getType()));
          expect(lastObj!.getType()).assertEqual(AuxiliaryPictureType);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      console.info(TAG, testName, 'done');
      done();
      return;
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0400
     * @tc.number SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0400
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0400';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      try {
        await setAuxiliaryPictureTest(done, testName, path,  async (PictureObj: image.Picture) => {
          let auxPictureObj:  image.AuxiliaryPicture | null = await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
          console.info(TAG, testName, 'succeed', JSON.stringify(auxPictureObj!));
          await PictureObj.setAuxiliaryPicture(AuxiliaryPictureType, auxPictureObj!);
          console.info(TAG,testName, 'setAuxiliaryPicture success.', );
          let lastObj: image.AuxiliaryPicture | null = await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
          console.info(TAG, testName, 'lastObj getAuxiliaryPicture success.',JSON.stringify(lastObj!.getType()));
          expect(lastObj!.getType()).assertEqual(AuxiliaryPictureType);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      console.info(TAG, testName, 'done');
      done();
      return;
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0500
     * @tc.number SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0500
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_setAuxiliaryPicture_promise_Static_0500';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      try {
        await setAuxiliaryPictureTest(done, testName, path,  async (PictureObj: image.Picture) => {
          let auxPictureObj:  image.AuxiliaryPicture | null = await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
          console.info(TAG, testName, 'succeed', JSON.stringify(auxPictureObj!));
          await PictureObj.setAuxiliaryPicture(AuxiliaryPictureType, auxPictureObj!);
          console.info(TAG,testName, 'setAuxiliaryPicture success.', );
          let lastObj: image.AuxiliaryPicture | null = await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
          console.info(TAG, testName, 'lastObj getAuxiliaryPicture success.',JSON.stringify(lastObj!.getType()));
          expect(lastObj!.getType()).assertEqual(AuxiliaryPictureType);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      console.info(TAG, testName, 'done');
      done();
      return;
    })


  })
}