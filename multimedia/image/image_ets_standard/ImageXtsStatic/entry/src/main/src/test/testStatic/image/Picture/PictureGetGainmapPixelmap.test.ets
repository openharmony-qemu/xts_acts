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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level} from '../../../../../../hypium/index';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';

const TAG =  'getGainmapPixelmapStaticSupp';

async function getGainmapPixelmapPromiseTest(done: () => void, testName: string, path: string, callback: (PictureObj: image.Picture ) => void) {
  try {
    console.info(TAG, testName, `getGainmapPixelmapAbnormalPromiseTest start`);
    let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
    let uri = `file://${testContext.filesDir}/${path}`;
    console.info(TAG, testName, `createImageSource start`);
    let imageSource: image.ImageSource = image.createImageSource(uri)!;
    console.info(TAG, testName, `imageSource: ${JSON.stringify(imageSource)}`);
    let commodityPixelMap: image.PixelMap | undefined = await imageSource!.createPixelMap();
    console.info(TAG, testName, `commodityPixelMap: ${JSON.stringify(commodityPixelMap)}`);
    let PictureObj: image.Picture = await image.createPicture(commodityPixelMap!) as image.Picture;
    console.info(TAG, testName, `PictureObj:`,JSON.stringify(PictureObj));
    if (PictureObj != null) {
      callback(PictureObj);
      done();
    } else {
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function PictureGetGainmapPixelmapTest(): void {
  describe('PictureGetGainmapPixelmapTest', () => {

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
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_Supp_Static_0001
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_Supp_Static_0001
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_Supp_Static_0001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_Supp_Static_0001';
      const path = 'AllAuxiliaryPictures.jpg';
      await getGainmapPixelmapPromiseTest(done, testName, path, (PictureObj: image.Picture) => {
        let gainPixelmap: image.PixelMap | null = PictureObj.getGainmapPixelmap();
        console.info(TAG, testName, `gainPixelmap:`,JSON.stringify(gainPixelmap));
        expect(gainPixelmap).assertNull();
      });
    })





    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0001
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0001
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0001';
      const path = 'test_exif_v2.jpg';
      await getGainmapPixelmapPromiseTest(done, testName, path, (PictureObj: image.Picture) => {
        let gainPixelmap: image.PixelMap | null = PictureObj.getGainmapPixelmap();
        console.info(TAG, testName, `gainPixelmap:`,JSON.stringify(gainPixelmap));
        expect(gainPixelmap).assertNull();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0002
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0002
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0002', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0002';
      const path = 'test6.gif';
      await getGainmapPixelmapPromiseTest(done, testName, path, (PictureObj: image.Picture) => {
        let gainPixelmap: image.PixelMap | null = PictureObj.getGainmapPixelmap();
        console.info(TAG, testName, `gainPixelmap:`,JSON.stringify(gainPixelmap));
        expect(gainPixelmap).assertNull();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0003
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0003
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0003', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0003';
      const path = 'test_aisr.ico';
      await getGainmapPixelmapPromiseTest(done, testName, path, (PictureObj: image.Picture) => {
        let gainPixelmap: image.PixelMap | null = PictureObj.getGainmapPixelmap();
        console.info(TAG, testName, `gainPixelmap:`,JSON.stringify(gainPixelmap));
        expect(gainPixelmap).assertNull();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0004
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0004
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0004', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0004';
      const path = 'test.jpeg';
      await getGainmapPixelmapPromiseTest(done, testName, path, (PictureObj: image.Picture) => {
        let gainPixelmap: image.PixelMap | null = PictureObj.getGainmapPixelmap();
        console.info(TAG, testName, `gainPixelmap:`,JSON.stringify(gainPixelmap));
        expect(gainPixelmap).assertNull();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0005
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0005
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0005', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0005';
      const path = 'test.jpg';
      await getGainmapPixelmapPromiseTest(done, testName, path, (PictureObj: image.Picture) => {
        let gainPixelmap: image.PixelMap | null = PictureObj.getGainmapPixelmap();
        console.info(TAG, testName, `gainPixelmap:`,JSON.stringify(gainPixelmap));
        expect(gainPixelmap).assertNull();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0006
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0006
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0006', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0006';
      const path = 'test.png';
      await getGainmapPixelmapPromiseTest(done, testName, path, (PictureObj: image.Picture) => {
        let gainPixelmap: image.PixelMap | null = PictureObj.getGainmapPixelmap();
        console.info(TAG, testName, `gainPixelmap:`,JSON.stringify(gainPixelmap));
        expect(gainPixelmap).assertNull();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0007
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0007
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0007', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0007';
      const path = 'test.svg';
      await getGainmapPixelmapPromiseTest(done, testName, path, (PictureObj: image.Picture) => {
        let gainPixelmap: image.PixelMap | null = PictureObj.getGainmapPixelmap();
        console.info(TAG, testName, `gainPixelmap:`,JSON.stringify(gainPixelmap));
        expect(gainPixelmap).assertNull();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0008
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0008
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0008', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_AbNormal_Supp_Static_0008';
      const path = 'test_exif_v3.webp';
      await getGainmapPixelmapPromiseTest(done, testName, path, (PictureObj: image.Picture) => {
        let gainPixelmap: image.PixelMap | null = PictureObj.getGainmapPixelmap();
        console.info(TAG, testName, `gainPixelmap:`,JSON.stringify(gainPixelmap));
        expect(gainPixelmap).assertNull();
      })
    })

  })
}