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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Hypium } from '../../../../../../hypium';
import { image } from '@kit.ImageKit';

const TAG = 'xts.getImageProperty';

async function getImagePropertyPromiseTest(done: () => void, testName: string, pathUri: string,
  options: image.ImagePropertyOptions, PropertyKey: image.PropertyKey) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  let imageProperty: string = await imageSourceApi!.getImageProperty(PropertyKey, options);
  imageSourceApi!.release();
  expect(imageProperty != options.defaultValue).assertTrue();
  done();
}

export default function ImageSourceGetImagePropertyTest(): void {
  describe('ImageSourceGetImagePropertyTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_0100
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_0100';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.BITS_PER_SAMPLE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_0200
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_0200
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_0200';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.BITS_PER_SAMPLE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_0300
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_0300
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_0300';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.ORIENTATION;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_0400
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_0400
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_0400';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.IMAGE_LENGTH;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_0500
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_0500
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_0500';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.IMAGE_WIDTH;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_0600
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_0600
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_0600';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.GPS_LATITUDE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_0700
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_0700
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_0700';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.GPS_LONGITUDE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_0800
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_0800
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_0800';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.GPS_LATITUDE_REF;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_0900
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_0900
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_0900';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.GPS_LONGITUDE_REF;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_1000
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_1000
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_1000';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.DATE_TIME_ORIGINAL;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_1100
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_1100
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_1100';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.EXPOSURE_TIME;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_1200
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_1200
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_1200';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.SCENE_TYPE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_1300
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_1300
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_1300';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.ISO_SPEED_RATINGS;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_1400
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_1400
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_1400';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '8888' };
      let PropertyKey = image.PropertyKey.F_NUMBER;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_1500
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_1500
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_1500';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '888' };
      let PropertyKey = image.PropertyKey.DATE_TIME;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_1600
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_1600
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_1600';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '666' };
      let PropertyKey = image.PropertyKey.GPS_TIME_STAMP;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_1700
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_1700
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_1700';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.GPS_DATE_STAMP;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_1800
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_1800
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_1800';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.MAKE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_1900
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_1900
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_1900';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.MODEL;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_2000
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_2000
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_2000';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.ISO_SPEED;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_2100
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_2100
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_2100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_2100';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.APERTURE_VALUE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_2200
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_2200
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_2200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_2200';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.EXPOSURE_BIAS_VALUE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_2300
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_2300
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_2300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_2300';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.METERING_MODE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_2400
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_2400
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_2400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_2400';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.LIGHT_SOURCE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_2500
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_2500
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_2500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_2500';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.FLASH;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_2600
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_2600
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_2600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_2600';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.FOCAL_LENGTH;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_2700
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_2700
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_2700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_2700';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.PIXEL_X_DIMENSION;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_2800
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_2800
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_2800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_2800';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.PIXEL_Y_DIMENSION;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_2900
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_2900
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_2900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_2900';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.WHITE_BALANCE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_3000
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_3000
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_3000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_3000';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_3100
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_3100
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_3100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_3100';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.CAPTURE_MODE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_3200
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_3200
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_3200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_3200';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.PHYSICAL_APERTURE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_3300
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_3300
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_3300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_3300';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.ROLL_ANGLE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_3400
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_3400
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_3400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_3400';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.PITCH_ANGLE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_3500
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_3500
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_3500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_3500';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_FOOD_CONF;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_3600
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_3600
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_3600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_3600';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_STAGE_CONF;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_3700
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_3700
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_3700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_3700';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_BLUE_SKY_CONF;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_3800
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_3800
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_3800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_3800';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_GREEN_PLANT_CONF;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_3900
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_3900
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_3900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_3900';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_BEACH_CONF;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_4000
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_4000
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_4000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_4000';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_SNOW_CONF;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_4100
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_4100
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_4100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_4100';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_SUNSET_CONF;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_4200
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_4200
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_4200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_4200';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_FLOWERS_CONF;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_4300
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_4300
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_4300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_4300';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_NIGHT_CONF;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_4400
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_4400
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_4400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_4400';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_TEXT_CONF;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_4500
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_4500
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_4500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_4500';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.FACE_COUNT;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_4600
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_4600
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_4600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_4600';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.FOCUS_MODE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_4700
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_4700
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_4700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_4700';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.COMPRESSION;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_4800
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_4800
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_4800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_4800';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.X_RESOLUTION;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_4900
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_4900
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_4900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_4900';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.Y_RESOLUTION;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_5000
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_5000
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_5000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_5000';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.RESOLUTION_UNIT;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageProperty_static_5100
     * @tc.number SUB_MEDIA_IMAGE_getImageProperty_static_5100
     * @tc.desc   imageSource_getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageProperty_static_5100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getImageProperty_static_5100';
      const path = 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SOFTWARE;
      try {
        await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}