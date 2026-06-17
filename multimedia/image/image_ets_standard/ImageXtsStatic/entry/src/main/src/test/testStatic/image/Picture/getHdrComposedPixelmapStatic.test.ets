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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../../../hypium';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
const TAG = 'static_getHdrComposedPixelmapStatic';

async function getHdrComposedPixelmapPixelmapWithOptionsAbnormalPromiseTest(done: () => void, testName: string, path: string,  callback: (PictureObj:image.Picture | undefined) => Promise<void>) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  let pathUri = `file://${testContext.filesDir}/${path}`;
  let imageSource: image.ImageSource | undefined = image.createImageSource(pathUri);
  console.info(TAG, testName, 'imageSource success.',imageSource);
  if(imageSource != undefined){
    let PictureObj: image.Picture | undefined = await imageSource!.createPicture();
    console.info(TAG, testName,'createPicture is succsee',PictureObj );
    if (PictureObj != undefined) {
      callback(PictureObj);
    } else {
      console.info(TAG, testName,'PictureObj is undefined', );
      expect().assertFail();
      done();
    }
  }else{
    console.info(TAG, testName,'imageSource is undefined', );
    expect().assertFail();
    done();
  }

}


export default function getHdrComposedPixelmapStaticSuppTest(): void {
  describe('getHdrComposedPixelmapStaticSuppTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmap_abnormal_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmap_abnormal_promise_static_0100
     * @tc.desc   getHdrComposedPixelmap test.jpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmap_abnormal_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmap_abnormal_promise_static_0100';
      const path = 'test.jpeg';
      await getHdrComposedPixelmapPixelmapWithOptionsAbnormalPromiseTest(done, testName, path, async (PictureObj:image.Picture | undefined) => {
        try {
          if (PictureObj != undefined) {
            let hdrComposedPixelmap: image.PixelMap | undefined = await PictureObj.getHdrComposedPixelmap();
            console.info(TAG, testName, 'hdrComposedPixelmap success', hdrComposedPixelmap);
            if (hdrComposedPixelmap != undefined) {
              hdrComposedPixelmap.getImageInfo().then((imageInfo: image.ImageInfo) => {
                if (imageInfo != null) {
                  console.info(TAG, testName,  'GetMainPixelmap information height:' + imageInfo.size.height + ' width:' + imageInfo.size.width);
                  done();
                }
              }).catch((error: Error) => {
                console.info(TAG, testName, `failed; error: ${error.code},${error.message}`);
                expect().assertFail()
                done();
              });
            } else {
              console.info(TAG, testName, `hdrComposedPixelmap is undefined`);
              expect().assertFail()
              done();
            }
          } else {
            console.info(TAG, testName, `PictureObj is undefined`);
            expect().assertFail()
            done();
          }
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(7600201);
        }
        if (PictureObj != undefined) {
          await PictureObj.release();
        }
        console.info(TAG, testName, 'done');
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmap_abnormal_promise_static_0200
     * @tc.number SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmap_abnormal_promise_static_0200
     * @tc.desc   getHdrComposedPixelmap AllAuxiliaryPictures.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmap_abnormal_promise_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmap_abnormal_promise_static_0200';
      const path = 'AllAuxiliaryPictures.jpg';
      await getHdrComposedPixelmapPixelmapWithOptionsAbnormalPromiseTest(done, testName, path, async (PictureObj:image.Picture | undefined) => {
        try {
          if (PictureObj != undefined) {
            let hdrComposedPixelmap: image.PixelMap | undefined = await PictureObj.getHdrComposedPixelmap();
            console.info(TAG, testName, 'hdrComposedPixelmap success', hdrComposedPixelmap);
            if (hdrComposedPixelmap != undefined) {
              hdrComposedPixelmap.getImageInfo().then((imageInfo: image.ImageInfo) => {
                if (imageInfo != null) {
                  console.info(TAG, testName,  'GetMainPixelmap information height:' + imageInfo.size.height + ' width:' + imageInfo.size.width);
                  done();
                }
              }).catch((error: Error) => {
                console.info(TAG, testName, `failed; error: ${error.code},${error.message}`);
                expect().assertFail()
                done();
              });
            } else {
              console.info(TAG, testName, `hdrComposedPixelmap is undefined`);
              expect().assertFail()
              done();
            }
          } else {
            console.info(TAG, testName, `PictureObj is undefined`);
            expect().assertFail()
            done();
          }
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(7600201);
        }
        if (PictureObj != undefined) {
          await PictureObj.release();
        }
        console.info(TAG, testName, 'done');
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0100
     * @tc.desc   getHdrComposedPixelmap,CUVAHdr.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0100';
      const path = 'CUVAHdr.jpg';
      let opt: image.HdrComposeOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102
      };
      await getHdrComposedPixelmapPixelmapWithOptionsAbnormalPromiseTest(done, testName, path, async (PictureObj:image.Picture | undefined) => {
        try {
          if (PictureObj != undefined) {
            let hdrComposedPixelmap: image.PixelMap | undefined = await PictureObj.getHdrComposedPixelmapWithOptions(opt);
            console.info(TAG, testName, 'getHdrComposedPixelmapWithOptions success', hdrComposedPixelmap);
            if (hdrComposedPixelmap != undefined) {
              hdrComposedPixelmap.getImageInfo().then((imageInfo: image.ImageInfo) => {
                if (imageInfo != null) {
                  console.info(TAG, testName, 'GetHdrComposedPixelmapWithOptions  information height:' + imageInfo.size.height + ' width:' + imageInfo.size.width);
                  done();
                }
              }).catch((error: Error) => {
                console.info(TAG, testName, `failed; error: ${error.code},${error.message}`);
                expect().assertFail()
                done();
              });
            } else {
              console.info(TAG, testName, `GetHdrComposedPixelmapWithOptions is undefined`);
              expect().assertFail()
              done();
            }
          } else {
            console.info(TAG, testName, `PictureObj is undefined`);
            expect().assertFail()
            done();
          }
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(7600201);
        }
        if (PictureObj != undefined) {
          await PictureObj.release();
        }
        console.info(TAG, testName, 'done');
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0200
     * @tc.number SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0200
     * @tc.desc   getHdrComposedPixelmap,AllAuxiliaryPictures.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0200';
      const path = 'AllAuxiliaryPictures.jpg';
      let opt: image.HdrComposeOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102
      };
      await getHdrComposedPixelmapPixelmapWithOptionsAbnormalPromiseTest(done, testName, path, async (PictureObj:image.Picture | undefined) => {
        try {
          if (PictureObj != undefined) {
            let hdrComposedPixelmap: image.PixelMap | undefined = await PictureObj.getHdrComposedPixelmapWithOptions(opt);
            console.info(TAG, testName, 'getHdrComposedPixelmapWithOptions success', hdrComposedPixelmap);
            if (hdrComposedPixelmap != undefined) {
              hdrComposedPixelmap.getImageInfo().then((imageInfo: image.ImageInfo) => {
                if (imageInfo != null) {
                  console.info(TAG, testName, 'GetHdrComposedPixelmapWithOptions  information height:' + imageInfo.size.height + ' width:' + imageInfo.size.width);
                  done();
                }
              }).catch((error: Error) => {
                console.info(TAG, testName, `failed; error: ${error.code},${error.message}`);
                expect().assertFail()
                done();
              });
            } else {
              console.info(TAG, testName, `GetHdrComposedPixelmapWithOptions is undefined`);
              expect().assertFail()
              done();
            }
          } else {
            console.info(TAG, testName, `PictureObj is undefined`);
            expect().assertFail()
            done();
          }
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(7600201);
        }
        if (PictureObj != undefined) {
          await PictureObj.release();
        }
        console.info(TAG, testName, 'done');
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0300
     * @tc.number SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0300
     * @tc.desc   getHdrComposedPixelmap,test_exif_v2.png ,opt：image.PixelMapFormat.UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0300';
      const path = 'test.jpeg';
      let opt: image.HdrComposeOptions = {
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN
      };
      await getHdrComposedPixelmapPixelmapWithOptionsAbnormalPromiseTest(done, testName, path, async (PictureObj:image.Picture | undefined) => {
        try {
          if (PictureObj != undefined) {
            let hdrComposedPixelmap: image.PixelMap | undefined = await PictureObj.getHdrComposedPixelmapWithOptions(opt);
            console.info(TAG, testName, 'getHdrComposedPixelmapWithOptions success', hdrComposedPixelmap);
            if (hdrComposedPixelmap != undefined) {
              hdrComposedPixelmap.getImageInfo().then((imageInfo: image.ImageInfo) => {
                if (imageInfo != null) {
                  console.info(TAG, testName, 'GetHdrComposedPixelmapWithOptions  information height:' + imageInfo.size.height + ' width:' + imageInfo.size.width);
                  done();
                }
              }).catch((error: Error) => {
                console.info(TAG, testName, `failed; error: ${error.code},${error.message}`);
                expect().assertFail()
                done();
              });
            } else {
              console.info(TAG, testName, `GetHdrComposedPixelmapWithOptions is undefined`);
              expect().assertFail()
              done();
            }
          } else {
            console.info(TAG, testName, `PictureObj is undefined`);
            expect().assertFail()
            done();
          }
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(7600201);
        }
        if (PictureObj != undefined) {
          await PictureObj.release();
        }
        console.info(TAG, testName, 'done');
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0400
     * @tc.number SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0400
     * @tc.desc   getHdrComposedPixelmap,test.jpeg, desiredPixelFormat: image.PixelMapFormat.RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0400';
      const path = 'test.jpeg';
      let opt: image.HdrComposeOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102
      };
      await getHdrComposedPixelmapPixelmapWithOptionsAbnormalPromiseTest(done, testName, path, async (PictureObj:image.Picture | undefined) => {
        try {
          if (PictureObj != undefined) {
            let hdrComposedPixelmap: image.PixelMap | undefined = await PictureObj.getHdrComposedPixelmapWithOptions(opt);
            console.info(TAG, testName, 'getHdrComposedPixelmapWithOptions success', hdrComposedPixelmap);
            if (hdrComposedPixelmap != undefined) {
              hdrComposedPixelmap.getImageInfo().then((imageInfo: image.ImageInfo) => {
                if (imageInfo != null) {
                  console.info(TAG, testName, 'GetHdrComposedPixelmapWithOptions  information height:' + imageInfo.size.height + ' width:' + imageInfo.size.width);
                  done();
                }
              }).catch((error: Error) => {
                console.info(TAG, testName, `failed; error: ${error.code},${error.message}`);
                expect().assertFail()
                done();
              });
            } else {
              console.info(TAG, testName, `GetHdrComposedPixelmapWithOptions is undefined`);
              expect().assertFail()
              done();
            }
          } else {
            console.info(TAG, testName, `PictureObj is undefined`);
            expect().assertFail()
            done();
          }
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(7600201);
        }
        if (PictureObj != undefined) {
          await PictureObj.release();
        }
        console.info(TAG, testName, 'done');
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0500
     * @tc.number SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0500
     * @tc.desc   getHdrComposedPixelmap,test.jpeg, with no opt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getHdrComposedPixelmapWithOptions_abnormal_promise_static_0500';
      const path = 'test.jpeg';
      await getHdrComposedPixelmapPixelmapWithOptionsAbnormalPromiseTest(done, testName, path, async (PictureObj:image.Picture | undefined) => {
        try {
          if (PictureObj != undefined) {
            let hdrComposedPixelmap: image.PixelMap | undefined = await PictureObj.getHdrComposedPixelmapWithOptions();
            console.info(TAG, testName, 'getHdrComposedPixelmapWithOptions success', hdrComposedPixelmap);
            if (hdrComposedPixelmap != undefined) {
              hdrComposedPixelmap.getImageInfo().then((imageInfo: image.ImageInfo) => {
                if (imageInfo != null) {
                  console.info(TAG, testName, 'GetHdrComposedPixelmapWithOptions  information height:' + imageInfo.size.height + ' width:' + imageInfo.size.width);
                  done();
                }
              }).catch((error: Error) => {
                console.info(TAG, testName, `failed; error: ${error.code},${error.message}`);
                expect().assertFail()
                done();
              });
            } else {
              console.info(TAG, testName, `GetHdrComposedPixelmapWithOptions is undefined`);
              expect().assertFail()
              done();
            }
          } else {
            console.info(TAG, testName, `PictureObj is undefined`);
            expect().assertFail()
            done();
          }
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(7600201);
        }
        if (PictureObj != undefined) {
          await PictureObj.release();
        }
        console.info(TAG, testName, 'done');
        done();
      })
    })

  })
}