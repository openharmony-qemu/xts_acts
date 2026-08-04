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

import { Context } from '@kit.AbilityKit';
import {afterAll,afterEach,beforeAll,beforeEach,describe,expect,Hypium, it, Level } from '../../../../../../hypium/index';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'xts.getImageInfo';

async function getImageInfoIndexCallbackTest(done: () => void, testName: string, pathUri: string, index: int) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  imageSourceApi!.getImageInfo(index, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
    if (error) {
      console.error(TAG, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
      expect().assertFail();
    } else {
      expect(JSON.stringify(imageInfo) !== undefined).assertTrue();
    }
    done();
  })
}

async function getImageInfoCallbackTest(done: () => void, testName: string, pathUri: string) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  imageSourceApi!.getImageInfo((error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
    imageSourceApi!.release();
    if (error) {
      console.error(TAG, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
      expect().assertFail();
    } else {
      expect(JSON.stringify(imageInfo) !== undefined).assertTrue();
    }
    done();
  })
}

async function getImageInfoPromiseTest(done: () => void, testName: string, pathUri: string, index?: int) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  const imageInfo: image.ImageInfo | undefined = await imageSourceApi!.getImageInfo(index)
  imageSourceApi!.release();
  expect(imageInfo !== undefined).assertTrue()
  done();

}

async function getImageInfoSyncPromiseTest(done: () => void, testName: string, pathUri: string, index?: int) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(index);
  if (imageInfo == undefined) {
    console.error(TAG, 'Failed to obtain the image information.');
    expect().assertFail();
    done();
  } else {
    console.info(TAG, 'Succeeded in obtaining the image information.');
    console.info(TAG, 'imageInfo!.size.height:' + imageInfo!.size.height);
    console.info(TAG, 'imageInfo!.size.width:' + imageInfo!.size.width);
    done();
  }
}

async function getImageSource(pathUri: string): Promise<image.ImageSource> {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi!.getImageInfoSync()));
  return imageSourceApi!;
}

