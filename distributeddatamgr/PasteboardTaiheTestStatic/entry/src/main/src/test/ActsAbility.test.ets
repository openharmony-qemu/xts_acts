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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import pasteboard from '@ohos.pasteboard'
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';
import Want from '@ohos.app.ability.Want';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let num = pasteboard.Pattern.NUMBER;
let url = pasteboard.Pattern.URL;
const ARRAY_BUFFER = new ArrayBuffer(256);
const WANT: Want = {
    bundleName: "com.acts.distributeddatamgr.pasteboardtest",
    abilityName: "com.acts.distributeddatamgr.pasteboardtest.MainAbility"
};
let HTML = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" + "    <p></p>\n" + "</body>\n" + "</html>";
let URI = 'dataability:///com.example.myapplication1/user.txt';

function contentChanges() {
    hilog.info(domain, tag, '#EVENT: The content is changed in the pasteboard')
}

export default function abilityTest() {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, 'describe        : Start');

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteDataRecord_Static_0010
         * @tc.number       PasteBoard_PasteDataRecord_0010
         * @tc.desc         Successfully cast string record to text
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0010----------");
            try{
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType");
                let record = pasteData.getRecord(0);
                let str = record.toPlainText();
                expect(str).assertEqual("valueType");
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0010----------");
            done();
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteDataRecord_Static_0020
         * @tc.number       PasteBoard_PasteDataRecord_0020
         * @tc.desc         Successfully cast pixelMap record to text
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0020----------");
            let buffer = new ArrayBuffer(128);
            let realSize: image.Size = { height: 3, width: 5 };
            let opt: image.InitializationOptions = {
                size: realSize,
                pixelFormat: image.PixelMapFormat.RGBA_8888,
                editable: true,
                alphaType: image.AlphaType.OPAQUE,
                scaleMode: image.ScaleMode.CENTER_CROP
            };
            const pixelMap = image.createPixelMapSync(buffer, opt);
            try{
                let pasteData = pasteboard.createData('pixelMap', pixelMap);
                let record = pasteData.getRecord(0);
                let data = record.pixelMap;
                let str = record.toPlainText();
                expect(str).assertEqual("");
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0020----------");
            done();
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteDataRecord_Static_0030
         * @tc.number       PasteBoard_PasteDataRecord_0030
         * @tc.desc         Successfully cast want record to text
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0030----------");
            try{
                let pasteData = pasteboard.createData('text/want', WANT);
                let record = pasteData.getRecord(0);
                let str = record.toPlainText();
                expect(str).assertEqual("");
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0030----------");
            done();
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteDataRecord_Static_0040
         * @tc.number       PasteBoard_PasteDataRecord_0040
         * @tc.desc         Successfully cast arrayBuffer record to text
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0040----------");
            try{
                let pasteData = pasteboard.createData("ArrayBuffer", ARRAY_BUFFER);
                let record = pasteData.getRecord(0);
                let str = record.toPlainText();
                expect(str).assertEqual("");
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0040----------");
            done();
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteDataRecord_Static_0050
         * @tc.number       PasteBoard_PasteDataRecord_0050
         * @tc.desc         Test pasteBoard variety createData PixelMap
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0050----------");
            let buffer = new ArrayBuffer(128);
            let realSize: image.Size = { height: 3, width: 5 };
            let opt: image.InitializationOptions = {
                size: realSize,
                pixelFormat: image.PixelMapFormat.RGBA_8888,
                editable: true,
                alphaType: image.AlphaType.OPAQUE,
                scaleMode: image.ScaleMode.CENTER_CROP
            };
            let record: Record<string, pasteboard.ValueType> = {};
            record['pixelMap'] = image.createPixelMapSync(buffer, opt);
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pixelMapRecord = pasteData.getRecord(0);
                let value: pasteboard.ValueType = await pixelMapRecord.getData('pixelMap');
                let pixelMap = value as image.PixelMap;
                let imageInfo = pixelMap.getImageInfoSync();
                expect(imageInfo != null).assertTrue();
               done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0050----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteDataRecord_Static_0060
         * @tc.number       PasteDataRecord_Pasteboard_0060
         * @tc.desc         Test pasteBoard variety createData Variety and getData
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteDataRecord_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0060----------");
            let buffer = new ArrayBuffer(128);
            let realSize: image.Size = { height: 3, width: 5 };
            let opt: image.InitializationOptions = {
                size: realSize,
                pixelFormat: image.PixelMapFormat.RGBA_8888,
                editable: true,
                alphaType: image.AlphaType.OPAQUE,
                scaleMode: image.ScaleMode.CENTER_CROP
            };
            let pixelMap:image.PixelMap = image.createPixelMapSync(buffer, opt);
            let record: Record<string, pasteboard.ValueType> = {};
            record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
            record[pasteboard.MIMETYPE_TEXT_HTML] = HTML;
            record[pasteboard.MIMETYPE_TEXT_URI] = URI;
            record['text/want'] = {
                bundleName: 'bundleName',
                abilityName: 'testAbilityName'
            } as Want;
            record['pixelMap'] = pixelMap;
            try {
                let pasteData: pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataRecord = pasteData.getRecord(0);
                let value = await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_PLAIN);
                let textPlain = value as string;
                expect(textPlain).assertEqual('hello');
                value = await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_HTML);
                let htmlData = value as string;
                expect(htmlData).assertEqual(HTML);
                value = await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_URI);
                let uriData = value as string;
                expect(uriData).assertEqual(URI);
                value = await pasteDataRecord.getData('text/want');
                let wantData = value as Want;
                expect(JSON.stringify(wantData)).assertContain('"bundleName":"bundleName","abilityName":"testAbilityName"');
                value = await pasteDataRecord.getData('pixelMap');
                let pixelMap = value as image.PixelMap;
                let imageInfo = pixelMap.getImageInfoSync();
                expect(imageInfo != null).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteDataRecord_Static_0060----------");
        })
        

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0010
         * @tc.number       SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0100
         * @tc.desc         Test pasteBoard variety createData plaintext
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0010----------");
            let record: Record<string, pasteboard.ValueType> = {};
            record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataText = pasteData.getPrimaryText();
                expect(pasteDataText).assertEqual('hello');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0010----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0020
         * @tc.number       PasteBoard_Pasteboard_0020
         * @tc.desc         Test pasteBoard variety createData plaintext
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0020----------");
            let record: Record<string, pasteboard.ValueType> = {};
            record[pasteboard.MIMETYPE_TEXT_PLAIN] = '';
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataText = pasteData.getPrimaryText();
                expect(pasteDataText).assertEqual('');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0020----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0030
         * @tc.number       SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0102
         * @tc.desc         Test pasteBoard variety createData plaintext
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0030----------");
            let record: Record<string, pasteboard.ValueType> = {};
            record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'Hello 中国!@#$%^&*()_+{}\\?.';
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataText = pasteData.getPrimaryText();
                expect(pasteDataText).assertEqual('Hello 中国!@#$%^&*()_+{}\\?.');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0030----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0040
         * @tc.number       PasteBoard_Pasteboard_0040
         * @tc.desc         Test pasteBoard variety createData plaintext
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0040----------");
            let record: Record<string, pasteboard.ValueType> = {};
            let textData = '';
            for (let i = 0; i < 301; i++) {
                textData = textData + "A";
            }
            record[pasteboard.MIMETYPE_TEXT_PLAIN] = textData;
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataText = pasteData.getPrimaryText();
                expect(pasteDataText).assertEqual(textData);
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0040----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0050
         * @tc.number       PasteBoard_Pasteboard_0050
         * @tc.desc         Test pasteBoard variety createData Want
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0050----------");
            let record: Record<string, pasteboard.ValueType> = {};
            record['text/want'] = {
                bundleName: 'bundleName',
                abilityName: 'testAbilityName'
            } as Want;
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataWant = pasteData.getPrimaryWant();
                expect(JSON.stringify(pasteDataWant)).assertContain('"bundleName":"bundleName","abilityName":"testAbilityName"');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0050----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0060
         * @tc.number       PasteBoard_Pasteboard_0060
         * @tc.desc         Test pasteBoard variety createData Arraybuffer
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0060----------");
            let record: Record<string, pasteboard.ValueType> = {};
            record['app/xml'] = new ArrayBuffer(256);
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataType = pasteData.getMimeTypes();
                expect(String(pasteDataType)).assertEqual('app/xml');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0060----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0070
         * @tc.number       PasteBoard_Pasteboard_0070
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0070----------");

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                let textData = 'Hello World!';
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                await systemPasteboard.setData(pasteData);
                let data = await systemPasteboard.getData();
                expect(data.getRecordCount()).assertEqual(1);
                let pasteDataProperty = data.getProperty();
                expect(pasteDataProperty.timestamp != null).assertTrue();
                pasteDataProperty.tag = "test_tag";
                pasteDataProperty.shareOption = pasteboard.ShareOption.LOCALDEVICE;
                data.setProperty(pasteDataProperty);
                await systemPasteboard.setData(data);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                data = await systemPasteboard.getData();
                pasteDataProperty = data.getProperty();
                expect(pasteDataProperty.timestamp != null).assertTrue();
                expect(pasteDataProperty.shareOption == 1).assertTrue();
                expect(pasteDataProperty.timestamp != null).assertTrue();
                let dataTag = data.getTag();
                expect(dataTag).assertEqual("test_tag");
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0070----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0080
         * @tc.number       PasteBoard_Pasteboard_0080
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0080----------");

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                let htmlText = '<html><head></head><body>Hello World!</body></html>';
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data = await systemPasteboard.getData();
                expect(data.getRecordCount()).assertEqual(1);
                let primaryHtml = data.getPrimaryHtml();
                expect(primaryHtml).assertEqual(htmlText);
                expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML)).assertTrue();
                expect(data.getPrimaryMimeType()).assertEqual('text/html');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0080----------");
        });

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0090
         * @tc.number       PasteBoard_Pasteboard_0090
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0090----------");

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                let htmlText = '';
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data = await systemPasteboard.getData();
                expect(data.getRecordCount()).assertEqual(1);
                let primaryHtml = data.getPrimaryHtml();
                expect(primaryHtml).assertEqual(htmlText);
                expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML)).assertTrue();
                expect(data.getPrimaryMimeType()).assertEqual('text/html');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0090----------");
        });

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0100
         * @tc.number       PasteBoard_Pasteboard_0100
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0100----------");

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                let htmlText = 'Hello 中国!@#$%^&*()_+{}\\?.';
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data = await systemPasteboard.getData();
                expect(data.getRecordCount()).assertEqual(1);
                let primaryHtml = data.getPrimaryHtml();
                expect(primaryHtml).assertEqual(htmlText);
                expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML)).assertTrue();
                expect(data.getPrimaryMimeType()).assertEqual('text/html');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0100----------");
        });

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0110
         * @tc.number       PasteBoard_Pasteboard_0110
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0110----------");

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                let textData0 = 'Hello World0';
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData0);
                let uriText = "https://www.baidu.com/";
                pasteData.addRecord(pasteboard.MIMETYPE_TEXT_URI, uriText);
                await systemPasteboard.setData(pasteData);
                let data = await systemPasteboard.getData();
                let recordCount = data.getRecordCount();
                expect(data.getRecordCount()).assertEqual(2);
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0110----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0120
         * @tc.number       PasteBoard_Pasteboard_0120
         * @tc.desc         Test pasteBoard create uri data success
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0120----------");
            try{
                let uri = "www.baidu.com";
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uri);
                expect(pasteData.getRecord(0).uri).assertEqual(uri);
                expect(pasteData.getRecord(0).mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_URI);
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0120----------");
            done();
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0130
         * @tc.number       PasteBoard_Pasteboard_0130
         * @tc.desc         Test pasteBoard create uri data success
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0130----------");
            try{
                let text = "hello";
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
                expect(pasteData.getRecord(0).plainText).assertEqual(text);
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0130----------");
            done();
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0140
         * @tc.number       PasteBoard_Pasteboard_0140
         * @tc.desc         Test pasteBoard create uri data success
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0140----------");
            try{
                let text = "hello";
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
                expect(pasteData.getRecord(0).plainText).assertEqual(text);
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0140----------");
            done();
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_PasteData_Static_0150
         * @tc.number       PasteBoard_Pasteboard_0150
         * @tc.desc         get the pastedata from system pasteBoard success
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_PasteData_Static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0150----------");
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteBoard.setData(pasteData);
                systemPasteBoard.getData((err: BusinessError | null, data: pasteboard.PasteData | undefined) => {
                    if (err?.message) {
                        hilog.info(domain, tag, "Get the pastedata from system pasteboard failed" + err);
                        expect(false).assertTrue();
                    } else {
                        let recordCount = data?.getRecordCount();
                        expect(recordCount).assertEqual(1);
                    }
                    done();
                })
            } catch(err) {
                hilog.info(domain, tag, "System pasteBoard set pastedata error,error: " + err);
                expect(false).assertTrue();
                done();
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_PasteData_Static_0150----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0010
         * @tc.number       PasteBoard_SystemPasteboard_0010
         * @tc.desc         Determine if there is data in the System pasteboard success, result is true
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0010----------");
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try {
                systemPasteBoard.setData(pasteData, (err) => {
                    let hasData = await systemPasteBoard.hasData();
                    let data = systemPasteBoard.getDataSync();
                    expect(hasData).assertTrue();
                    done();
                });
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0010----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0020
         * @tc.number       PasteBoard_SystemPasteboard_0020
         * @tc.desc         Determine if there is data in the System pasteboard success, result is true
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0020----------");
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try {
                systemPasteBoard.clearData((err) => {
                    let hasData = await systemPasteBoard.hasData();
                    expect(hasData).assertFalse();
                    done();
                });
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0020----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0030
         * @tc.number       PasteBoard_SystemPasteboard_0030
         * @tc.desc         Test pasteBoard create pixelMap record success
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0030----------");
            let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
            let systemPasteboard = pasteboard.getSystemPasteboard();
            let buffer = new ArrayBuffer(128);
            let realSize: image.Size = { height: 3, width: 5 };
            let opt: image.InitializationOptions = {
                size: realSize,
                pixelFormat: image.PixelMapFormat.RGBA_8888,
                editable: true,
                alphaType: image.AlphaType.OPAQUE,
                scaleMode: image.ScaleMode.CENTER_CROP
            };
            const pixelMap = image.createPixelMapSync(buffer, opt);
            pasteData.addRecord('pixelMap', pixelMap);
            try {
                await systemPasteboard.setData(pasteData);
                let hasDataType = systemPasteboard.hasDataType('pixelMap');
                expect(hasDataType).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0030----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0040
         * @tc.number       PasteBoard_SystemPasteboard_0040
         * @tc.desc         Test pasteBoard create want record success
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0040----------");
            let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
            let systemPasteboard = pasteboard.getSystemPasteboard();
            pasteData.addRecord('text/want', WANT);
            try {
                await systemPasteboard.setData(pasteData);
                let hasDataType = systemPasteboard.hasDataType('text/want');
                expect(hasDataType).assertTrue();
                done();
            }  catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0040----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0050
         * @tc.number       PasteBoard_SystemPasteboard_0050
         * @tc.desc         Test pasteBoard create arrayBuffer record success
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0050----------");
            let pasteData = pasteboard.createData('text/want', WANT);
            let systemPasteboard = pasteboard.getSystemPasteboard();
            pasteData.addRecord("ArrayBuffer", ARRAY_BUFFER);
            try {
                await systemPasteboard.setData(pasteData);
                let hasType = systemPasteboard.hasDataType('ArrayBuffer');
                expect(hasType).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0050----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0060
         * @tc.number       PasteBoard_SystemPasteboard_0060
         * @tc.desc         Test pasteBoard create String record success
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0060----------");
            let pasteData = pasteboard.createData("ArrayBuffer", ARRAY_BUFFER); // 修改string->ArrayBuffer
            let systemPasteboard = pasteboard.getSystemPasteboard();
            pasteData.addRecord(pasteboard.MIMETYPE_TEXT_PLAIN, "stringValueType");
            try {
                await systemPasteboard.setData(pasteData);
                let hasType = systemPasteboard.hasDataType('ArrayBuffer');
                expect(hasType).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0060----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0070
         * @tc.number       PasteBoard_SystemPasteboard_0070
         * @tc.desc         Test pasteBoard create arrayBuffer record success with 1024 bit mimeType
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0070----------");
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            pasteData.addRecord("x".repeat(1024), ARRAY_BUFFER);
            try {
                await systemPasteboard.setData(pasteData);
                let hasType = systemPasteboard.hasDataType("x".repeat(1024));
                expect(hasType).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0070----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0080
         * @tc.number       PasteBoard_SystemPasteboard_0080
         * @tc.desc         Test pasteBoard create         String record success with 512000 bit valueType<string>
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0080----------");
            let pasteData = pasteboard.createData("arrayBuffer", ARRAY_BUFFER);
            let systemPasteboard = pasteboard.getSystemPasteboard();
            let valueType = "x"
            for (let i = 0; i < 500; i++) {
                valueType = valueType + "x".repeat(1024)
            }
            pasteData.addRecord(pasteboard.MIMETYPE_TEXT_PLAIN, valueType);
            try {
                await systemPasteboard.setData(pasteData);
                let hasType = systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
                expect(hasType).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0080----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0090
         * @tc.number       PasteBoard_SystemPasteboard_0090
         * @tc.desc         Test pasteBoard create         String data fail with 1025 bit mimeType
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0090----------");
            let mimeType = "x".repeat(1025)
            try {
                let pasteData = pasteboard.createData(mimeType, ARRAY_BUFFER);
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err.code).assertEqual(401);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0090----------");
            done();
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0100
         * @tc.number       PasteBoard_SystemPasteboard_0100
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0100----------");

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                let uriText = 'https://www.baidu.com/';
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData === true).assertTrue();
                let pasteData1 = await systemPasteboard.getData();
                expect(pasteData1.getRecordCount() == 1).assertTrue();
                let primaryUri = pasteData1.getPrimaryUri();
                expect(primaryUri == uriText).assertTrue();
                expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_URI)).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0100----------");
        });

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0110
         * @tc.number       PasteBoard_SystemPasteboard_0110
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0110----------");

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                let uriText = '';
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data = await systemPasteboard.getData();
                expect(data.getPrimaryUri() == uriText).assertTrue();
                expect(data.getRecordCount()).assertEqual(1);
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0110----------");
        });

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0120
         * @tc.number       PasteBoard_SystemPasteboard_0120
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0120----------");

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                let uriText = 'Hello//';
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data = await systemPasteboard.getData();
                expect(data.getPrimaryUri() == uriText).assertTrue();
                expect(data.getRecordCount()).assertEqual(1);
                expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_URI)).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0120----------");
        });

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0130
         * @tc.number       PasteBoard_SystemPasteboard_0130
         * @tc.desc         Determine if there is data in the System pasteboard success, result is true
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0130----------");
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try{
                await systemPasteBoard.clearData();
                systemPasteBoard.hasData((err: BusinessError | null, data) => {
                    if (err?.message) {
                        hilog.info(domain, tag, "Judge whether there is data in the         System pasteBoard error,error is: " + err)
                        expect(false).assertTrue();
                    } else {
                        expect(data == false).assertTrue();
                    }
                    done();
                })
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0130----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0140
         * @tc.number       PasteBoard_SystemPasteboard_0140
         * @tc.desc         Test pasteBoard SetProperty API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, 'application/xml');
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0140----------");
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try{
                await systemPasteBoard.clearData();
                let prop = pasteData.getProperty();
                expect(prop.timestamp != null).assertTrue();
                prop.shareOption = pasteboard.ShareOption.INAPP;
                pasteData.setProperty(prop);
                let property = pasteData.getProperty();
                expect(property.shareOption == 0).assertTrue();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0140----------");
            done();
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0150
         * @tc.number       PasteBoard_SystemPasteboard_0150
         * @tc.desc         Test pasteBoard SetProperty API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0150----------");
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try{
                await systemPasteBoard.clearData();
                let prop = pasteData.getProperty();
                expect(prop.timestamp != null).assertTrue();
                prop.shareOption = pasteboard.ShareOption.LOCALDEVICE;
                pasteData.setProperty(prop);
                let property = pasteData.getProperty();
                expect(property.shareOption == 1).assertTrue();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0150----------");
            done();
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0160
         * @tc.number       PasteBoard_SystemPasteboard_0160
         * @tc.desc         Test clearDataSync when systemPasteBoard has data
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it("SUB_PasteBoard_ETS_SystemPasteboard_Static_0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0160----------");
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteBoard.setData(pasteData);
                expect(systemPasteBoard.hasDataSync()).assertEqual(true);
                systemPasteBoard.clearDataSync();
                let result = systemPasteBoard.hasDataSync();
                expect(result).assertEqual(false);
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0160----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0170
         * @tc.number       PasteBoard_SystemPasteboard_0170
         * @tc.desc         Test pasteBoard hasDataSync
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0170----------");
            let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            systemPasteboard.clearDataSync()
            try {
                expect(systemPasteboard.hasDataSync()).assertEqual(false);
                await systemPasteboard.setData(pasteData);
                let result: boolean = systemPasteboard.hasDataSync();
                expect(result).assertEqual(true);
                done();
            } catch (err: BusinessError) {
                console.error(`Failed to hasDataSync. Cause: ${err.message + err.code}`);
                expect(err.code).assertEqual('12900005');
                done();
            };
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0170----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0180
         * @tc.number       PasteBoard_SystemPasteboard_0180
         * @tc.desc         Test hasDataSync when systemPasteBoard is null
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it("SUB_PasteBoard_ETS_SystemPasteboard_Static_0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0180----------");
            try{
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "");
                let systemPasteBoard = pasteboard.getSystemPasteboard();
                systemPasteBoard.clearDataSync();
                let result = systemPasteBoard.hasDataSync();
                expect(result).assertEqual(false);
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0180----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0190
         * @tc.number       PasteBoard_SystemPasteboard_0190
         * @tc.desc         Test pasteBoard clearDataSync
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0190----------");
            let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            await systemPasteboard.setData(pasteData);
            expect(systemPasteboard.hasDataSync()).assertEqual(true);
            try {
                systemPasteboard.clearDataSync();
                expect(systemPasteboard.hasDataSync()).assertEqual(false);
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err.code).assertEqual('12900005');
            };
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0190----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0200
         * @tc.number       PasteBoard_SystemPasteboard_0200
         * @tc.desc         setData Verify the properties of the MIMETYPE_TEXT_PLAIN type
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0200----------");
            let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.setData(pasteData);
                expect(systemPasteboard.hasDataSync()).assertTrue();
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data[0]).assertEqual('text/plain');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0200----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0210
         * @tc.number       PasteBoard_SystemPasteboard_0210
         * @tc.desc         setData Verify the properties of the MIMETYPE_TEXT_HTML type
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0210----------");
            let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, 'hello');
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.setData(pasteData);
                expect(systemPasteboard.hasDataSync()).assertTrue();
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data[0]).assertEqual('text/html');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0210----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0220
         * @tc.number       PasteBoard_SystemPasteboard_0220
         * @tc.desc         setData Verify the properties of the MIMETYPE_TEXT_URI type
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0220----------");
            let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, 'hello');
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.setData(pasteData);
                expect(systemPasteboard.hasDataSync()).assertTrue();
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data[0]).assertEqual('text/html');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0220----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0230
         * @tc.number       PasteBoard_SystemPasteboard_0230
         * @tc.desc         setData Verify the properties of the MIMETYPE_PIXELMAP type
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0230----------");
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                let buffer = new ArrayBuffer(128);
                let realSize: image.Size = { height: 3, width: 5 };
                let opt: image.InitializationOptions = {
                    size: realSize,
                    pixelFormat: image.PixelMapFormat.RGBA_8888,
                    editable: true,
                    alphaType: image.AlphaType.OPAQUE,
                    scaleMode: image.ScaleMode.CENTER_CROP
                };
                const pixelMap = image.createPixelMapSync(buffer, opt);
                let pasteData = pasteboard.createData('pixelMap', pixelMap);
                await systemPasteboard.setData(pasteData);
                expect(systemPasteboard.hasDataSync()).assertTrue();
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data[0]).assertEqual('pixelMap');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0230----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0240
         * @tc.number       PasteBoard_SystemPasteboard_0240
         * @tc.desc         setData Verify the properties of the MIMETYPE_TEXT_WANT type
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0240----------");
            let pasteData: pasteboard.PasteData = pasteboard.createData('text/want', WANT);
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.setData(pasteData);
                expect(systemPasteboard.hasDataSync()).assertTrue();
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data[0]).assertEqual('text/want');
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0240----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0250
         * @tc.number       PasteBoard_SystemPasteboard_0250
         * @tc.desc         setData Verify the properties of the Customize type
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0250----------");
            let pasteData: pasteboard.PasteData = pasteboard.createData("hello/test", new ArrayBuffer(256));
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.setData(pasteData);
                expect(systemPasteboard.hasDataSync()).assertTrue();
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data[0]).assertEqual("hello/test");
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0250----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0260
         * @tc.number       PasteBoard_SystemPasteboard_0260
         * @tc.desc         setUnifiedData Verify the properties of the appRecordData type
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0260----------");
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data.length).assertEqual(0); 
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0260----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0270
         * @tc.number       PasteBoard_SystemPasteboard_0270
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0270----------");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                systemPasteboard.on('update', contentChanges);
                let textData = 'Hello World!';
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0270----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0280
         * @tc.number       PasteBoard_SystemPasteboard_0280
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0280----------");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                systemPasteboard.on('update', contentChanges);
                let htmlText = '<html><head></head><body>Hello World!</body></html>';
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0280----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0290
         * @tc.number       PasteBoard_SystemPasteboard_0290
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0290----------");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                systemPasteboard.on('update', contentChanges);
                let uriText = 'https://www.baidu.com/';
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0290----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0300
         * @tc.number       PasteBoard_SystemPasteboard_0300
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0300----------");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                systemPasteboard.on('update', contentChanges);
                let record: Record<string, pasteboard.ValueType> = {};
                let want = {
                    bundleName: "com.example.myapplication45",
                    abilityName: "com.example.myapplication45.MainAbility"
                } as Want;
                record['text/want'] = want;
                let pasteData: pasteboard.PasteData = pasteboard.createData(record);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0300----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0310
         * @tc.number       PasteBoard_SystemPasteboard_0310
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0310----------");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                systemPasteboard.on('update', contentChanges);
                let textData = 'Hello World!';
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                expect(data.getRecordCount() == 1).assertTrue();
                systemPasteboard.clearDataSync();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0310----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0320
         * @tc.number       PasteBoard_SystemPasteboard_0320
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0320----------");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                systemPasteboard.off('update', contentChanges)
                let textData = 'Hello World!';
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0320----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0330
         * @tc.number       PasteBoard_SystemPasteboard_0330
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0330----------");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                systemPasteboard.off('update', contentChanges);
                let htmlText = '<html><head></head><body>Hello World!</body></html>';
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0330----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0340
         * @tc.number       PasteBoard_SystemPasteboard_0340
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0340----------");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                systemPasteboard.off('update', contentChanges);
                let uriText = 'https://www.baidu.com/';
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0340----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0350
         * @tc.number       PasteBoard_SystemPasteboard_0350
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0350----------");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                systemPasteboard.off('update', contentChanges)
                let record: Record<string, pasteboard.ValueType> = {};
                let want = {
                    bundleName: "com.example.myapplication45",
                    abilityName: "com.example.myapplication45.MainAbility"
                } as Want;
                record['text/want'] = want;
                let pasteData: pasteboard.PasteData = pasteboard.createData(record);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0350----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0360
         * @tc.number       PasteBoard_SystemPasteboard_0360
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0360----------");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                systemPasteboard.off('update', contentChanges);
                let textData = 'Hello World!';
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                await systemPasteboard.setData(pasteData);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                expect(data.getRecordCount() == 1).assertTrue();
                systemPasteboard.clearDataSync();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0360----------");
        })

        /**
         * @tc.name         SUB_PasteBoard_ETS_SystemPasteboard_Static_0370
         * @tc.number       PasteBoard_SystemPasteboard_0370
         * @tc.desc         Test pasteBoard API functionality.
         * @tc.size         MEDIUM
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('SUB_PasteBoard_ETS_SystemPasteboard_Static_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0370----------");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                let textData = 'Hello World!';
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                await systemPasteboard.setData(pasteData);
                let source = systemPasteboard.getDataSource();
                expect(source != null).assertTrue();
                systemPasteboard.clearDataSync();
                done();
            } catch (err: BusinessError) {
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err).assertEqual(null);
            }
            hilog.info(domain, tag, "----------SUB_PasteBoard_ETS_SystemPasteboard_Static_0370----------");
        })
    })
}