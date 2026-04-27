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
import fs from '@ohos.file.fs';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '../../../../../hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
const TAG = 'xts_static_ImageSourceTest'


export default function ImageSourceTest(): void {
  describe('ImageSourceTest', () => {
    let filePath: string = '';
    let fdNumber: int;
    const getFd = (fileName: string): int => {
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      filePath = testContext.filesDir + "/" + fileName;
      console.info(TAG, "image filePath:" + filePath);
      const file = fs.openSync(filePath!);
      fdNumber = file.fd as int;
      return fdNumber;
    };
    const getFilePath = async (fileName: string): Promise<string> => {
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      filePath = testContext.filesDir + "/" + fileName;
      return filePath;
    }
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
     * @tc.number    SUB_MEDIA_IMAGE_GET_IMAGE_INFO_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_GET_IMAGE_INFO_STATIC_0100
     * @tc.desc      getImageInfo cover size density stride pixelFormat alphaType mimeType isHdr
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_GET_IMAGE_INFO_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        let res = await imageSourceObj!.getImageInfo(0);
        console.info(TAG, testName, 'succeed in get imageInfo', JSON.stringify(res));
        expect(res!.size.width).assertEqual(472);
        expect(res!.size.height).assertEqual(226);
        expect(res!.density).assertEqual(0);
        expect(res!.stride).assertEqual(0);
        expect(res!.pixelFormat).assertEqual(0);
        expect(res!.alphaType).assertEqual(0);
        await imageSourceObj!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_STATIC_0100
     * @tc.desc      getImageInfoSync cover size density stride pixelFormat alphaType mimeType isHdr
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        let res = imageSourceObj!.getImageInfoSync(0);
        console.info(TAG, testName, 'succeed in get imageInfo', JSON.stringify(res));
        expect(res!.size.width).assertEqual(472);
        expect(res!.size.height).assertEqual(226);
        expect(res!.density).assertEqual(0);
        expect(res!.stride).assertEqual(0);
        expect(res!.pixelFormat).assertEqual(0);
        expect(res!.alphaType).assertEqual(0);
        expect(res!.mimeType).assertEqual('image/jpeg');
        expect(res!.isHdr).assertFalse();
        await imageSourceObj!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_PROMISE_STATIC_0100
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_PROMISE_STATIC_0100
     * @tc.desc       createPixelMap cover PixelMapFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_PROMISE_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_PROMISE_STATIC_0100';
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      const formats = [
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888
      ];
      for (const format of formats) {
        try {
          let decodeOpts: image.DecodingOptions = {
            sampleSize: 1,
            editable: false,
            desiredSize: { width: 198, height: 202 },
            desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
            desiredPixelFormat: format,
            index: 0,
          };
          const pixelMap = await imageSourceObj!.createPixelMap(decodeOpts);
          expect(pixelMap != undefined).assertTrue();
          expect(pixelMap!.isEditable).assertFalse();
          expect(pixelMap!.isStrideAlignment).assertFalse();
          await pixelMap!.release();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_PROMISE_STATIC_0200
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_PROMISE_STATIC_0200
     * @tc.desc       createPixelMap-isEditable cover true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_PROMISE_STATIC_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_PROMISE_STATIC_0200';
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      const formats = [
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888
      ];
      for (const format of formats) {
        try {
          let decodeOpts: image.DecodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: { width: 198, height: 202 },
            desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
            rotate: 0,
            desiredPixelFormat: format,
            index: 0,
          };
          const pixelMap = await imageSourceObj!.createPixelMap(decodeOpts);
          expect(pixelMap!.isEditable).assertTrue();
          await pixelMap!.release();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_SYNC_STATIC_0100
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_SYNC_STATIC_0100
     * @tc.desc       createPixelMapSync cover PixelMapFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_SYNC_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_SYNC_STATIC_0100';
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      const formats = [
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888
      ];
      for (const format of formats) {
        try {
          let decodeOpts: image.DecodingOptions = {
            sampleSize: 1,
            editable: false,
            desiredSize: { width: 198, height: 202 },
            desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
            rotate: 0,
            desiredPixelFormat: format,
            index: 0,
          };
          const pixelMap = imageSourceObj!.createPixelMapSync(decodeOpts);
          expect(pixelMap != undefined).assertTrue();
          expect(pixelMap!.isEditable).assertFalse();
          expect(pixelMap!.isStrideAlignment).assertFalse();
          await pixelMap!.release();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_SYNC_STATIC_0200
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_SYNC_STATIC_0200
     * @tc.desc       createPixelMapSync-isEditable cover true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_SYNC_STATIC_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_SYNC_STATIC_0200';
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      const formats = [
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888
      ];
      for (const format of formats) {
        try {
          let decodeOpts: image.DecodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: { width: 198, height: 202 },
            desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
            rotate: 0,
            desiredPixelFormat: format,
            index: 0,
          };
          const pixelMap = imageSourceObj!.createPixelMapSync(decodeOpts);
          expect(pixelMap!.isEditable).assertTrue();
          await pixelMap!.release();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_CALLBACK_STATIC_0100
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_CALLBACK_STATIC_0100
     * @tc.desc       createPixelMap cover PixelMapFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_CALLBACK_STATIC_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_CALLBACK_STATIC_0100';
        let fd: int = getFd('test_exif_v2.jpg');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
        const formats = [
          image.PixelMapFormat.ARGB_8888,
          image.PixelMapFormat.NV21,
          image.PixelMapFormat.NV12,
          image.PixelMapFormat.UNKNOWN,
          image.PixelMapFormat.RGB_565,
          image.PixelMapFormat.RGBA_8888
        ];
        for (const format of formats) {
          try {
            let decodeOpts: image.DecodingOptions = {
              sampleSize: 1,
              editable: false,
              desiredSize: { width: 198, height: 202 },
              desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
              rotate: 0,
              desiredPixelFormat: format,
              index: 0,
            };
            imageSourceObj!.createPixelMap(decodeOpts,
              (err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
                expect(pixelMap != undefined).assertTrue();
                expect(pixelMap!.isEditable).assertFalse();
                expect(pixelMap!.isStrideAlignment).assertFalse();
                pixelMap!.release()
                  .then(() => {
                  });
              });
          } catch (error) {
            console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          }
        }
        done();
      })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_CALLBACK_STATIC_0200
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_CALLBACK_STATIC_0200
     * @tc.desc       createPixelMap-isEditable cover true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_CALLBACK_STATIC_0200', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_CALLBACK_STATIC_0200';
        let fd: int = getFd('test_exif_v2.jpg');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
        const formats = [
          image.PixelMapFormat.ARGB_8888,
          image.PixelMapFormat.NV21,
          image.PixelMapFormat.NV12,
          image.PixelMapFormat.UNKNOWN,
          image.PixelMapFormat.RGB_565,
          image.PixelMapFormat.RGBA_8888
        ];
        for (const format of formats) {
          try {
            let decodeOpts: image.DecodingOptions = {
              sampleSize: 1,
              editable: true,
              desiredSize: { width: 198, height: 202 },
              desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
              rotate: 0,
              desiredPixelFormat: format,
              index: 0,
            };
            imageSourceObj!.createPixelMap(decodeOpts,
              (err: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
                expect(pixelMap!.isEditable).assertTrue();
                pixelMap!.release()
                  .then(() => {
                  });
              });
            done();
          } catch (error) {
            console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          }
        }
        done();
      })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_LIST_STATIC_CALLBACK_0100
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_LIST_STATIC_CALLBACK_0100
     * @tc.desc       createPixelMapList cover PixelMapFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_LIST_STATIC_CALLBACK_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_LIST_STATIC_CALLBACK_0100';
        let fd: int = getFd('test_exif_v2.jpg');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
        const formats = [
          image.PixelMapFormat.ARGB_8888,
          image.PixelMapFormat.NV21,
          image.PixelMapFormat.NV12,
          image.PixelMapFormat.UNKNOWN,
          image.PixelMapFormat.RGB_565,
          image.PixelMapFormat.RGBA_8888
        ];
        for (const format of formats) {
          try {
            let decodeOpts: image.DecodingOptions = {
              sampleSize: 1,
              editable: true,
              desiredSize: { width: 198, height: 202 },
              desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
              rotate: 0,
              desiredPixelFormat: format,
              index: 0,
            };
            imageSourceObj!.createPixelMapList(decodeOpts, (error: BusinessError<void> | null, pixelMap) => {
              expect(pixelMap!.length > 0).assertTrue();
              imageSourceObj!.release()
                .then(() => {
                });
            });
            done();
          } catch (error) {
            console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          }
        }
        done();
      })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_GET_FRAME_COUNT_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_GET_FRAME_COUNT_STATIC_0100
     * @tc.desc      getFrameCount cover normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_FRAME_COUNT_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_GET_FRAME_COUNT_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        let res = await imageSourceObj!.getFrameCount();
        console.info(TAG, testName, JSON.stringify(res));
        expect(res != undefined).assertTrue();
        await imageSourceObj!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_GET_FRAME_COUNT_STATIC_0200
     * @tc.name      SUB_MEDIA_IMAGE_GET_FRAME_COUNT_STATIC_0200
     * @tc.desc      getFrameCount cover normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_FRAME_COUNT_STATIC_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_GET_FRAME_COUNT_STATIC_0200";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        imageSourceObj!.getFrameCount((error: BusinessError<void> | null, res: int | undefined) => {
          console.info(TAG, testName, JSON.stringify(res));
          expect(res != undefined).assertTrue();
          imageSourceObj!.release()
            .then(() => {
              done();
            });
        });
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_UPDATE_DATA_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_UPDATE_DATA_STATIC_0100
     * @tc.desc      updateData the second parameter cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_UPDATE_DATA_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_UPDATE_DATA_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      const array: ArrayBuffer = new ArrayBuffer(10000);
      try {
        imageSourceObj!.updateData(array, true, 0, 10, (error: BusinessError<void> | null, res) => {
          console.info(TAG, testName, JSON.stringify(res));
          expect(res != undefined).assertTrue();
          imageSourceObj!.release()
            .then(() => {
              done();
            });
        });
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_CREATE_PICTURE_ATINDEX_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_CREATE_PICTURE_ATINDEX_STATIC_0100
     * @tc.desc      createPictureAtIndex cover abnormal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PICTURE_ATINDEX_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_CREATE_PICTURE_ATINDEX_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        await imageSourceObj!.createPictureAtIndex(-2);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7700102);
        await imageSourceObj!.release();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_CREATE_PICTURE_ATINDEX_STATIC_0200
     * @tc.name      SUB_MEDIA_IMAGE_CREATE_PICTURE_ATINDEX_STATIC_0200
     * @tc.desc      createPictureAtIndex cover abnormal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PICTURE_ATINDEX_STATIC_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_CREATE_PICTURE_ATINDEX_STATIC_0200";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        await imageSourceObj!.createPictureAtIndex(100);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7700102);
        await imageSourceObj!.release();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_STATIC_0100
     * @tc.desc      readImageMetadata normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      let propertyKeys = ["ImageWidth"];
      try {
        let Metadata: image.ImageMetadata = await imageSourceObj!.readImageMetadata(propertyKeys, 0);
        console.info(TAG, testName, Metadata);
        expect(Metadata != undefined).assertTrue();
        await imageSourceObj!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_STATIC_0200
     * @tc.name      SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_STATIC_0200
     * @tc.desc      readImageMetadata abnormal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_STATIC_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_STATIC_0200";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      let propertyKeys = ["ImageWidth"];
      try {
        let res = await imageSourceObj!.readImageMetadata(propertyKeys, -2);
        console.info(TAG, testName, res);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7700204);
        await imageSourceObj!.release();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_ENUM_ORIENTATION_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_ENUM_ORIENTATION_STATIC_0100
     * @tc.desc      Orientation 枚举覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_ENUM_ORIENTATION_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_ENUM_ORIENTATION_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      try {
        expect(image.Orientation.TOP_LEFT).assertEqual(1);
        expect(image.Orientation.TOP_RIGHT).assertEqual(2);
        expect(image.Orientation.BOTTOM_RIGHT).assertEqual(3);
        expect(image.Orientation.BOTTOM_LEFT).assertEqual(4);
        expect(image.Orientation.LEFT_TOP).assertEqual(5);
        expect(image.Orientation.RIGHT_TOP).assertEqual(6);
        expect(image.Orientation.RIGHT_BOTTOM).assertEqual(7);
        expect(image.Orientation.LEFT_BOTTOM).assertEqual(8);
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_MODIFY_IMAGE_PROPERTIES_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_MODIFY_IMAGE_PROPERTIES_STATIC_0100
     * @tc.desc      modifyImageProperties normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_MODIFY_IMAGE_PROPERTIES_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_MODIFY_IMAGE_PROPERTIES_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      let keyValue: Record<PropertyKey, string | null> = {};
      keyValue[image.PropertyKey.IMAGE_WIDTH] = '1024';
      let checkKey = [image.PropertyKey.IMAGE_WIDTH];
      try {
        await imageSourceObj!.modifyImageProperties(keyValue);
        let res = await imageSourceObj!.getImageProperties(checkKey);
        expect(res != undefined).assertTrue();
        await imageSourceObj!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_MODIFY_IMAGE_PROPERTIES_STATIC_0200
     * @tc.name      SUB_MEDIA_IMAGE_MODIFY_IMAGE_PROPERTIES_STATIC_0200
     * @tc.desc      modifyImageProperties
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_MODIFY_IMAGE_PROPERTIES_STATIC_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_MODIFY_IMAGE_PROPERTIES_STATIC_0200";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test.png');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      let keyValue: Record<PropertyKey, string | null> = {};
      keyValue[image.PropertyKey.IMAGE_WIDTH] = '1024';
      try {
        await imageSourceObj!.modifyImageProperties(keyValue);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980096);
        await imageSourceObj!.release();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_MODIFY_IMAGE_PROPERTIES_STATIC_0300
     * @tc.name      SUB_MEDIA_IMAGE_MODIFY_IMAGE_PROPERTIES_STATIC_0300
     * @tc.desc      modifyImagePropertiesEnhanced normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_MODIFY_IMAGE_PROPERTIES_STATIC_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_MODIFY_IMAGE_PROPERTIES_STATIC_0300";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      let keyValue: Record<PropertyKey, string | null> = {};
      keyValue[image.PropertyKey.IMAGE_WIDTH] = '1024';
      let checkKey = [image.PropertyKey.IMAGE_WIDTH];
      try {
        imageSourceObj!.modifyImagePropertiesEnhanced(keyValue);
        let res = await imageSourceObj!.getImageProperties(checkKey);
        expect(res != undefined).assertTrue();
        await imageSourceObj!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_GIF_PROPERTY_KEY_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_GIF_PROPERTY_KEY_STATIC_0100
     * @tc.desc      GifPropertyKey 枚举覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_GIF_PROPERTY_KEY_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_GIF_PROPERTY_KEY_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      try {
        expect(image.GifPropertyKey.GIF_DELAY_TIME).assertEqual('GifDelayTime');
        expect(image.GifPropertyKey.GIF_DISPOSAL_TYPE).assertEqual('GifDisposalType');
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_0100
     * @tc.desc      HeifsMetadata createInstance normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      try {
        let heifsMetadata: image.HeifsMetadata = image.HeifsMetadata.createInstance();
        expect(heifsMetadata != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_MAKER_NOTE_HUAWEI_METADATA_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_MAKER_NOTE_HUAWEI_METADATA_STATIC_0100
     * @tc.desc      MakerNoteHuaweiMetadata createInstance normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_MAKER_NOTE_HUAWEI_METADATA_STATIC_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testName = "SUB_MEDIA_IMAGE_MAKER_NOTE_HUAWEI_METADATA_STATIC_0100";
        console.info(TAG, `start：${testName}`);
        try {
          let metadata = image.MakerNoteHuaweiMetadata.createInstance();
          expect(metadata != undefined).assertTrue();
          done();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_GET_IMAGE_INFO_CALLBACK_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_GET_IMAGE_INFO_CALLBACK_STATIC_0100
     * @tc.desc      getImageInfo cover size density stride pixelFormat alphaType mimeType isHdr
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_CALLBACK_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_GET_IMAGE_INFO_CALLBACK_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        imageSourceObj!.getImageInfo((error: BusinessError<void> | null, res: image.ImageInfo | undefined) => {
          console.info(TAG, testName, 'succeed in get imageInfo', JSON.stringify(res));
          expect(res!.size.width).assertEqual(472);
          expect(res!.size.height).assertEqual(226);
          expect(res!.density).assertEqual(0);
          expect(res!.stride).assertEqual(0);
          expect(res!.pixelFormat).assertEqual(0);
          expect(res!.alphaType).assertEqual(0);
          imageSourceObj!.release()
            .then(() => {
              done();
            })
        });
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_GET_IMAGE_INFO_CALLBACK_STATIC_0200
     * @tc.name      SUB_MEDIA_IMAGE_GET_IMAGE_INFO_CALLBACK_STATIC_0200
     * @tc.desc      getImageInfo cover size density stride pixelFormat alphaType mimeType isHdr
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_CALLBACK_STATIC_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_GET_IMAGE_INFO_CALLBACK_STATIC_0200";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        imageSourceObj!.getImageInfo(0, (error: BusinessError<void> | null, res: image.ImageInfo | undefined) => {
          console.info(TAG, testName, 'succeed in get imageInfo', JSON.stringify(res));
          expect(res!.size.width).assertEqual(472);
          expect(res!.size.height).assertEqual(226);
          expect(res!.density).assertEqual(0);
          expect(res!.stride).assertEqual(0);
          expect(res!.pixelFormat).assertEqual(0);
          expect(res!.alphaType).assertEqual(0);
          imageSourceObj!.release()
            .then(() => {
              done();
            })
        });
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTY_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTY_STATIC_0100
     * @tc.desc      getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTY_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTY_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' }
      const properties = [
        image.PropertyKey.BITS_PER_SAMPLE,
        image.PropertyKey.IMAGE_LENGTH,
        image.PropertyKey.IMAGE_WIDTH,
        image.PropertyKey.GPS_LATITUDE,
        image.PropertyKey.GPS_LONGITUDE,
        image.PropertyKey.GPS_LATITUDE_REF,
        image.PropertyKey.GPS_LONGITUDE_REF,
        image.PropertyKey.DATE_TIME_ORIGINAL,
        image.PropertyKey.EXPOSURE_TIME,
        image.PropertyKey.SCENE_TYPE,
        image.PropertyKey.ISO_SPEED_RATINGS,
        image.PropertyKey.F_NUMBER,
        image.PropertyKey.DATE_TIME,
        image.PropertyKey.GPS_TIME_STAMP,
        image.PropertyKey.GPS_DATE_STAMP,
        image.PropertyKey.IMAGE_DESCRIPTION,
        image.PropertyKey.MAKE,
        image.PropertyKey.MODEL,
        image.PropertyKey.PHOTO_MODE,
        image.PropertyKey.SENSITIVITY_TYPE,
        image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY,
        image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX,
        image.PropertyKey.ISO_SPEED,
        image.PropertyKey.APERTURE_VALUE,
        image.PropertyKey.EXPOSURE_BIAS_VALUE,
        image.PropertyKey.METERING_MODE,
        image.PropertyKey.LIGHT_SOURCE,
        image.PropertyKey.FLASH,
        image.PropertyKey.FOCAL_LENGTH,
        image.PropertyKey.USER_COMMENT,
        image.PropertyKey.PIXEL_X_DIMENSION,
        image.PropertyKey.PIXEL_Y_DIMENSION,
        image.PropertyKey.WHITE_BALANCE,
        image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM,
        image.PropertyKey.CAPTURE_MODE,
        image.PropertyKey.PHYSICAL_APERTURE,
        image.PropertyKey.ROLL_ANGLE,
        image.PropertyKey.PITCH_ANGLE,
        image.PropertyKey.SCENE_FOOD_CONF,
        image.PropertyKey.SCENE_STAGE_CONF,
        image.PropertyKey.SCENE_BLUE_SKY_CONF,
        image.PropertyKey.SCENE_GREEN_PLANT_CONF,
        image.PropertyKey.SCENE_BEACH_CONF,
        image.PropertyKey.SCENE_SNOW_CONF,
        image.PropertyKey.SCENE_SUNSET_CONF,
        image.PropertyKey.SCENE_FLOWERS_CONF,
        image.PropertyKey.SCENE_NIGHT_CONF,
        image.PropertyKey.SCENE_TEXT_CONF,
        image.PropertyKey.FACE_COUNT,
        image.PropertyKey.FOCUS_MODE,
        image.PropertyKey.COMPRESSION,
        image.PropertyKey.PHOTOMETRIC_INTERPRETATION,
        image.PropertyKey.STRIP_OFFSETS,
        image.PropertyKey.SAMPLES_PER_PIXEL,
        image.PropertyKey.ROWS_PER_STRIP,
        image.PropertyKey.STRIP_BYTE_COUNTS,
        image.PropertyKey.X_RESOLUTION,
        image.PropertyKey.Y_RESOLUTION,
        image.PropertyKey.PLANAR_CONFIGURATION,
        image.PropertyKey.RESOLUTION_UNIT,
        image.PropertyKey.TRANSFER_FUNCTION,
        image.PropertyKey.SOFTWARE,
        image.PropertyKey.ARTIST,
        image.PropertyKey.WHITE_POINT,
        image.PropertyKey.PRIMARY_CHROMATICITIES,
        image.PropertyKey.YCBCR_COEFFICIENTS,
        image.PropertyKey.YCBCR_SUB_SAMPLING,
        image.PropertyKey.YCBCR_POSITIONING,
        image.PropertyKey.REFERENCE_BLACK_WHITE,
        image.PropertyKey.COPYRIGHT,
        image.PropertyKey.JPEG_INTERCHANGE_FORMAT,
        image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH,
        image.PropertyKey.EXPOSURE_PROGRAM,
        image.PropertyKey.SPECTRAL_SENSITIVITY,
        image.PropertyKey.OECF,
        image.PropertyKey.EXIF_VERSION,
        image.PropertyKey.DATE_TIME_DIGITIZED,
        image.PropertyKey.COMPONENTS_CONFIGURATION,
        image.PropertyKey.SHUTTER_SPEED,
        image.PropertyKey.BRIGHTNESS_VALUE,
        image.PropertyKey.MAX_APERTURE_VALUE,
        image.PropertyKey.SUBJECT_DISTANCE,
        image.PropertyKey.SUBJECT_AREA,
        image.PropertyKey.MAKER_NOTE,
        image.PropertyKey.SUBSEC_TIME,
        image.PropertyKey.SUBSEC_TIME_ORIGINAL,
        image.PropertyKey.SUBSEC_TIME_DIGITIZED,
        image.PropertyKey.FLASHPIX_VERSION,
        image.PropertyKey.COLOR_SPACE,
        image.PropertyKey.RELATED_SOUND_FILE,
        image.PropertyKey.FLASH_ENERGY,
        image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE,
        image.PropertyKey.FOCAL_PLANE_X_RESOLUTION,
        image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION,
        image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT,
        image.PropertyKey.SUBJECT_LOCATION,
        image.PropertyKey.EXPOSURE_INDEX,
        image.PropertyKey.SENSING_METHOD,
        image.PropertyKey.FILE_SOURCE,
        image.PropertyKey.CFA_PATTERN,
        image.PropertyKey.CUSTOM_RENDERED,
        image.PropertyKey.EXPOSURE_MODE,
        image.PropertyKey.DIGITAL_ZOOM_RATIO,
        image.PropertyKey.SCENE_CAPTURE_TYPE,
        image.PropertyKey.GAIN_CONTROL,
        image.PropertyKey.CONTRAST,
        image.PropertyKey.SATURATION,
        image.PropertyKey.SHARPNESS,
        image.PropertyKey.DEVICE_SETTING_DESCRIPTION,
        image.PropertyKey.SUBJECT_DISTANCE_RANGE,
        image.PropertyKey.IMAGE_UNIQUE_ID,
        image.PropertyKey.GPS_VERSION_ID,
        image.PropertyKey.GPS_ALTITUDE_REF,
        image.PropertyKey.GPS_ALTITUDE,
        image.PropertyKey.GPS_SATELLITES,
        image.PropertyKey.GPS_STATUS,
        image.PropertyKey.GPS_MEASURE_MODE,
        image.PropertyKey.GPS_DOP,
        image.PropertyKey.GPS_SPEED_REF,
        image.PropertyKey.GPS_SPEED,
        image.PropertyKey.GPS_TRACK_REF,
        image.PropertyKey.GPS_TRACK,
        image.PropertyKey.GPS_IMG_DIRECTION_REF,
        image.PropertyKey.GPS_IMG_DIRECTION,
        image.PropertyKey.GPS_MAP_DATUM
      ];
      for (const property of properties) {
        try {
          let res = await imageSourceObj!.getImageProperty(property, options);
          expect(res != undefined).assertTrue();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
      }
      await imageSourceObj!.release();
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTY_STATIC_0200
     * @tc.name      SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTY_STATIC_0200
     * @tc.desc      getImagePropertySync
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTY_STATIC_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTY_STATIC_0200";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      const properties = [
        image.PropertyKey.BITS_PER_SAMPLE,
        image.PropertyKey.IMAGE_LENGTH,
        image.PropertyKey.IMAGE_WIDTH,
        image.PropertyKey.GPS_LATITUDE,
        image.PropertyKey.GPS_LONGITUDE,
        image.PropertyKey.GPS_LATITUDE_REF,
        image.PropertyKey.GPS_LONGITUDE_REF,
        image.PropertyKey.DATE_TIME_ORIGINAL,
        image.PropertyKey.EXPOSURE_TIME,
        image.PropertyKey.SCENE_TYPE,
        image.PropertyKey.ISO_SPEED_RATINGS,
        image.PropertyKey.F_NUMBER,
        image.PropertyKey.DATE_TIME,
        image.PropertyKey.GPS_TIME_STAMP,
        image.PropertyKey.GPS_DATE_STAMP,
        image.PropertyKey.IMAGE_DESCRIPTION,
        image.PropertyKey.MAKE,
        image.PropertyKey.MODEL,
        image.PropertyKey.PHOTO_MODE,
        image.PropertyKey.SENSITIVITY_TYPE,
        image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY,
        image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX,
        image.PropertyKey.ISO_SPEED,
        image.PropertyKey.APERTURE_VALUE,
        image.PropertyKey.EXPOSURE_BIAS_VALUE,
        image.PropertyKey.METERING_MODE,
        image.PropertyKey.LIGHT_SOURCE,
        image.PropertyKey.FLASH,
        image.PropertyKey.FOCAL_LENGTH,
        image.PropertyKey.USER_COMMENT,
        image.PropertyKey.PIXEL_X_DIMENSION,
        image.PropertyKey.PIXEL_Y_DIMENSION,
        image.PropertyKey.WHITE_BALANCE,
        image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM,
        image.PropertyKey.CAPTURE_MODE,
        image.PropertyKey.PHYSICAL_APERTURE,
        image.PropertyKey.ROLL_ANGLE,
        image.PropertyKey.PITCH_ANGLE,
        image.PropertyKey.SCENE_FOOD_CONF,
        image.PropertyKey.SCENE_STAGE_CONF,
        image.PropertyKey.SCENE_BLUE_SKY_CONF,
        image.PropertyKey.SCENE_GREEN_PLANT_CONF,
        image.PropertyKey.SCENE_BEACH_CONF,
        image.PropertyKey.SCENE_SNOW_CONF,
        image.PropertyKey.SCENE_SUNSET_CONF,
        image.PropertyKey.SCENE_FLOWERS_CONF,
        image.PropertyKey.SCENE_NIGHT_CONF,
        image.PropertyKey.SCENE_TEXT_CONF,
        image.PropertyKey.FACE_COUNT,
        image.PropertyKey.FOCUS_MODE,
        image.PropertyKey.COMPRESSION,
        image.PropertyKey.PHOTOMETRIC_INTERPRETATION,
        image.PropertyKey.STRIP_OFFSETS,
        image.PropertyKey.SAMPLES_PER_PIXEL,
        image.PropertyKey.ROWS_PER_STRIP,
        image.PropertyKey.STRIP_BYTE_COUNTS,
        image.PropertyKey.X_RESOLUTION,
        image.PropertyKey.Y_RESOLUTION,
        image.PropertyKey.PLANAR_CONFIGURATION,
        image.PropertyKey.RESOLUTION_UNIT,
        image.PropertyKey.TRANSFER_FUNCTION,
        image.PropertyKey.SOFTWARE,
        image.PropertyKey.ARTIST,
        image.PropertyKey.WHITE_POINT,
        image.PropertyKey.PRIMARY_CHROMATICITIES,
        image.PropertyKey.YCBCR_COEFFICIENTS,
        image.PropertyKey.YCBCR_SUB_SAMPLING,
        image.PropertyKey.YCBCR_POSITIONING,
        image.PropertyKey.REFERENCE_BLACK_WHITE,
        image.PropertyKey.COPYRIGHT,
        image.PropertyKey.JPEG_INTERCHANGE_FORMAT,
        image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH,
        image.PropertyKey.EXPOSURE_PROGRAM,
        image.PropertyKey.SPECTRAL_SENSITIVITY,
        image.PropertyKey.OECF,
        image.PropertyKey.EXIF_VERSION,
        image.PropertyKey.DATE_TIME_DIGITIZED,
        image.PropertyKey.COMPONENTS_CONFIGURATION,
        image.PropertyKey.SHUTTER_SPEED,
        image.PropertyKey.BRIGHTNESS_VALUE,
        image.PropertyKey.MAX_APERTURE_VALUE,
        image.PropertyKey.SUBJECT_DISTANCE,
        image.PropertyKey.SUBJECT_AREA,
        image.PropertyKey.MAKER_NOTE,
        image.PropertyKey.SUBSEC_TIME,
        image.PropertyKey.SUBSEC_TIME_ORIGINAL,
        image.PropertyKey.SUBSEC_TIME_DIGITIZED,
        image.PropertyKey.FLASHPIX_VERSION,
        image.PropertyKey.COLOR_SPACE,
        image.PropertyKey.RELATED_SOUND_FILE,
        image.PropertyKey.FLASH_ENERGY,
        image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE,
        image.PropertyKey.FOCAL_PLANE_X_RESOLUTION,
        image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION,
        image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT,
        image.PropertyKey.SUBJECT_LOCATION,
        image.PropertyKey.EXPOSURE_INDEX,
        image.PropertyKey.SENSING_METHOD,
        image.PropertyKey.FILE_SOURCE,
        image.PropertyKey.CFA_PATTERN,
        image.PropertyKey.CUSTOM_RENDERED,
        image.PropertyKey.EXPOSURE_MODE,
        image.PropertyKey.DIGITAL_ZOOM_RATIO,
        image.PropertyKey.SCENE_CAPTURE_TYPE,
        image.PropertyKey.GAIN_CONTROL,
        image.PropertyKey.CONTRAST,
        image.PropertyKey.SATURATION,
        image.PropertyKey.SHARPNESS,
        image.PropertyKey.DEVICE_SETTING_DESCRIPTION,
        image.PropertyKey.SUBJECT_DISTANCE_RANGE,
        image.PropertyKey.IMAGE_UNIQUE_ID,
        image.PropertyKey.GPS_VERSION_ID,
        image.PropertyKey.GPS_ALTITUDE_REF,
        image.PropertyKey.GPS_ALTITUDE,
        image.PropertyKey.GPS_SATELLITES,
        image.PropertyKey.GPS_STATUS,
        image.PropertyKey.GPS_MEASURE_MODE,
        image.PropertyKey.GPS_DOP,
        image.PropertyKey.GPS_SPEED_REF,
        image.PropertyKey.GPS_SPEED,
        image.PropertyKey.GPS_TRACK_REF,
        image.PropertyKey.GPS_TRACK,
        image.PropertyKey.GPS_IMG_DIRECTION_REF,
        image.PropertyKey.GPS_IMG_DIRECTION,
        image.PropertyKey.GPS_MAP_DATUM
      ];
      for (const property of properties) {
        try {
          let res = imageSourceObj!.getImagePropertySync(property);
          expect(res != undefined).assertTrue();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
      }
      await imageSourceObj!.release();
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_0800
     * @tc.name      SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_0800
     * @tc.desc      heifsDelayTime
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_0800";
      console.info(TAG, `start：${testName}`);
      try {
        expect(image.HeifsPropertyKey.HEIFS_DELAY_TIME).assertEqual('HeifsDelayTime');
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_1200
     * @tc.name      SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_1200
     * @tc.desc      HeifsMetadata clone 返回值为空
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_1200";
      console.info(TAG, `start：${testName}`);
      let metadata = image.HeifsMetadata.createInstance();
      try {
        let Value: image.HeifsMetadata = await metadata!.clone();
        expect(Value != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_1400
     * @tc.name      SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_1400
     * @tc.desc      HeifsMetadata getBlob 返回值为空
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_HEIFS_METADATA_TEST_STATIC_1400";
      console.info(TAG, `start：${testName}`);
      let metadata = image.HeifsMetadata.createInstance();
      try {
        let res = await metadata.getBlob();
        expect(res != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
     /**
     * @tc.number    SUB_MEDIA_IMAGE_MAKER_NOTE_HUAWEI_METADATA_STATIC_1100
     * @tc.name      SUB_MEDIA_IMAGE_MAKER_NOTE_HUAWEI_METADATA_STATIC_1100
     * @tc.desc      MakerNoteHuaweiMetadata clone normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_MAKER_NOTE_HUAWEI_METADATA_STATIC_1100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testName = "SUB_MEDIA_IMAGE_MAKER_NOTE_HUAWEI_METADATA_STATIC_1100";
        let metadata = image.MakerNoteHuaweiMetadata.createInstance();
        try {
          let MakerNoteHuaweiValue = await metadata!.clone();
          expect(MakerNoteHuaweiValue != undefined).assertTrue();
          done();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
    
       }
    })
       /**
     * @tc.number    SUB_MEDIA_IMAGE_MAKER_NOTE_HUAWEI_METADATA_STATIC_1300
     * @tc.name      SUB_MEDIA_IMAGE_MAKER_NOTE_HUAWEI_METADATA_STATIC_1300
     * @tc.desc      MakerNoteHuaweiMetadata getBlob abnormal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_MAKER_NOTE_HUAWEI_METADATA_STATIC_1300', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testName = "SUB_MEDIA_IMAGE_MAKER_NOTE_HUAWEI_METADATA_STATIC_1300";
        let metadata = image.MakerNoteHuaweiMetadata.createInstance();
        try {
          let blob = await metadata!.getBlob();
          expect(blob != undefined).assertTrue();
          done();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
    })



    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0100
     * @tc.desc      createImageRawData normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0100";
      try {
        let filePath = await getFilePath("meta.dng");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        const imageRawData = await imageSourceObj!.createImageRawData();
        console.info(TAG, testName, `createImageRawData success`,imageRawData!.bitsPerPixel);
        expect(imageRawData!.bitsPerPixel).assertEqual(16);
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0200
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0200
     * @tc.desc      createImageRawData abnormal filePath:jpg,7700102
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0200";
      try {
        let filePath = await getFilePath("test_exif_v2.jpg");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        const imageRawData = await imageSourceObj!.createImageRawData();
        console.info(TAG, testName, `createImageRawData success`,imageRawData!.bitsPerPixel);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7700102);
      }
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0300
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0300
     * @tc.desc      createImageRawData cover abnormal filePath:"",7700102
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0300";
      try {
        let filePath = await getFilePath("");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        const imageRawData = await imageSourceObj!.createImageRawData();
        console.info(TAG, testName, `createImageRawData success`,imageRawData!.bitsPerPixel);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7700102);
      }
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0400
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0400
     * @tc.desc      createImageRawData cover abnormal filePath:"",7700101
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0400";
      try {
        let filePath = await getFilePath("fake.dng");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        const imageRawData = await imageSourceObj!.createImageRawData();
        console.info(TAG, testName, `createImageRawData success`,imageRawData!.bitsPerPixel);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7700101);
      }
      done();
    })


    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0100
     * @tc.desc      readImageMetadataByType normal parameter metaData.exifMetadata，metaData.dngMetadata
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0100";
      try {
        let filePath = await getFilePath("meta.dng");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        let types: image.MetadataType[] = [];
        let  metaData = await imageSourceObj!.readImageMetadataByType(types, 0)
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`, metaData.exifMetadata);
        expect(metaData.exifMetadata!=undefined).assertTrue();
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`, JSON.stringify(metaData.dngMetadata?.dngVersion));
        let dngVersion = JSON.stringify(metaData.dngMetadata?.dngVersion);
        expect(dngVersion).assertEqual("[1,4,0,0]");
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`, JSON.stringify(metaData.dngMetadata?.dngBackwardVersion));
        let dngBackwardVersion = JSON.stringify(metaData.dngMetadata?.dngBackwardVersion);
        expect(dngBackwardVersion).assertEqual("[1,1,0,0]");
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`, JSON.stringify(metaData.dngMetadata?.uniqueCameraModel));
        expect(metaData.dngMetadata?.uniqueCameraModel).assertEqual('CLS-AL00-HUAWEI-HUAWEI');
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.cfaPlaneColor`, metaData.dngMetadata?.cfaPlaneColor);
        let cfaPlaneColor = JSON.stringify(metaData.dngMetadata?.cfaPlaneColor);
        expect(cfaPlaneColor).assertEqual("[0,1,2]");
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.cfaLayout`, metaData.dngMetadata?.cfaLayout);
        let cfaLayout = JSON.stringify(metaData.dngMetadata?.cfaLayout);
        expect(cfaLayout).assertEqual("1");
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.blackLevelRepeatDim`, metaData.dngMetadata?.blackLevelRepeatDim);
        let blackLevelRepeatDim = JSON.stringify(metaData.dngMetadata?.blackLevelRepeatDim);
        expect(blackLevelRepeatDim).assertEqual("[2,2]");
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.blackLevel`, metaData.dngMetadata?.blackLevel);
        let blackLevel = JSON.stringify(metaData.dngMetadata?.blackLevel);
        expect(blackLevel).assertEqual("[256,256,256,256]");
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.whiteLevel`, metaData.dngMetadata?.whiteLevel);
        let whiteLevel = JSON.stringify(metaData.dngMetadata?.whiteLevel);
        expect(whiteLevel).assertEqual("[4095]");
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0200
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0200
     * @tc.desc      readImageMetadataByType normal parameter metaData.webPMetadata
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0200";
      try {
        let filePath = await getFilePath("test_exif_v3.webp");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        let types: image.MetadataType[] = [];
        let  metaData = await imageSourceObj!.readImageMetadataByType(types, 0)
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`,metaData.webPMetadata,);
        expect(metaData.webPMetadata!=undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

  })
}