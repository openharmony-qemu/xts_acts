/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import UTD from '@ohos.data.uniformTypeDescriptor';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
let domain: int = 0x0000;
let tag: string = 'testTag';
let resProgressInfo: unifiedDataChannel.ProgressInfo;

export default function UDMFApiTest() {
  describe("UDMFApiTest", (): void => {
    /**
    * @tc.name       : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100
    * @tc.number     : UnifiedDataTest01
    * @tc.desc       : predicates orderByAsc normal test
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 start');
      let unifiedRecord = new unifiedDataChannel.UnifiedRecord();
      let unifiedData = new unifiedDataChannel.UnifiedData(unifiedRecord);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.UnifiedRecord = (records[0]) as unifiedDataChannel.UnifiedRecord;
      expect(records.length == 1).assertEqual(true);
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 end');
      done();
    })
    /**
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200
     * @tc.number     : UnifiedDataTest02
     * @tc.desc       : predicates orderByAsc normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200 start');
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let records = unifiedData.getRecords();
      expect(records.length).assertEqual(0);
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200 end');
      done();
    })
    /**
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300
     * @tc.number     : UnifiedDataTest03
     * @tc.desc       : predicates orderByAsc normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300 start');
      let unifiedRecord = new unifiedDataChannel.UnifiedRecord("general.composite-object", "string");
      let unifiedData = new unifiedDataChannel.UnifiedData(unifiedRecord);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.UnifiedRecord = (records[0]) as unifiedDataChannel.UnifiedRecord;
      expect(records.length == 1).assertEqual(true);
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300 end');
      done();
    })
    /**
     * @tc.number     : UDMFApiTest01
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_001
     * @tc.desc       : getUniformDataTypeByFilenameExtension JPEG test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_001 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".jpg");
        expect(result).assertEqual(UTD.UniformDataType.JPEG);
        let result1 = UTD.getUniformDataTypeByFilenameExtension(".jpeg");
        expect(result1).assertEqual(UTD.UniformDataType.JPEG);
        let result2 = UTD.getUniformDataTypeByFilenameExtension(".jpe");
        expect(result2).assertEqual(UTD.UniformDataType.JPEG);
        let result3 = UTD.getUniformDataTypeByFilenameExtension(".jpg", "general.image");
        expect(result3).assertEqual(UTD.UniformDataType.JPEG);
        let result4 = UTD.getUniformDataTypeByFilenameExtension(".jpeg", "general.image");
        expect(result4).assertEqual(UTD.UniformDataType.JPEG);
        let result5 = UTD.getUniformDataTypeByFilenameExtension(".jpe", "general.image");
        expect(result5).assertEqual(UTD.UniformDataType.JPEG);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_001 end');
    })
    /**
     * @tc.number     : UDMFApiTest02
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_002
     * @tc.desc       : getUniformDataTypeByFilenameExtension HTML test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_002 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".html");
        expect(result).assertEqual(UTD.UniformDataType.HTML);
        let result1 = UTD.getUniformDataTypeByFilenameExtension(".htm");
        expect(result1).assertEqual(UTD.UniformDataType.HTML);
        let result2 = UTD.getUniformDataTypeByFilenameExtension(".html", "general.text");
        expect(result2).assertEqual(UTD.UniformDataType.HTML);
        let result3 = UTD.getUniformDataTypeByFilenameExtension(".htm", "general.text");
        expect(result3).assertEqual(UTD.UniformDataType.HTML);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_002 end');
    })
    /**
     * @tc.number     : UDMFApiTest03
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_003
     * @tc.desc       : getUniformDataTypeByFilenameExtension PLAIN_TEXT test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_003 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".txt");
        expect(result).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
        let result1 = UTD.getUniformDataTypeByFilenameExtension(".text");
        expect(result1).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
        let result2 = UTD.getUniformDataTypeByFilenameExtension(".txt", "general.text");
        expect(result2).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
        let result3 = UTD.getUniformDataTypeByFilenameExtension(".text", "general.text");
        expect(result3).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_003 end');
    })
    /**
     * @tc.number     : UDMFApiTest04
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_004
     * @tc.desc       : getUniformDataTypeByFilenameExtension PNG test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_004 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".png");
        expect(result).assertEqual(UTD.UniformDataType.PNG);
        let result1 = UTD.getUniformDataTypeByFilenameExtension(".png", "general.image");
        expect(result1).assertEqual(UTD.UniformDataType.PNG);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_004 end');
    })
    /**
     * @tc.number     : UDMFApiTest05
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_005
     * @tc.desc       : getUniformDataTypeByFilenameExtension MPEG4 test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_005 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".mpeg4");
        expect(result).assertEqual(UTD.UniformDataType.MPEG4);
        let result1 = UTD.getUniformDataTypeByFilenameExtension(".mp4v");
        expect(result1).assertEqual(UTD.UniformDataType.MPEG4);
        let result2 = UTD.getUniformDataTypeByFilenameExtension(".mp4");
        expect(result2).assertEqual(UTD.UniformDataType.MPEG4);
        let result3 = UTD.getUniformDataTypeByFilenameExtension(".mpeg4", "general.video");
        expect(result3).assertEqual(UTD.UniformDataType.MPEG4);
        let result4 = UTD.getUniformDataTypeByFilenameExtension(".mp4v", "general.video");
        expect(result4).assertEqual(UTD.UniformDataType.MPEG4);
        let result5 = UTD.getUniformDataTypeByFilenameExtension(".mp4", "general.video");
        expect(result5).assertEqual(UTD.UniformDataType.MPEG4);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_005 end');
    })
    /**
     * @tc.number     : UDMFApiTest06
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_006
     * @tc.desc       : getUniformDataTypeByFilenameExtension PDF test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_006 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".pdf");
        expect(result).assertEqual(UTD.UniformDataType.PDF);
        let result1 = UTD.getUniformDataTypeByFilenameExtension(".pdf", "general.composite-object");
        expect(result1).assertEqual(UTD.UniformDataType.PDF);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_006 end');
    })
    /**
     * @tc.number     : UDMFApiTest07
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_007
     * @tc.desc       : getUniformDataTypeByFilenameExtension "" test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_007 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension("");
        done();
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect(err.code).assertEqual(401);
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_007 end');
    })
    /**
     * @tc.number     : UDMFApiTest08
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_008
     * @tc.desc       : getType test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_008 start');
      try {
        let file = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.FILE, "file");
        expect(file.getType()).assertEqual(UTD.UniformDataType.FILE);

        let folder = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.FOLDER, "folder");
        expect(folder.getType()).assertEqual(UTD.UniformDataType.FOLDER);

        let audio = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.AUDIO, "audio");
        expect(audio.getType()).assertEqual(UTD.UniformDataType.AUDIO);

        let video = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.VIDEO, "video");
        expect(video.getType()).assertEqual(UTD.UniformDataType.VIDEO);

        let hyperlink = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.HYPERLINK, "hyperlink");
        expect(hyperlink.getType()).assertEqual(UTD.UniformDataType.HYPERLINK);

        let text = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.TEXT, "text");
        expect(text.getType()).assertEqual(UTD.UniformDataType.TEXT);

        let jpeg = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.JPEG, "jpeg");
        expect(jpeg.getType()).assertEqual(UTD.UniformDataType.JPEG);

        let atomicService = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE, "atomicService");
        expect(atomicService.getType()).assertEqual(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE);

        let appitem = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.OPENHARMONY_APP_ITEM, "appitem");
        expect(appitem.getType()).assertEqual(UTD.UniformDataType.OPENHARMONY_APP_ITEM);

        let pixelMap = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP, "pixelMap");
        expect(pixelMap.getType()).assertEqual(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_008 end');
    })
    /**
     * @tc.number     : UDMFApiTest09
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009
     * @tc.desc       : getRecords test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 start');
      try {
        let file = new unifiedDataChannel.File();
        file.uri = "fileUri";
        let fileDetails: Record<string, string> = {
          'fileTitle': 'fileTitle',
          'fileValue': 'fileValue'
        };
        file.details = fileDetails;

        let folder = new unifiedDataChannel.Folder();
        folder.folderUri = "folderUri";
        folder.uri = "folderUri1111111111";
        let folderDetails: Record<string, string> = {
          'folderTitle': 'folderTitle',
          'folderValue': 'folderValue'
        };
        folder.details = folderDetails;

        let audio = new unifiedDataChannel.Audio();
        audio.audioUri = "audioUri";
        audio.uri = "audioUri2222222222";
        let audioDetails: Record<string, string> = {
          'audioTitle': 'audioTitle',
          'audioValue': 'audioValue'
        };
        audio.details = audioDetails;

        let video = new unifiedDataChannel.Video();
        video.videoUri = "videoUri";
        video.uri = "videoUri3333333333";
        let videoDetails: Record<string, string> = {
          'videoTitle': 'videoTitle',
          'videoValue': 'videoValue'
        };
        video.details = videoDetails;

        let image = new unifiedDataChannel.Image();
        image.imageUri = "imageUri";
        image.uri = "imageUri4444444444";
        let imageDetails: Record<string, string> = {
          'imageTitle': 'imageTitle',
          'imageValue': 'imageValue'
        };
        image.details = imageDetails;

        let image1 = new unifiedDataChannel.Image();
        image1.imageUri = "imageUri1111111111";
        let unifiedData = new unifiedDataChannel.UnifiedData();
        unifiedData.addRecord(file);
        unifiedData.addRecord(folder);
        unifiedData.addRecord(audio);
        unifiedData.addRecord(video);
        unifiedData.addRecord(image);
        unifiedData.addRecord(image1);
        let records = unifiedData.getRecords();
        expect(records.length).assertEqual(6);
        let re = records[0] as unifiedDataChannel.File;
        expect(re.getType()).assertEqual("general.file");
        expect(re.uri).assertEqual(file.uri);
        expect(JSON.stringify(re.details)).assertEqual(JSON.stringify(file.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 file: ' + re.details);
        let re1 = records[1] as unifiedDataChannel.Folder;
        expect(re1.getType()).assertEqual("general.folder");
        expect(re1.folderUri).assertEqual(folder.folderUri);
        expect(re1.uri).assertEqual(folder.uri);
        expect(JSON.stringify(re1.details)).assertEqual(JSON.stringify(folder.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 folder: ' + re1.details);
        let re2 = records[2] as unifiedDataChannel.Audio;
        expect(re2.getType()).assertEqual("general.audio");
        expect(re2.audioUri).assertEqual(audio.audioUri);
        expect(re2.uri).assertEqual(audio.uri);
        expect(JSON.stringify(re2.details)).assertEqual(JSON.stringify(audio.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 audio: ' + re2.details);
        let re3 = records[3] as unifiedDataChannel.Video;
        expect(re3.getType()).assertEqual("general.video");
        expect(re3.videoUri).assertEqual(video.videoUri);
        expect(re3.uri).assertEqual(video.uri);
        expect(JSON.stringify(re3.details)).assertEqual(JSON.stringify(video.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 video: ' + re3.details);
        let re4 = records[4] as unifiedDataChannel.Image;
        expect(re4.getType()).assertEqual("general.image");
        expect(re4.imageUri).assertEqual(image.imageUri);
        expect(re4.uri).assertEqual(image.uri);
        expect(JSON.stringify(re4.details)).assertEqual(JSON.stringify(image.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 image: ' + re4.details);
        let re5 = records[5] as unifiedDataChannel.Image;
        expect(re5.getType()).assertEqual("general.image");
        expect(re5.imageUri).assertEqual(image1.imageUri);
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 image: ' + re5.details);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 end');
    })
    /**
     * @tc.number     : UDMFApiTest10
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010
     * @tc.desc       : getRecords test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010 start');
      try {
        let text = new unifiedDataChannel.Text();
        let textDetails: Record<string, string> = {
          'textTitle': 'textTitle',
          'textValue': 'textValue'
        };
        text.details = textDetails;

        let html = new unifiedDataChannel.HTML();
        html.htmlContent = "htmlContent";
        html.plainContent = "plainContent";
        let htmlDetails: Record<string, string> = {
          'htmlTitle': 'htmlTitle',
          'htmlValue': 'htmlValue'
        };
        html.details = htmlDetails;

        let hyperlink = new unifiedDataChannel.Hyperlink();
        hyperlink.url = "hyperlinkurl";
        hyperlink.description = "hyperlinkdescription";
        let hyperlinkDetails: Record<string, string> = {
          'hyperlinkTitle': 'hyperlinkTitle',
          'hyperlinkValue': 'hyperlinkValue'
        };
        hyperlink.details = hyperlinkDetails;

        let plainText = new unifiedDataChannel.PlainText();
        plainText.textContent = "plaintext";
        let plainTextDetails: Record<string, string> = {
          'plainTextTitle': 'plainTextTitle',
          'plainTextValue': 'plainTextValue'
        };
        plainText.details = plainTextDetails;
        plainText.textAbstract = "plainTextAbstract"

        let unifiedData = new unifiedDataChannel.UnifiedData();
        unifiedData.addRecord(text);
        unifiedData.addRecord(html);
        unifiedData.addRecord(hyperlink);
        unifiedData.addRecord(plainText);
        let records = unifiedData.getRecords();
        expect(records.length).assertEqual(4);
        let re = records[0] as unifiedDataChannel.Text;
        expect(re.getType()).assertEqual("general.text");
        expect(JSON.stringify(re.details)).assertEqual(JSON.stringify(text.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010 text: ' + re.details);
        let re1 = records[1] as unifiedDataChannel.HTML;
        expect(re1.getType()).assertEqual("general.html");
        expect(re1.htmlContent).assertEqual(html.htmlContent);
        expect(re1.plainContent).assertEqual(html.plainContent);
        expect(JSON.stringify(re1.details)).assertEqual(JSON.stringify(html.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010 html: ' + re1.details);
        let re2 = records[2] as unifiedDataChannel.Hyperlink;
        expect(re2.getType()).assertEqual("general.hyperlink");
        expect(re2.url).assertEqual(hyperlink.url);
        expect(re2.description).assertEqual(hyperlink.description);
        expect(JSON.stringify(re2.details)).assertEqual(JSON.stringify(hyperlink.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010 hyperlink: ' + re2.details);
        let re3 = records[3] as unifiedDataChannel.PlainText;
        expect(re3.getType()).assertEqual("general.plain-text");
        expect(re3.textContent).assertEqual(plainText.textContent);
        expect(re3.textAbstract).assertEqual(plainText.textAbstract);
        expect(JSON.stringify(re3.details)).assertEqual(JSON.stringify(plainText.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010 text: ' + re3.details);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010 end');
    })
    /**
     * @tc.number     : UDMFApiTest11
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011
     * @tc.desc       : getRecords test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011 start');
      try {
        let systemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
        let systemDefinedRecordDetails: Record<String, Int | Long | Double | String | Uint8Array> | undefined = {
          'systemDefinedRecordDetailsString': 'systemDefinedRecordDetailsString',
          'systemDefinedRecordDetailsNumber': 10,
          'systemDefinedRecordDetailsUint8Array': new Uint8Array([1, 2, 3, 4, 5, 6, 7])
        };
        systemDefinedRecord.details = systemDefinedRecordDetails;

        let systemDefinedForm = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.formId = 20;
        systemDefinedForm.module = "systemDefinedForm-module";
        systemDefinedForm.formName = "systemDefinedForm-formName";
        systemDefinedForm.bundleName = "systemDefinedForm-bundleName";
        systemDefinedForm.abilityName = "systemDefinedForm-abilityName";
        let systemDefinedFormDetails: Record<String, Int | Long | Double | String | Uint8Array> | undefined = {
          'systemDefinedFormString': 'systemDefinedFormString',
          'systemDefinedFormNumber': 10,
          'systemDefinedFormUint8Array': new Uint8Array([1, 2, 3, 4, 5, 6, 7])
        };
        systemDefinedForm.details = systemDefinedFormDetails;

        let systemDefinedAppItem = new unifiedDataChannel.SystemDefinedAppItem();
        systemDefinedAppItem.appId = "systemDefinedAppItem-appId";
        systemDefinedAppItem.appName = "systemDefinedAppItem-appName";
        systemDefinedAppItem.appIconId = "systemDefinedAppItem-appIconId";
        systemDefinedAppItem.appLabelId = "systemDefinedAppItem-appLabelId";
        systemDefinedAppItem.bundleName = "systemDefinedAppItem-bundleName";
        systemDefinedAppItem.abilityName = "systemDefinedAppItem-abilityName";
        let systemDefinedAppItemDetails: Record<String, Int | Long | Double | String | Uint8Array> | undefined = {
          'systemDefinedAppItemString': 'systemDefinedAppItemString',
          'systemDefinedAppItemNumber': 10,
          'systemDefinedAppItemUint8Array': new Uint8Array([1, 2, 3, 4, 5, 6, 7])
        };
        systemDefinedAppItem.details = systemDefinedAppItemDetails;

        let systemDefinedPixelMap = new unifiedDataChannel.SystemDefinedPixelMap();
        let systemDefinedPixelMapDetails: Record<String, Int | Long | Double | String | Uint8Array> | undefined = {
          'systemDefinedPixelMapString': 'systemDefinedPixelMapString',
          'systemDefinedPixelMapNumber': 10,
          'systemDefinedPixelMapUint8Array': new Uint8Array([1, 2, 3, 4, 5, 6, 7])
        };
        systemDefinedPixelMap.details = systemDefinedPixelMapDetails;
        let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7]);
        systemDefinedPixelMap.rawData = u8Array;
        let unifiedData = new unifiedDataChannel.UnifiedData();
        unifiedData.addRecord(systemDefinedRecord);
        unifiedData.addRecord(systemDefinedForm);
        unifiedData.addRecord(systemDefinedAppItem);
        unifiedData.addRecord(systemDefinedPixelMap);
        let records = unifiedData.getRecords();
        expect(records.length).assertEqual(4);

        let re = records[0] as unifiedDataChannel.SystemDefinedRecord;
        expect(re.getType()).assertEqual("SystemDefinedType");
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011 SystemDefinedRecord details: ' + re.details);
        let re1 = records[1] as unifiedDataChannel.SystemDefinedForm;
        expect(re1.getType()).assertEqual("openharmony.form");
        expect(re1.formId).assertEqual(systemDefinedForm.formId);
        expect(re1.formName).assertEqual(systemDefinedForm.formName);
        expect(re1.bundleName).assertEqual(systemDefinedForm.bundleName);
        expect(re1.abilityName).assertEqual(systemDefinedForm.abilityName);
        expect(re1.module).assertEqual(systemDefinedForm.module);
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011 SystemDefinedForm details: ' + re1.details);
        let re2 = records[2] as unifiedDataChannel.SystemDefinedAppItem;
        expect(re2.getType()).assertEqual("openharmony.app-item");
        expect(re2.appId).assertEqual(systemDefinedAppItem.appId);
        expect(re2.appName).assertEqual(systemDefinedAppItem.appName);
        expect(re2.appIconId).assertEqual(systemDefinedAppItem.appIconId);
        expect(re2.appLabelId).assertEqual(systemDefinedAppItem.appLabelId);
        expect(re2.bundleName).assertEqual(systemDefinedAppItem.bundleName);
        expect(re2.abilityName).assertEqual(systemDefinedAppItem.abilityName);
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011 SystemDefinedAppItem details: ' + re2.details);
        let re3 = records[3] as unifiedDataChannel.SystemDefinedPixelMap;
        expect(re3.getType()).assertEqual("openharmony.pixel-map");
        expect(JSON.stringify(re3.rawData)).assertEqual(JSON.stringify(u8Array));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011 SystemDefinedPixelMap details: ' + re3.details);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011 end');
    })
    /**
     * @tc.number     : UDMFApiTest12
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_012
     * @tc.desc       : getRecords test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_012 start');
      try {
        let record = new unifiedDataChannel.UnifiedRecord();
        let plainText = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.PLAIN_TEXT, "PLAIN_TEXT");
        let folder = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.FOLDER, "FOLDER");
        let file = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.FILE, "FILE");
        let audio = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.AUDIO, "AUDIO");
        let video = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.VIDEO, "VIDEO");
        let image = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.IMAGE, "IMAGE");
        let hyperlink = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.HYPERLINK, "HYPERLINK");
        let html = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.HTML, "HTML");
        let text = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.TEXT, "TEXT");
        let jpeg = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.JPEG, "JPEG");
        let png = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.PNG, "PNG");
        let mpeg4 = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.MPEG4, "MPEG4");
        let pixelMap = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP, "OPENHARMONY_PIXEL_MAP");
        let atomicService = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE, "OPENHARMONY_ATOMIC_SERVICE");
        let appItem = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.OPENHARMONY_APP_ITEM, "OPENHARMONY_APP_ITEM");
        let pdf = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.PDF, "PDF");
        let unifiedData = new unifiedDataChannel.UnifiedData();
        unifiedData.addRecord(record);
        unifiedData.addRecord(plainText);
        unifiedData.addRecord(folder);
        unifiedData.addRecord(file);
        unifiedData.addRecord(audio);
        unifiedData.addRecord(video);
        unifiedData.addRecord(image);
        unifiedData.addRecord(hyperlink);
        unifiedData.addRecord(html);
        unifiedData.addRecord(text);
        unifiedData.addRecord(jpeg);
        unifiedData.addRecord(png);
        unifiedData.addRecord(mpeg4);
        unifiedData.addRecord(pixelMap);
        unifiedData.addRecord(atomicService);
        unifiedData.addRecord(appItem);
        unifiedData.addRecord(pdf);
        let records = unifiedData.getRecords();
        expect(records.length).assertEqual(17);

        let re = records[0];
        expect(re.getType()).assertEqual("");
        let re1 = records[1] as unifiedDataChannel.PlainText;
        expect(re1.getType()).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
        expect(re1.getValue()).assertEqual("PLAIN_TEXT");
        let re2 = records[2] as unifiedDataChannel.Folder;
        expect(re2.getType()).assertEqual(UTD.UniformDataType.FOLDER);
        expect(re2.getValue()).assertEqual("FOLDER");
        let re3 = records[3] as unifiedDataChannel.File;
        expect(re3.getType()).assertEqual(UTD.UniformDataType.FILE);
        expect(re3.getValue()).assertEqual("FILE");
        let re4 = records[4] as unifiedDataChannel.Audio;
        expect(re4.getType()).assertEqual(UTD.UniformDataType.AUDIO);
        expect(re4.getValue()).assertEqual("AUDIO");
        let re5 = records[5] as unifiedDataChannel.Video;
        expect(re5.getType()).assertEqual(UTD.UniformDataType.VIDEO);
        expect(re5.getValue()).assertEqual("VIDEO")
        let re6 = records[6] as unifiedDataChannel.Image;
        expect(re6.getType()).assertEqual(UTD.UniformDataType.IMAGE);
        expect(re6.getValue()).assertEqual("IMAGE");
        let re7 = records[7] as unifiedDataChannel.Hyperlink;
        expect(re7.getType()).assertEqual(UTD.UniformDataType.HYPERLINK);
        expect(re7.getValue()).assertEqual("HYPERLINK");
        let re8 = records[8] as unifiedDataChannel.HTML;
        expect(re8.getType()).assertEqual(UTD.UniformDataType.HTML);
        expect(re8.getValue()).assertEqual("HTML");
        let re9 = records[9] as unifiedDataChannel.Text;
        expect(re9.getType()).assertEqual(UTD.UniformDataType.TEXT);
        expect(re9.getValue()).assertEqual("TEXT");
        let re10 = records[10];
        expect(re10.getType()).assertEqual(UTD.UniformDataType.JPEG);
        expect(re10.getValue()).assertEqual("JPEG");
        let re11 = records[11];
        expect(re11.getType()).assertEqual(UTD.UniformDataType.PNG);
        expect(re11.getValue()).assertEqual("PNG");
        let re12 = records[12];
        expect(re12.getType()).assertEqual(UTD.UniformDataType.MPEG4);
        expect(re12.getValue()).assertEqual("MPEG4");
        let re13 = records[13];
        expect(re13.getType()).assertEqual(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP);
        expect(re13.getValue()).assertEqual("OPENHARMONY_PIXEL_MAP");
        let re14 = records[14];
        expect(re14.getType()).assertEqual(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE);
        expect(re14.getValue()).assertEqual("OPENHARMONY_ATOMIC_SERVICE");
        let re15 = records[15];
        expect(re15.getType()).assertEqual(UTD.UniformDataType.OPENHARMONY_APP_ITEM);
        expect(re15.getValue()).assertEqual("OPENHARMONY_APP_ITEM");
        let re16 = records[16];
        expect(re16.getType()).assertEqual(UTD.UniformDataType.PDF);
        expect(re16.getValue()).assertEqual("PDF");
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_012 end');
    })
    /**
     * @tc.number     : UDMFApiTest13
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_013
     * @tc.desc       : insertData queryData callback test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_013 start');
      let options1: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options1, unifiedData, (e, data) => {
          let options2: unifiedDataChannel.Options = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data
          };
          unifiedDataChannel.queryData(options2, (err, ret) => {
            if (ret !== undefined) {
              let size = ret.length;
              for (let i = 0; i < size; i++) {
                let records = ret[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  if (records[j].getType() === 'general.plain-text') {
                    let text: unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                    expect(text.getType()).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
                  }
                }
              }
            }
            done();
          });
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        let err = error as BusinessError;
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_013 end');
    })

    /**
     * @tc.number     : UDMFApiTest14
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_014
     * @tc.desc       : insertData queryData promise test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_013 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        let data = await unifiedDataChannel.insertData(options, unifiedData);
        let options2: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };

        let ret = await unifiedDataChannel.queryData(options2);
        if (ret !== undefined) {
          let size = ret.length;
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              if (records[j].getType() === 'general.plain-text') {
                let text: unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                expect(text.getType()).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
              }
            }
          }
        }
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_014 end');
    })
    hilog.info(domain, tag, '%{public}s', 'UDMFApiTest end');
  });
}

