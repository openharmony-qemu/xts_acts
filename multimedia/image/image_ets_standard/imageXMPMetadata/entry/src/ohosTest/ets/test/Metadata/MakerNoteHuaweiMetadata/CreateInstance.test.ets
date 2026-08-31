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
 
const TAG = 'createInstance';
 
export default function MakerNoteCreateInstanceTest(): void {
  describe('MakerNoteCreateInstanceTest', () => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CREATE_INSTANCE_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CREATE_INSTANCE_0001
     * @tc.desc   clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CREATE_INSTANCE_0001', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CREATE_INSTANCE_0001';
        try {
            let metaData = image.MakerNoteHuaweiMetadata.createInstance();
            expect(metaData != undefined).assertTrue();
            metaData.xmageLeft = 1;
            expect(metaData.xmageLeft).assertEqual(1);
            done();
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CREATE_INSTANCE_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CREATE_INSTANCE_0002
     * @tc.desc   clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CREATE_INSTANCE_0002', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_MAKER_NOTE_METADATA_CREATE_INSTANCE_0002';
        let testNumber = 100;
        let result = true;
        try {
            for(let i = 0; i < testNumber; i++){
                let metaData = image.MakerNoteHuaweiMetadata.createInstance();
                expect(metaData != undefined).assertTrue();
                metaData.xmageLeft = 1;
                expect(metaData.xmageLeft).assertEqual(1);
            }
            done();
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
  })
}