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
 
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import {CUVAHdrExpectedValue, CUVAHdrMultiExpectedValue, testExifExpectedValue, verifyExifPropertiesByArray} from '../ImageProperties.test'
 
const TAG = 'clone';
 
async function clonePromiseTest(done: Function, testName: string, path: string,
  attributeKey: Array<image.PropertyKey> | null, repeat: number): Promise<boolean> {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let result = true;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
        sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let imageMetadata: image.ImageMetadata = await imageSource.readImageMetadata();
    let makerNoteHuaweiMetadata = imageMetadata.makerNoteHuaweiMetadata;
    if (makerNoteHuaweiMetadata != null) {
        for(let i = 0; i < repeat; i++){
            let new_metadata = await makerNoteHuaweiMetadata.clone();
            let verifyResult: boolean;
            if(path === "CUVAHdr.jpg"){
            verifyResult = await verifyExifPropertiesByArray(new_metadata, attributeKey, CUVAHdrExpectedValue);
            } else if (path === 'CUVAHdrMulti.jpg'){
            verifyResult = await verifyExifPropertiesByArray(new_metadata, attributeKey, CUVAHdrMultiExpectedValue);
            } else {
            verifyResult = await verifyExifPropertiesByArray(new_metadata, attributeKey, testExifExpectedValue);
            }
            result = verifyResult && result;
        }
    }
    return result;
}
 
export default function MakerNoteCloneTest() {
  describe('MakerNoteCloneTest', () => {
 
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0001
     * @tc.desc   maker note metadata clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0001', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0001';
        try {
            const path = 'CUVAHdr.jpg';
            let attributeKey = [image.PropertyKey.XMAGE_LEFT, image.PropertyKey.XMAGE_TOP];
            let result = await clonePromiseTest(done, testName, path, attributeKey, 1);
            expect(result).assertTrue();
            done();
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0002
     * @tc.desc   maker note metadata clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0002', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0002';
        try {
            const path = 'CUVAHdrMulti.jpg';
            let attributeKey = [image.PropertyKey.XMAGE_LEFT];
            let result = await clonePromiseTest(done, testName, path, attributeKey, 1);
            expect(result).assertTrue();
            done();
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0003
     * @tc.number SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0003
     * @tc.desc   maker note metadata clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0003', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0003';
        try {
            const path = 'test_exif.jpg';
            let attributeKey = [image.PropertyKey.XMAGE_TOP];
            let result = await clonePromiseTest(done, testName, path, attributeKey, 1);
            expect(result).assertTrue();
            done();
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0004
     * @tc.number SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0004
     * @tc.desc   maker note metadata clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0004', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CLONE_0004';
        try {
            const path = 'test_exif.jpg';
            let attributeKey = [image.PropertyKey.XMAGE_TOP];
            let result = await clonePromiseTest(done, testName, path, attributeKey, 100);
            expect(result).assertTrue();
            done();
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
  })
}