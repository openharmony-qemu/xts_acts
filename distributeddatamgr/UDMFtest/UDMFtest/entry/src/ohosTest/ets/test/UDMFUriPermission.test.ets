/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';

let tag: string = 'testTag: '

export default function UriPermissionTest() {
  describe("UriPermissionTest", (): void => {
    /**
    * @tc.name   UDMF_UriPermission_NONE_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_NONE_Test_0100
    * @tc.desc   Test UriPermission NONE enum value equals 0.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_UriPermission_NONE_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_UriPermission_NONE_Test_0100 start');
      try {
        let nonePermission = unifiedDataChannel.UriPermission.NONE;
        expect(nonePermission).assertEqual(0);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_NONE_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_READ_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_READ_Test_0100
    * @tc.desc   Test UriPermission READ enum value equals 1.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_UriPermission_READ_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_UriPermission_READ_Test_0100 start');
      try {
        let readPermission = unifiedDataChannel.UriPermission.READ;
        expect(readPermission).assertEqual(1);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_READ_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_WRITE_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_WRITE_Test_0100
    * @tc.desc   Test UriPermission WRITE enum value equals 2.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_UriPermission_WRITE_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_UriPermission_WRITE_Test_0100 start');
      try {
        let writePermission = unifiedDataChannel.UriPermission.WRITE;
        expect(writePermission).assertEqual(2);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_WRITE_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_PERSIST_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_PERSIST_Test_0100
    * @tc.desc   Test UriPermission PERSIST enum value equals 3.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_UriPermission_PERSIST_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_UriPermission_PERSIST_Test_0100 start');
      try {
        let persistPermission = unifiedDataChannel.UriPermission.PERSIST;
        expect(persistPermission).assertEqual(3);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_PERSIST_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_PROPERTIES_NONE_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_PROPERTIES_NONE_Test_0100
    * @tc.desc   Test setting NONE permission to uriAuthorizationPolicies property.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_UriPermission_PROPERTIES_NONE_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_NONE_Test_0100 start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      try {
        unifiedData.properties.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.NONE];
        if (unifiedData.properties.uriAuthorizationPolicies !== undefined) {
          expect(unifiedData.properties.uriAuthorizationPolicies[0]).assertEqual(0);
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_NONE_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_PROPERTIES_READ_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_PROPERTIES_READ_Test_0100
    * @tc.desc   Test setting READ permission to uriAuthorizationPolicies property.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_UriPermission_PROPERTIES_READ_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_READ_Test_0100 start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      try {
        unifiedData.properties.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.READ];
        if (unifiedData.properties.uriAuthorizationPolicies !== undefined) {
          expect(unifiedData.properties.uriAuthorizationPolicies[0]).assertEqual(1);
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_READ_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_PROPERTIES_WRITE_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_PROPERTIES_WRITE_Test_0100
    * @tc.desc   Test setting WRITE permission to uriAuthorizationPolicies property.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_UriPermission_PROPERTIES_WRITE_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_WRITE_Test_0100 start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      try {
        unifiedData.properties.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.WRITE];
        if (unifiedData.properties.uriAuthorizationPolicies !== undefined) {
          expect(unifiedData.properties.uriAuthorizationPolicies[0]).assertEqual(2);
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_WRITE_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_PROPERTIES_PERSIST_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_PROPERTIES_PERSIST_Test_0100
    * @tc.desc   Test setting PERSIST permission to uriAuthorizationPolicies property.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_UriPermission_PROPERTIES_PERSIST_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_PERSIST_Test_0100 start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      try {
        unifiedData.properties.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.PERSIST];
        if (unifiedData.properties.uriAuthorizationPolicies !== undefined) {
          expect(unifiedData.properties.uriAuthorizationPolicies[0]).assertEqual(3);
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_PERSIST_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_PROPERTIES_EmptyArray_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_PROPERTIES_EmptyArray_Test_0100
    * @tc.desc   Test setting empty array to uriAuthorizationPolicies property.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_UriPermission_PROPERTIES_EmptyArray_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_EmptyArray_Test_0100 start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      try {
        unifiedData.properties.uriAuthorizationPolicies = [];
        if (unifiedData.properties.uriAuthorizationPolicies !== undefined) {
          expect(unifiedData.properties.uriAuthorizationPolicies.length).assertEqual(0);
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_EmptyArray_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_Html_UriAuthorizationPolicies_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_Html_UriAuthorizationPolicies_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies on HTML record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_Html_UriAuthorizationPolicies_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_Html_UriAuthorizationPolicies_Test_0100 start');
      try {
        let html = new unifiedDataChannel.HTML();
        html.htmlContent = '<div><p>Test</p></div>';
        html.plainContent = 'Test content';
        html.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.READ];
        expect(html.htmlContent).assertEqual('<div><p>Test</p></div>');
        expect(html.plainContent).assertEqual('Test content');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_Html_UriAuthorizationPolicies_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_Html_UriAuthorizationPolicies_Undefined_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_Html_UriAuthorizationPolicies_Undefined_Test_0100
    * @tc.desc   Test setting undefined to uriAuthorizationPolicies on HTML record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_Html_UriAuthorizationPolicies_Undefined_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_Html_UriAuthorizationPolicies_Undefined_Test_0100 start');
      try {
        let html = new unifiedDataChannel.HTML();
        html.htmlContent = '<div><p>Test</p></div>';
        html.uriAuthorizationPolicies = undefined;
        expect(html.htmlContent).assertEqual('<div><p>Test</p></div>');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_Html_UriAuthorizationPolicies_Undefined_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_File_UriAuthorizationPolicies_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_File_UriAuthorizationPolicies_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies on File record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_File_UriAuthorizationPolicies_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_File_UriAuthorizationPolicies_Test_0100 start');
      try {
        let file = new unifiedDataChannel.File();
        file.details = {
          name: 'test',
          type: 'txt'
        };
        file.uri = 'file://test.txt';
        file.uriAuthorizationPolicies = [
          unifiedDataChannel.UriPermission.READ,
          unifiedDataChannel.UriPermission.WRITE
        ];
        expect(file.uri).assertEqual('file://test.txt');
        expect(JSON.stringify(file.details)).assertEqual(JSON.stringify({ name: 'test', type: 'txt' }));
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_File_UriAuthorizationPolicies_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_File_UriAuthorizationPolicies_Empty_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_File_UriAuthorizationPolicies_Empty_Test_0100
    * @tc.desc   Test setting empty array to uriAuthorizationPolicies on File record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_File_UriAuthorizationPolicies_Empty_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_File_UriAuthorizationPolicies_Empty_Test_0100 start');
      try {
        let file = new unifiedDataChannel.File();
        file.uri = 'file://test.txt';
        file.uriAuthorizationPolicies = [];
        expect(file.uri).assertEqual('file://test.txt');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_File_UriAuthorizationPolicies_Empty_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_Image_UriAuthorizationPolicies_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriAuthorizationPolicies_Image_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies on Image record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_Image_UriAuthorizationPolicies_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_Image_UriAuthorizationPolicies_Test_0100 start');
      try {
        let image = new unifiedDataChannel.Image();
        image.imageUri = 'file://test.jpg';
        image.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.READ];
        expect(image.imageUri).assertEqual('file://test.jpg');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_Image_UriAuthorizationPolicies_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_Video_UriAuthorizationPolicies_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriAuthorizationPolicies_Video_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies on Video record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_Video_UriAuthorizationPolicies_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_Video_UriAuthorizationPolicies_Test_0100 start');
      try {
        let video = new unifiedDataChannel.Video();
        video.videoUri = 'file://test.mp4';
        video.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.PERSIST];
        expect(video.videoUri).assertEqual('file://test.mp4');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_Video_UriAuthorizationPolicies_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_Audio_UriAuthorizationPolicies_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriAuthorizationPolicies_Audio_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies on Audio record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_Audio_UriAuthorizationPolicies_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_Audio_UriAuthorizationPolicies_Test_0100 start');
      try {
        let audio = new unifiedDataChannel.Audio();
        audio.audioUri = 'file://test.mp3';
        audio.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.NONE];
        expect(audio.audioUri).assertEqual('file://test.mp3');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_Audio_UriAuthorizationPolicies_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_Folder_UriAuthorizationPolicies_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriAuthorizationPolicies_Folder_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies on Folder record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_Folder_UriAuthorizationPolicies_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_Folder_UriAuthorizationPolicies_Test_0100 start');
      try {
        let folder = new unifiedDataChannel.Folder();
        folder.folderUri = 'file://testFolder';
        folder.uriAuthorizationPolicies = [
          unifiedDataChannel.UriPermission.READ,
          unifiedDataChannel.UriPermission.WRITE
        ];
        expect(folder.folderUri).assertEqual('file://testFolder');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_Folder_UriAuthorizationPolicies_Test_0100 end');
    })
	
	    * @tc.name   UDMF_HTML_UriAuthorizationPolicies_Read_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_HTML_UriAuthorizationPolicies_Read_Test_0100
    * @tc.desc   Test setting READ permission to uriAuthorizationPolicies on HTML struct.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_HTML_UriAuthorizationPolicies_Read_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_HTML_UriAuthorizationPolicies_Read_Test_0100 start');
      try {
        let html: uniformDataStruct.HTML = {
          uniformDataType: 'general.html',
          htmlContent: '<div><p>Test</p></div>',
          plainContent: 'Test content',
          uriAuthorizationPolicies: [1]
        };
        expect(html.htmlContent).assertEqual('<div><p>Test</p></div>');
        expect(html.plainContent).assertEqual('Test content');
        expect(html.uriAuthorizationPolicies![0]).assertEqual(1);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_HTML_UriAuthorizationPolicies_Read_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_HTML_UriAuthorizationPolicies_Write_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_HTML_UriAuthorizationPolicies_Write_Test_0100
    * @tc.desc   Test setting WRITE permission to uriAuthorizationPolicies on HTML struct.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_HTML_UriAuthorizationPolicies_Write_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_HTML_UriAuthorizationPolicies_Write_Test_0100 start');
      try {
        let html: uniformDataStruct.HTML = {
          uniformDataType: 'general.html',
          htmlContent: '<div><p>Test</p></div>',
          uriAuthorizationPolicies: [2]
        };
        expect(html.htmlContent).assertEqual('<div><p>Test</p></div>');
        expect(html.uriAuthorizationPolicies![0]).assertEqual(2);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_HTML_UriAuthorizationPolicies_Write_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_HTML_UriAuthorizationPolicies_EmptyArray_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_HTML_UriAuthorizationPolicies_EmptyArray_Test_0100
    * @tc.desc   Test setting empty array to uriAuthorizationPolicies on HTML struct.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_HTML_UriAuthorizationPolicies_EmptyArray_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_HTML_UriAuthorizationPolicies_EmptyArray_Test_0100 start');
      try {
        let html: uniformDataStruct.HTML = {
          uniformDataType: 'general.html',
          htmlContent: '<div><p>Test</p></div>',
          uriAuthorizationPolicies: []
        };
        expect(html.htmlContent).assertEqual('<div><p>Test</p></div>');
        expect(html.uriAuthorizationPolicies!.length).assertEqual(0);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_HTML_UriAuthorizationPolicies_EmptyArray_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_HTML_UriAuthorizationPolicies_Undefined_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_HTML_UriAuthorizationPolicies_Undefined_Test_0100
    * @tc.desc   Test setting undefined to uriAuthorizationPolicies on HTML struct.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_HTML_UriAuthorizationPolicies_Undefined_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_HTML_UriAuthorizationPolicies_Undefined_Test_0100 start');
      try {
        let html: uniformDataStruct.HTML = {
          uniformDataType: 'general.html',
          htmlContent: '<div><p>Test</p></div>',
          uriAuthorizationPolicies: undefined
        };
        expect(html.htmlContent).assertEqual('<div><p>Test</p></div>');
        expect(html.uriAuthorizationPolicies).assertUndefined();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_HTML_UriAuthorizationPolicies_Undefined_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_HTML_UriAuthorizationPolicies_DefaultValue_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_HTML_UriAuthorizationPolicies_DefaultValue_Test_0100
    * @tc.desc   Test default value of uriAuthorizationPolicies on HTML struct is undefined.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_HTML_UriAuthorizationPolicies_DefaultValue_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_HTML_UriAuthorizationPolicies_DefaultValue_Test_0100 start');
      try {
        let html: uniformDataStruct.HTML = {
          uniformDataType: 'general.html',
          htmlContent: '<div><p>Test</p></div>'
        };
        expect(html.htmlContent).assertEqual('<div><p>Test</p></div>');
        expect(html.uriAuthorizationPolicies).assertUndefined();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_HTML_UriAuthorizationPolicies_DefaultValue_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_FileUri_UriAuthorizationPolicies_Read_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_FileUri_UriAuthorizationPolicies_Read_Test_0100
    * @tc.desc   Test setting READ permission to uriAuthorizationPolicies on FileUri struct.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_FileUri_UriAuthorizationPolicies_Read_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_FileUri_UriAuthorizationPolicies_Read_Test_0100 start');
      try {
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://test.txt',
          fileType: 'txt',
          uriAuthorizationPolicies: [1]
        };
        expect(fileUri.oriUri).assertEqual('file://test.txt');
        expect(fileUri.fileType).assertEqual('txt');
        expect(fileUri.uriAuthorizationPolicies![0]).assertEqual(1);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_FileUri_UriAuthorizationPolicies_Read_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_FileUri_UriAuthorizationPolicies_Write_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_FileUri_UriAuthorizationPolicies_Write_Test_0100
    * @tc.desc   Test setting WRITE permission to uriAuthorizationPolicies on FileUri struct.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_FileUri_UriAuthorizationPolicies_Write_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_FileUri_UriAuthorizationPolicies_Write_Test_0100 start');
      try {
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://document.pdf',
          fileType: 'pdf',
          uriAuthorizationPolicies: [2]
        };
        expect(fileUri.oriUri).assertEqual('file://document.pdf');
        expect(fileUri.fileType).assertEqual('pdf');
        expect(fileUri.uriAuthorizationPolicies![0]).assertEqual(2);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_FileUri_UriAuthorizationPolicies_Write_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_FileUri_UriAuthorizationPolicies_Persist_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_FileUri_UriAuthorizationPolicies_Persist_Test_0100
    * @tc.desc   Test setting PERSIST permission to uriAuthorizationPolicies on FileUri struct.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_FileUri_UriAuthorizationPolicies_Persist_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_FileUri_UriAuthorizationPolicies_Persist_Test_0100 start');
      try {
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://image.jpg',
          fileType: 'jpg',
          uriAuthorizationPolicies: [3]
        };
        expect(fileUri.oriUri).assertEqual('file://image.jpg');
        expect(fileUri.fileType).assertEqual('jpg');
        expect(fileUri.uriAuthorizationPolicies![0]).assertEqual(3);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_FileUri_UriAuthorizationPolicies_Persist_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_FileUri_UriAuthorizationPolicies_EmptyArray_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_FileUri_UriAuthorizationPolicies_EmptyArray_Test_0100
    * @tc.desc   Test setting empty array to uriAuthorizationPolicies on FileUri struct.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_FileUri_UriAuthorizationPolicies_EmptyArray_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_FileUri_UriAuthorizationPolicies_EmptyArray_Test_0100 start');
      try {
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://test.txt',
          fileType: 'txt',
          uriAuthorizationPolicies: []
        };
        expect(fileUri.oriUri).assertEqual('file://test.txt');
        expect(fileUri.fileType).assertEqual('txt');
        expect(fileUri.uriAuthorizationPolicies!.length).assertEqual(0);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_FileUri_UriAuthorizationPolicies_EmptyArray_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_FileUri_UriAuthorizationPolicies_WithDetails_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_FileUri_UriAuthorizationPolicies_WithDetails_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies with details on FileUri struct.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_FileUri_UriAuthorizationPolicies_WithDetails_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_FileUri_UriAuthorizationPolicies_WithDetails_Test_0100 start');
      try {
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://document.pdf',
          fileType: 'pdf',
          details: { size: 1024, name: 'document', type: 'pdf' },
          uriAuthorizationPolicies: [1, 2]
        };
        expect(fileUri.oriUri).assertEqual('file://document.pdf');
        expect(fileUri.fileType).assertEqual('pdf');
        expect(fileUri.details!['name']).assertEqual('document');
        expect(fileUri.details!['type']).assertEqual('pdf');
        expect(fileUri.uriAuthorizationPolicies!.length).assertEqual(2);
        expect(fileUri.uriAuthorizationPolicies![0]).assertEqual(1);
        expect(fileUri.uriAuthorizationPolicies![1]).assertEqual(2);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_FileUri_UriAuthorizationPolicies_WithDetails_Test_0100 end');
    })
  });
}