export default function ImageSourceGetImageInfoTest(): void {
  describe('ImageSourceGetImageInfoTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0100
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0100
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0100';
      const path = 'test.svg';
      const index: int = 0;
      try {
        await getImageInfoIndexCallbackTest(done, testName, path, index);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0200
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0200
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0200';
      const path = 'test.jpg';
      const index: int = 0;
      try {
        await getImageInfoIndexCallbackTest(done, testName, path, index);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0300
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0300
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0300';
      const path = 'test.svg';
      try {
        await getImageInfoCallbackTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0400
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0400
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_callback_static_0400';
      const path = 'test.jpg';
      try {
        await getImageInfoCallbackTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0100
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0100
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0100';
      const path = 'test.svg';
      const index: int = 0;
      try {
        await getImageInfoPromiseTest(done, testName, path, index);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0200
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0200
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0200';
      const path = 'test.jpg';
      const index: int = 0;
      try {
        await getImageInfoPromiseTest(done, testName, path, index);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0300
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0300
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0300';
      const path = 'test.svg';
      try {
        await getImageInfoPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0400
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0400
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0400';
      const path = 'test.jpg';
      try {
        await getImageInfoPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0100
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0100
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0100';
      const path = 'test.jpg';
      try {
        await getImageInfoPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0200
     * @tc.desc       getImageInfo cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0200';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.size.width);
        expect(imageInfo!.size.width).assertEqual(472);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0300
     * @tc.desc       getImageInfo cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0300';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.size.height);
        expect(imageInfo!.size.height).assertEqual(226);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0400
     * @tc.desc       getImageInfo cover return alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0400';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.alphaType);
        expect(imageInfo!.alphaType).assertEqual(0);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0500
     * @tc.desc       getImageInfo cover return pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0500';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.pixelFormat);
        expect(imageInfo!.pixelFormat).assertEqual(0);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0600
     * @tc.desc       getImageInfo cover return density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0600';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.density);
        expect(imageInfo!.density).assertEqual(0);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0700
     * @tc.desc       getImageInfo cover return UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0700';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.pixelFormat);
        expect(imageInfo!.pixelFormat).assertEqual(image.PixelMapFormat.UNKNOWN);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0800
     * @tc.desc       getImageInfo cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0800';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.size.width);
        expect(imageInfo!.size.width).assertEqual(472);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0900
     * @tc.desc       getImageInfo cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_0900';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.size.height);
        expect(imageInfo!.size.height).assertEqual(75);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1000
     * @tc.desc       getImageInfo cover return alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1000';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.alphaType);
        expect(imageInfo!.alphaType).assertEqual(0);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1100
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1100
     * @tc.desc       getImageInfo cover return pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1100';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.pixelFormat);
        expect(imageInfo!.pixelFormat).assertEqual(0);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1200
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1200
     * @tc.desc       getImageInfo cover return density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1200';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.density);
        expect(imageInfo!.density).assertEqual(0);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1300
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1300
     * @tc.desc       getImageInfo cover return UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1300';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.pixelFormat);
        expect(imageInfo!.pixelFormat).assertEqual(image.PixelMapFormat.UNKNOWN);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1400
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1400
     * @tc.desc       getImageInfo cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1400';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.size.width);
        expect(imageInfo!.size.width).assertEqual(286);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1500
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1500
     * @tc.desc       getImageInfo cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1500';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.size.height);
        expect(imageInfo!.size.height).assertEqual(221);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1600
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1600
     * @tc.desc       getImageInfo cover return alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1600';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.alphaType);
        expect(imageInfo!.alphaType).assertEqual(0);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1700
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1700
     * @tc.desc       getImageInfo cover return pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1700';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.pixelFormat);
        expect(imageInfo!.pixelFormat).assertEqual(0);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1800
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1800
     * @tc.desc       getImageInfo cover return density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1800';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.density);
        expect(imageInfo!.density).assertEqual(0);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1900
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1900
     * @tc.desc       getImageInfo cover return UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_1900';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo | undefined) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo!.pixelFormat);
        expect(imageInfo!.pixelFormat).assertEqual(image.PixelMapFormat.UNKNOWN);
        done();
      }).catch((error: Error) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2000
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2000
     * @tc.desc       getImageInfo cover density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2000';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo(0, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.density);
            expect(imageInfo!.density).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2100
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2100
     * @tc.desc       getImageInfo cover stride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2100';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo(0, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.stride);
            expect(imageInfo!.stride).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2200
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2200
     * @tc.desc       getImageInfo cover pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2200';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo(0, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.pixelFormat);
            expect(imageInfo!.pixelFormat).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2300
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2300
     * @tc.desc       getImageInfo cover alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2300';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo(0, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.alphaType);
            expect(imageInfo!.alphaType).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2400
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2400
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2400';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.size.height);
            expect(imageInfo!.size.height).assertEqual(226);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2500
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2500
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2500';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.size.width);
            expect(imageInfo!.size.width).assertEqual(472);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2600
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2600
     * @tc.desc       getImageInfo cover density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2600';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.density);
            expect(imageInfo!.density).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2700
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2700
     * @tc.desc       getImageInfo cover stride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2700';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.stride);
            expect(imageInfo!.stride).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2800
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2800
     * @tc.desc       getImageInfo cover pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2800';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.pixelFormat);
            expect(imageInfo!.pixelFormat).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2900
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2900
     * @tc.desc       getImageInfo cover alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_2900';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.alphaType);
            expect(imageInfo!.alphaType).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3000
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3000
     * @tc.desc       getImageInfo cover density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3000';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo(0, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.density);
            expect(imageInfo!.density).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3100
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3100
     * @tc.desc       getImageInfo cover stride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3100';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo(0, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.stride);
            expect(imageInfo!.stride).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3200
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3200
     * @tc.desc       getImageInfo cover pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3200';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo(0, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.pixelFormat);
            expect(imageInfo!.pixelFormat).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3300
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3300
     * @tc.desc       getImageInfo cover alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3300';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo(0, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.alphaType);
            expect(imageInfo!.alphaType).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3400
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3400
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3400';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.size.height);
            expect(imageInfo!.size.height).assertEqual(75);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3500
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3500
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3500';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.size.width);
            expect(imageInfo!.size.width).assertEqual(472);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3600
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3600
     * @tc.desc       getImageInfo cover density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3600';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.density);
            expect(imageInfo!.density).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3700
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3700
     * @tc.desc       getImageInfo cover stride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3700';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.stride);
            expect(imageInfo!.stride).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3800
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3800
     * @tc.desc       getImageInfo cover pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3800';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.pixelFormat);
            expect(imageInfo!.pixelFormat).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3900
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3900
     * @tc.desc       getImageInfo cover alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_3900';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.alphaType);
            expect(imageInfo!.alphaType).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4000
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4000
     * @tc.desc       getImageInfo cover density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4000';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo(0, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.density);
            expect(imageInfo!.density).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4100
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4100
     * @tc.desc       getImageInfo cover stride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4100';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo(0, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.stride);
            expect(imageInfo!.stride).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4200
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4200
     * @tc.desc       getImageInfo cover pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4200';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo(0, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.pixelFormat);
            expect(imageInfo!.pixelFormat).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4300
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4300
     * @tc.desc       getImageInfo cover alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4300';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo(0, (error: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.alphaType);
            expect(imageInfo!.alphaType).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4400
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4400
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4400';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.size.height);
            expect(imageInfo!.size.height).assertEqual(221);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4500
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4500
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4500';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.size.width);
            expect(imageInfo!.size.width).assertEqual(286);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4600
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4600
     * @tc.desc       getImageInfo cover density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4600';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.density);
            expect(imageInfo!.density).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4700
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4700
     * @tc.desc       getImageInfo cover stride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4700';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.stride);
            expect(imageInfo!.stride).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4800
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4800
     * @tc.desc       getImageInfo cover pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4800';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.pixelFormat);
            expect(imageInfo!.pixelFormat).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4900
     * @tc.name       SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4900
     * @tc.desc       getImageInfo cover alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfo_static_4900';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo!.alphaType);
            expect(imageInfo!.alphaType).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}