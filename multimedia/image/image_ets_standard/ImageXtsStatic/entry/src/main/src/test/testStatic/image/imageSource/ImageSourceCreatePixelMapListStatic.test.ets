'use static'
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level ,Hypium} from '../../../../../../hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import { fileIo as fs } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';

const TAG = 'ImageSource.createPixelMapListStatic'
let fdNumber: int = 0;

function sleep(ms: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => {
      resolve(0);
    }, ms);
  });
}

let isEmpty = (data: Object | undefined | null) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

async function getFd(fileName: string) {
  let context: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd;
  console.info(TAG, "image case open fd success " + fdNumber);
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi!.getImageInfoSync()));
  return imageSourceApi!;
}

export default function ImageSourceCreatePixelMapListSuppStatic(): void {
  describe('ImageSourceCreatePixelMapListSuppStatic', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      await sleep(500);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(500)
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0100
     * @tc.desc   ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0100';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try{
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0200
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0200
     * @tc.desc   ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0200';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try{
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG, testName,'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        console.error(TAG, testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0300
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0300
     * @tc.desc   ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0300';
      let decodeOpts: image.DecodingOptions = {
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try{
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0400
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0400
     * @tc.desc   ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0400';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_empty_2.png');
      try{
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0500
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0500
     * @tc.desc   ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0500';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v3.webp');
      try{
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0600
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0600
     * @tc.desc   ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_Supp_Static_0600';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('moving_test_loop0.gif');
      // const imageSourceApi = await getImageSource('test6.gif')
      try{
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0100
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0100';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try{
      imageSourceApi.createPixelMapList({}, (err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        } else if (pixelMapList != null && pixelMapList != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0200
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0200
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0200';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try{
      imageSourceApi.createPixelMapList({}, (err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        } else if (pixelMapList != null && pixelMapList != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0300
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0300
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0300';
      const imageSourceApi = await getImageSource('test_exif_v3.webp');
      try{
      imageSourceApi.createPixelMapList({}, (err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        } else if (pixelMapList != null && pixelMapList != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0400
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0400
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0400';
      const imageSourceApi = await getImageSource('test_exif_v4.heic');
      // const imageSourceApi = await getImageSource('C027.heic')
      try{
      imageSourceApi.createPixelMapList({}, (err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code == 62980118 ).assertTrue();
        } else if (pixelMapList != null && pixelMapList != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertFalse();
        }
        done();
      })
    }catch (error) {
      console.error(TAG, testName, ' setBlob error', error.message, error.code);
      expect().assertFail();
    }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0500
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0500
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0500';
      // const imageSourceApi = await getImageSource('test_exif_empty_2.png');
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try{
      imageSourceApi.createPixelMapList({}, (err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        } else if (pixelMapList != null && pixelMapList != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    }catch (error) {
      console.error(TAG, testName, ' setBlob error', error.message, error.code);
      expect().assertFail();
    }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0600
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0600
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_Supp_Static_0600';
      const imageSourceApi = await getImageSource('moving_test_loop0.gif');
      // const imageSourceApi = await getImageSource('test6.gif');
      try{
      imageSourceApi.createPixelMapList({}, (err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else if (pixelMapList != null && pixelMapList != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0100
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0100';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        imageSourceApi.createPixelMapList(decodeOpts,
          (err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
              expect(err.code).assertFalse();
            } else if (pixelMapList != null && pixelMapList != undefined) {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              expect(pixelMapList.length > 0).assertTrue();
            }
            done();
          })
      } catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0200
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0200
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0200';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try{
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else if (pixelMapList != null && pixelMapList != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    }catch (error) {
      console.error(TAG, testName, ' setBlob error', error.message, error.code);
      expect().assertFail();
    }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0300
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0300
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0300';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v4.heic');
      try{
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code == 62980118).assertTrue();
        } else if (pixelMapList != null && pixelMapList != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertFalse();
        }
        done();
      })
    }catch (error) {
      console.error(TAG, testName, ' setBlob error', error.message, error.code);
      expect().assertFail();
    }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0400
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0400
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0400';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_empty_2.png');
      try{
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else if (pixelMapList != null && pixelMapList != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0500
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0500
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0500';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('moving_test_loop0.gif');
      try {
        imageSourceApi.createPixelMapList(decodeOpts,
          (err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
              expect(err.code).assertFalse();
            } else if (pixelMapList != null && pixelMapList != undefined) {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              expect(pixelMapList.length > 0).assertTrue();
            }
          })
      } catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0600
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0600
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_Sup_Static_0600';
      let decodeOpts: image.DecodingOptions = {
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try{
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else if (pixelMapList != null && pixelMapList != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_08000
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_08000
     * @tc.desc       createPixelMap options: desiredPixelFormat ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_08000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_08000';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.createPixelMap(decodeOpts, (err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
          if (err) {
            console.error(TAG, testName, `Failed to create pixelMap object, error code is ${err},${err.code}`);
            expect(err.code).assertFalse();
          } else if (pixelMap != null && pixelMap != undefined) {
            console.info(TAG, testName, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
            expect(pixelMap != undefined).assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0200
     * @tc.desc       createPixelMap options: desiredPixelFormat BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0200';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.createPixelMap(decodeOpts, (err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
          if (err) {
            console.error(TAG, testName, `Failed to create pixelMap object, error code is ${err},${err.code}`);
            expect(err.code).assertFalse();
          } else if (pixelMap != null && pixelMap != undefined) {
            console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelMap);
            expect(pixelMap != undefined).assertTrue();
          }
        })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0300
     * @tc.desc       createPixelMap options: desiredPixelFormat RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0300';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try{
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect().assertFail();
        } else if (pixelMap != null && pixelMap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    }catch (error) {
      console.error(TAG, testName, ' setBlob error', error.message, error.code);
      expect().assertFail();
    }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0400
     * @tc.desc       createPixelMap options: desiredPixelFormat NV21
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0400';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try{
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect().assertFail();
        } else if (pixelMap != null && pixelMap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    }catch (error) {
      console.error(TAG, testName, ' setBlob error', error.message, error.code);
      expect().assertFail();
    }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0500
     * @tc.desc       createPixelMap options: desiredPixelFormat NV12
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0500';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try{
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else if (pixelMap != null && pixelMap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    }catch (error) {
      console.error(TAG, testName, ' setBlob error', error.message, error.code);
      expect().assertFail();
    }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0600
     * @tc.desc       createPixelMap options: desiredPixelFormat RGBA_1010102
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0600';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try{
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else if (pixelMap != null && pixelMap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    }catch (error) {
      console.error(TAG, testName, ' setBlob error', error.message, error.code);
      expect().assertFail();
    }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0700
     * @tc.desc       createPixelMap options: desiredPixelFormat YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0700';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try{
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else if (pixelMap != null && pixelMap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    }catch (error) {
      console.error(TAG, testName, ' setBlob error', error.message, error.code);
      expect().assertFail();
    }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0800
     * @tc.desc       createPixelMap options: desiredPixelFormat YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0800';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.YCRCB_P010,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try{
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else if (pixelMap != null && pixelMap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    }catch (error) {
      console.error(TAG, testName, ' setBlob error', error.message, error.code);
      expect().assertFail();
    }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0900
     * @tc.desc       createPixelMap options: desiredPixelFormat ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_Supp_static_0900';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try{
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else if (pixelMap != null && pixelMap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_Supp_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_Supp_static_0100
     * @tc.desc       createPixelMap options: desiredDynamicRange AUTO
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_Supp_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_Supp_static_0100';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.AUTO,
      };
      try{
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
            expect(err.code).assertFalse();
          } else if (pixelMap != null && pixelMap != undefined) {
            console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
            expect(pixelMap!=undefined).assertTrue();
          }
          imageSourceApi.release();
          done();
        })
      }catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_Supp_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_Supp_static_0200
     * @tc.desc       createPixelMap options: desiredDynamicRange HDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_Supp_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_Supp_static_0200';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.HDR,
      };
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.createPixelMap(decodeOpts, (err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
          if (err) {
            console.error(TAG, testName, `Failed to create pixelMap object, error code is ${err},${err.code}`);
            expect(err.code).assertFalse();
          } else if (pixelMap != null && pixelMap != undefined) {
            console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelMap);
            expect(pixelMap != undefined).assertTrue();
          }
          imageSourceApi.release();
          done();
        })
      } catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_Supp_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_Supp_static_0300
     * @tc.desc       createPixelMap options: desiredDynamicRange SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_Supp_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_Supp_static_0300';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.SDR,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.createPixelMap(decodeOpts, (err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
          if (err) {
            console.error(TAG, testName, `Failed to create pixelMap object, error code is ${err},${err.code}`);
            expect(err.code).assertFalse();
          } else if (pixelMap != null && pixelMap != undefined) {
            console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelMap);
            expect(pixelMap != undefined).assertTrue();
          }
          imageSourceApi.release();
          done();
        })
      } catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      }
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_10000
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_10000
     * @tc.desc       createPixelMapUsingAllocator options editable:false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_10000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_10000';
      let decodeOpts: image.DecodingOptions = {
        editable: false,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = await imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',JSON.stringify(pixelmap));
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_10000
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_10000
     * @tc.desc       createPixelMapUsingAllocator options isEditable:true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_10000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_10000';
      let decodeOpts: image.DecodingOptions = {
        editable: true,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = await imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',JSON.stringify(pixelmap));
          expect(pixelmap.isEditable).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0200
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0200';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = await imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0300
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0300';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap =await imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0400
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0400';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = await imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0500
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0500';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = await imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect().assertFail();
        } else {
          console.error(TAG,testName,`Failed to createPixelMapUsingAllocator pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect(Number(err.code)).assertEqual(7700301);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0600
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0600';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap =await  imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0700
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.NV21
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0700';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap =await imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0800
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.RGBA_1010102
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0800';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = await imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0900
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_0900';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = await imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_1000
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_1000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_1000';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = await imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })



    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_1100
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_1100
     * @tc.desc       createPixelMapUsingAllocator options desiredDynamicRange: image.desiredDynamicRange.SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_1100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_1100';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.SDR,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = await imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_1200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_1200
     * @tc.desc       createPixelMapUsingAllocator options desiredDynamicRange: image.desiredDynamicRange.AUTO
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_1200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_Supp_static_1200';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.AUTO,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = await imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_10000
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_10000
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_10000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_10000';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName,'Succeeded in creating pixelMap object.');
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName,'Failed to create pixelMap.');
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0200
     * @tc.desc       createPixelMapSync options desiredPixelFormat:image.PixelMapFormat.ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0200';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0300
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0300';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0400
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0400';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect().assertFail();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `,pixelmap);
          expect(pixelmap).assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0500
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0500';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0600
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.NV21
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0600';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0700
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.RGBA_1010102
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0700';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0800
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0800';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0900
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_0900';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1000
     * @tc.desc       createPixelMapSync options desiredDynamicRange: SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1000';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.SDR,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1100
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1100
     * @tc.desc       createPixelMapSync options cropAndScaleStrategy: SCALE_FIRST
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1100';
      let decodeOpts: image.DecodingOptions = {
        cropAndScaleStrategy: image.CropAndScaleStrategy.SCALE_FIRST,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect().assertFail();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `,pixelmap);
          expect(pixelmap).assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1200
     * @tc.desc       createPixelMapSync options cropAndScaleStrategy: CROP_FIRST
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1200';
      let decodeOpts: image.DecodingOptions = {
        cropAndScaleStrategy: image.CropAndScaleStrategy.CROP_FIRST,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect().assertFail();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect(pixelmap).assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1300
     * @tc.desc       createPixelMapSync : pixelmap.isStrideAlignment cover false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1300';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelmap.isStrideAlignment is false.', pixelmap.isStrideAlignment);
          expect(pixelmap.isStrideAlignment).assertFalse();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1400
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1400
     * @tc.desc       createPixelMapSync : pixelmap.isEditable cover false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1400';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v3.webp');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelmap.isEditable is true.', pixelmap.isEditable);
          expect(pixelmap.isEditable).assertFalse();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1500
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1500
     * @tc.desc       createPixelMapSync : pixelmap.isEditable cover true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_Supp_static_1500';
      let decodeOpts: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v3.webp');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelmap.isEditable is: ', pixelmap.isEditable);
          expect(pixelmap.isEditable).assertTrue();
          await pixelmap.release();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
  });
}