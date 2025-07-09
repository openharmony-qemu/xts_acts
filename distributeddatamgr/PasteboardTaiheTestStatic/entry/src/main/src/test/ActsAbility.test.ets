import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import pasteboard from '@ohos.pasteboard'
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';
import Want from '@ohos.app.ability.Want';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let num = pasteboard.Pattern.NUMBER;
let url = pasteboard.Pattern.URL;
const ARRAY_BUFFER = new ArrayBuffer(256)
const WANT: Want = {
    bundleName: "com.acts.distributeddatamgr.pasteboardtest",
    abilityName: "com.acts.distributeddatamgr.pasteboardtest.MainAbility"
};
let HTML = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" + "    <p></p>\n" + "</body>\n" + "</html>";
let URI = 'dataability:///com.example.myapplication1/user.txt';

/**
 *
 *  The callback function is used for pasteboard content changes
 */
function contentChanges() {
    hilog.info(domain, tag, '%{public}s', '#EVENT: The content is changed in the pasteboard')
}

export default function abilityTest() {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_Static_1400
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_Static_0100
         * @tc.desc Determine if there is data in the system pasteboard success, result is true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_Static_0100 start");
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try {
                systemPasteBoard.setData(pasteData, (err) => {
                    let hasData = await systemPasteBoard.hasData();
                    let data = systemPasteBoard.getDataSync();
                    expect(hasData).assertTrue();
                    done();
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + err);
                expect(false).assertTrue();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_Static_0100 end");
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_Static_1700
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_Static_0200
         * @tc.desc Determine if there is data in the system pasteboard success, result is true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_Static_0200 start")
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try {
                systemPasteBoard.clearData((err) => {
                    let hasData = await systemPasteBoard.hasData();
                    expect(hasData).assertFalse();
                    done();
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + err);
                expect(false).assertTrue();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTIONSUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_Static_0200_ETS_HASDATA_PROMISE_0200 end");
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0100
         * @tc.name SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0100
         * @tc.desc Test pasteBoard variety createData plaintext
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0100 start ************')
            let record: Record<string, pasteboard.ValueType> = {};
            record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataText = pasteData.getPrimaryText();
                hilog.info(domain, tag, '%{public}s', 'text:' + pasteDataText);
                expect(pasteDataText).assertEqual('hello');
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0100 end ************');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0101
         * @tc.name SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0101
         * @tc.desc Test pasteBoard variety createData plaintext
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0101 start ************')
            let record: Record<string, pasteboard.ValueType> = {};
            record[pasteboard.MIMETYPE_TEXT_PLAIN] = '';
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataText = pasteData.getPrimaryText();
                hilog.info(domain, tag, '%{public}s', 'text:' + pasteDataText);
                expect(pasteDataText).assertEqual('');
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0101 end ************');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0102
         * @tc.name SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0102
         * @tc.desc Test pasteBoard variety createData plaintext
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0102 start ************')
            let record: Record<string, pasteboard.ValueType> = {};
            record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'Hello 中国!@#$%^&*()_+{}\\?.';
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataText = pasteData.getPrimaryText();
                hilog.info(domain, tag, '%{public}s', 'text:' + pasteDataText);
                expect(pasteDataText).assertEqual('Hello 中国!@#$%^&*()_+{}\\?.');
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0102 end ************');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0103
         * @tc.name SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0103
         * @tc.desc Test pasteBoard variety createData plaintext
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0103 start ************')
            let record: Record<string, pasteboard.ValueType> = {};
            let textData = '';
            for (let i = 0; i < 301; i++) {
                textData = textData + "A";
            }
            record[pasteboard.MIMETYPE_TEXT_PLAIN] = textData;
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataText = pasteData.getPrimaryText();
                hilog.info(domain, tag, '%{public}s', 'text:' + pasteDataText);
                expect(pasteDataText).assertEqual(textData);
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_0103 end ************');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0400
         * @tc.name SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0400
         * @tc.desc Test pasteBoard variety createData Want
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0400 start ************')
            let record: Record<string, pasteboard.ValueType> = {};
            record['text/want'] = {
                bundleName: 'bundleName',
                abilityName: 'testAbilityName'
            } as Want;
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataWant = pasteData.getPrimaryWant();
                hilog.info(domain, tag, '%{public}s', 'want:' + JSON.stringify(pasteDataWant));
                expect(JSON.stringify(pasteDataWant)).assertContain('"bundleName":"bundleName","abilityName":"testAbilityName"');
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0400 end ************');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0600
         * @tc.name SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0600
         * @tc.desc Test pasteBoard variety createData Arraybuffer
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0600 start ************')
            let record: Record<string, pasteboard.ValueType> = {};
            record['app/xml'] = new ArrayBuffer(256);
            try {
                let pasteData:pasteboard.PasteData = pasteboard.createData(record);
                let pasteDataType = pasteData.getMimeTypes();
                hilog.info(domain, tag, '%{public}s', 'type:' + pasteDataType);
                expect(String(pasteDataType)).assertEqual('app/xml');
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0600 end ************');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_Static_0200
         * @tc.name SUB_pasteBoard_function_JS_API_Static_3900
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_3900 start')

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test39: systemPasteboard.clear promise');
                let textData = 'Hello World!';
                hilog.info(domain, tag, '%{public}s', 'f_test39: createPlainTextData textData = ' + textData);
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                hilog.info(domain, tag, '%{public}s', 'f_test39: createPlainTextData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test39: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test39: systemPasteboard.setData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test39: Checks there is content in the pasteboard');
                let data = await systemPasteboard.getData();
                expect(data.getRecordCount()).assertEqual(1);
                let pasteDataProperty = data.getProperty();
                hilog.info(domain, tag, '%{public}s', 'f_test39: timestamp = ' + pasteDataProperty.timestamp);
                pasteDataProperty.tag = "test_tag";
                pasteDataProperty.shareOption = pasteboard.ShareOption.LOCALDEVICE;
                data.setProperty(pasteDataProperty);
                hilog.info(domain, tag, '%{public}s', 'f_test39: Checks the Property');
                await systemPasteboard.setData(data);
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                data = await systemPasteboard.getData();
                pasteDataProperty = data.getProperty();
                expect(pasteDataProperty.shareOption == 1).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test39: timestamp = ' + pasteDataProperty.timestamp);
                hilog.info(domain, tag, '%{public}s', 'f_test39: shareOption = ' + pasteDataProperty.shareOption);
                let dataTag = data.getTag();
                expect(dataTag).assertEqual("test_tag");
                hilog.info(domain, tag, '%{public}s', 'f_test39: gettag = ' + dataTag);
                hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_3900 end');
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_Static_0700
         * @tc.name SUB_pasteBoard_function_JS_API_Static_0600
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_0600 start');

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test6: systemPasteboard.clear promise');
                let htmlText = '<html><head></head><body>Hello World!</body></html>';
                hilog.info(domain, tag, '%{public}s', 'f_test6: createHtmlData htmlText = ' + htmlText);
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
                hilog.info(domain, tag, '%{public}s', 'f_test6: createHtmlData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test6: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test6: systemPasteboard.setPasteData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test6: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test6: Checks the number of records');
                let data = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test6: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                expect(data.getRecordCount()).assertEqual(1);
                hilog.info(domain, tag, '%{public}s', 'f_test6: Checks the pasteboard content');
                let primaryHtml = data.getPrimaryHtml();
                hilog.info(domain, tag, '%{public}s', 'f_test6: getPrimaryHtml = ' + primaryHtml);
                expect(primaryHtml).assertEqual(htmlText);
                hilog.info(domain, tag, '%{public}s', 'Checks there is a MIMETYPE_TEXT_HTML MIME type of data' + pasteboard.MIMETYPE_TEXT_HTML);
                expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML)).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test6: getPrimaryMimeType = ' + data.getPrimaryMimeType());
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_0600 end');
        });

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_Static_0600
         * @tc.name SUB_pasteBoard_function_JS_API_Static_0700
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_0700 start');

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test7: systemPasteboard.clear promise');
                let htmlText = '';
                hilog.info(domain, tag, '%{public}s', 'f_test7: createHtmlData htmlText = ' + htmlText);
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
                hilog.info(domain, tag, '%{public}s', 'f_test7: createHtmlData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test7: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test7: systemPasteboard.setPasteData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test7: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test7: Checks the number of records');
                let data = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test7: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                expect(data.getRecordCount()).assertEqual(1);
                hilog.info(domain, tag, '%{public}s', 'f_test7: Checks the pasteboard content');
                let primaryHtml = data.getPrimaryHtml();
                hilog.info(domain, tag, '%{public}s', 'f_test7: getPrimaryHtml = ' + primaryHtml);
                expect(primaryHtml).assertEqual(htmlText);
                hilog.info(domain, tag, '%{public}s', 'Checks there is a MIMETYPE_TEXT_HTML MIME type of data' + pasteboard.MIMETYPE_TEXT_HTML);
                expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML)).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test7: getPrimaryMimeType = ' + data.getPrimaryMimeType());
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_0700 end');
        });

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_Static_1100
         * @tc.name SUB_pasteBoard_function_JS_API_Static_0800
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_0800 start');

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test8: systemPasteboard.clear promise');
                let htmlText = 'Hello 中国!@#$%^&*()_+{}\\?.';
                hilog.info(domain, tag, '%{public}s', 'f_test8: createHtmlData htmlText = ' + htmlText);
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
                hilog.info(domain, tag, '%{public}s', 'f_test8: createHtmlData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test8: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test8: systemPasteboard.setPasteData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test8: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test8: Checks the number of records');
                let data = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test8: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                expect(data.getRecordCount()).assertEqual(1);
                hilog.info(domain, tag, '%{public}s', 'f_test8: Checks the pasteboard content');
                let primaryHtml = data.getPrimaryHtml();
                hilog.info(domain, tag, '%{public}s', 'f_test8: getPrimaryHtml = ' + primaryHtml);
                expect(primaryHtml).assertEqual(htmlText);
                hilog.info(domain, tag, '%{public}s', 'Checks there is a MIMETYPE_TEXT_HTML MIME type of data' + pasteboard.MIMETYPE_TEXT_HTML);
                expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML)).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test8: getPrimaryMimeType = ' + data.getPrimaryMimeType());
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_0800 end');
        });

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_Static_0800
         * @tc.name SUB_pasteBoard_function_JS_API_Static_7000
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_7000 start')

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                let textData0 = 'Hello World0';
                hilog.info(domain, tag, '%{public}s', 'f_test70: createPlainTextData = ' + textData0);
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData0);
                hilog.info(domain, tag, '%{public}s', 'f_test70: createPlainTextData = ' + JSON.stringify(pasteData));
                let uriText = "https://www.baidu.com/";
                pasteData.addRecord(pasteboard.MIMETYPE_TEXT_URI, uriText);
                hilog.info(domain, tag, '%{public}s', 'f_test70: addRecord(uriText) = ' + JSON.stringify(pasteData));
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', '---------------------------->1');
                let data = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test70: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                let recordCount = data.getRecordCount();
                hilog.info(domain, tag, '%{public}s', 'f_test70: recordCount=' + recordCount);
                expect(data.getRecordCount()).assertEqual(2);
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_7000 end');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_Static_0900
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0100
         * @tc.desc Test pasteBoard create pixelMap record success
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0100 start");
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
                hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0100 end");
                await systemPasteboard.setData(pasteData);
                let hasDataType = systemPasteboard.hasDataType('pixelMap');
                expect(hasDataType).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_Static_2000
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0200
         * @tc.desc Test pasteBoard create want record success
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0200 start");
            let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
            let systemPasteboard = pasteboard.getSystemPasteboard();
            pasteData.addRecord('text/want', WANT);
            try {
                await systemPasteboard.setData(pasteData);
                let hasDataType = systemPasteboard.hasDataType('text/want');
                expect(hasDataType).assertTrue();
                done();
            }  catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0200 end");
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_Static_0100
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0300
         * @tc.desc Test pasteBoard create arrayBuffer record success
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0300 start")
            let pasteData = pasteboard.createData('text/want', WANT);
            let systemPasteboard = pasteboard.getSystemPasteboard();
            pasteData.addRecord("ArrayBuffer", ARRAY_BUFFER);
            try {
                await systemPasteboard.setData(pasteData);
                let hasType = systemPasteboard.hasDataType('ArrayBuffer');
                expect(hasType).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0300 end");
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_Static_1100
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0400
         * @tc.desc Test pasteBoard create string record success
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0400 start")
            let pasteData = pasteboard.createData("ArrayBuffer", ARRAY_BUFFER); // 修改string->ArrayBuffer
            let systemPasteboard = pasteboard.getSystemPasteboard();
            pasteData.addRecord(pasteboard.MIMETYPE_TEXT_PLAIN, "stringValueType");
            try {
                await systemPasteboard.setData(pasteData);
                let hasType = systemPasteboard.hasDataType('ArrayBuffer');
                expect(hasType).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0400 end");
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_Static_0700
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0500
         * @tc.desc Test pasteBoard create arrayBuffer record success with 1024 bit mimeType
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0500 start");
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            pasteData.addRecord("x".repeat(1024), ARRAY_BUFFER);
            try {
                await systemPasteboard.setData(pasteData);
                let hasType = systemPasteboard.hasDataType("x".repeat(1024));
                expect(hasType).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0500 end");
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_Static_1800
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0600
         * @tc.desc Test pasteBoard create string record success with 512000 bit valueType<string>
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0600 start")
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
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATERECORD_Static_0600 end");
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_Static_0400
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_0800
         * @tc.desc Test pasteBoard create string data fail with 1025 bit mimeType
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_0800 start")
            let mimeType = "x".repeat(1025)
            try {
                let pasteData = pasteboard.createData(mimeType, ARRAY_BUFFER)
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', "Create data error, err code is: " + err.code)
                expect(err.code).assertEqual(401)
            }
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_0800 end")
            done();
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_Static_0900
         * @tc.name SUB_pasteBoard_function_JS_API_Static_0900
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_0900 start');

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test9: systemPasteboard.clear promise');
                let uriText = 'https://www.baidu.com/';
                hilog.info(domain, tag, '%{public}s', 'f_test9: createUriData uriText = ' + uriText);
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
                hilog.info(domain, tag, '%{public}s', 'f_test9: createUriData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test9: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test9: systemPasteboard.setPasteData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test9: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                hilog.info(domain, tag, '%{public}s', 'f_test9: systemPasteboard.hasPasteData promise data = ' + hasData);
                expect(hasData === true).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test9: Checks the number of records');
                let data = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test9: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                let pasteData1 = data;
                expect(pasteData1.getRecordCount() == 1).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test9: Checks the pasteboard content');
                let primaryUri = pasteData1.getPrimaryUri();
                hilog.info(domain, tag, '%{public}s', 'f_test9: getPrimaryUri = ' + primaryUri);
                expect(primaryUri == uriText).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'Checks there is a MIMETYPE_TEXT_URI MIME type of data' + pasteboard.MIMETYPE_TEXT_URI);
                expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_URI)).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_0900 end');
        });

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_Static_0800
         * @tc.name SUB_pasteBoard_function_JS_API_Static_1000
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_1000 start');

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test10: systemPasteboard.clear promise');
                let uriText = '';
                hilog.info(domain, tag, '%{public}s', 'f_test10: createUriData uriText = ' + uriText);
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
                hilog.info(domain, tag, '%{public}s', 'f_test10: createUriData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test10: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test10: systemPasteboard.setPasteData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test10: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                hilog.info(domain, tag, '%{public}s', 'f_test10: systemPasteboard.hasPasteData promise data = ' + hasData);
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test10: Checks the number of records');
                let data = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test10: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                expect(data.getPrimaryUri() == uriText).assertTrue();
                expect(data.getRecordCount()).assertEqual(1);
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_1000 end');
        });

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_Static_1200
         * @tc.name SUB_pasteBoard_function_JS_API_Static_1100
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_1100 start');

            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test11: systemPasteboard.clear promise');
                let uriText = 'Hello//';
                hilog.info(domain, tag, '%{public}s', 'f_test11: createUriData uriText = ' + uriText);
                let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
                hilog.info(domain, tag, '%{public}s', 'f_test11: createUriData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test11: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test11: systemPasteboard.setPasteData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test11: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                hilog.info(domain, tag, '%{public}s', 'f_test11: systemPasteboard.hasPasteData promise data = ' + hasData);
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test11: Checks the number of records');
                let data = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test11: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                expect(data.getPrimaryUri() == uriText).assertTrue();
                expect(data.getRecordCount()).assertEqual(1);
                hilog.info(domain, tag, '%{public}s', 'Checks there is a MIMETYPE_TEXT_URI MIME type of data' + pasteboard.MIMETYPE_TEXT_URI);
                expect(systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_URI)).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + error);
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_1100 end');
        });

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_Static_1700
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_0700
         * @tc.desc Test pasteBoard create uri data success
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_0700 start")
            let uri = "www.baidu.com";
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uri);
            expect(pasteData.getRecord(0).uri).assertEqual(uri);
            expect(pasteData.getRecord(0).mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_URI);
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_0700 end");
            done();
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_Static_1900
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_0900
         * @tc.desc Test pasteBoard create uri data success
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_0900 start")
            let text = "hello";
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
            expect(pasteData.getRecord(0).plainText).assertEqual(text);
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_0900 end");
            done();
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataCreate_Static_2100
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_1000
         * @tc.desc Test pasteBoard create uri data success
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_1000 start")
            let text = "hello";
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
            expect(pasteData.getRecord(0).plainText).assertEqual(text);
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_CREATEDATA_Static_1000 end");
            done();
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_Static_3200
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_Static_0100
         * @tc.desc get the pastedata from system pasteBoard success
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_Static_0100 start")
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteBoard.setData(pasteData);
                systemPasteBoard.getData((err: BusinessError | null, data: pasteboard.PasteData | undefined) => {
                    if (err?.message) {
                        hilog.info(domain, tag, '%{public}s', "Get the pastedata from system pasteboard failed" + err)
                        expect(false).assertTrue();
                    } else {
                        let recordCount = data?.getRecordCount();
                        expect(recordCount).assertEqual(1);
                    }
                    done();
                })
            } catch(err) {
                hilog.info(domain, tag, '%{public}s', "System pasteBoard set pastedata error,error: " + err);
                expect(false).assertTrue();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_Static_0100 end")
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_Static_1600
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_Static_0200
         * @tc.desc Determine if there is data in the system pasteboard success, result is true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_Static_0200 start")
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clearData();
            systemPasteBoard.hasData((err: BusinessError | null, data) => {
                if (err?.message) {
                    hilog.info(domain, tag, '%{public}s', "Judge whether there is data in the system pasteBoard error,error is: " + err)
                    expect(false).assertTrue();
                } else {
                    expect(data == false).assertTrue();
                    hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_Static_0200 end")
                }
                done();
            })
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_Static_0900
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_TEST_Static_1100
         * @tc.desc Test pasteBoard SetProperty API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, 'application/xml');
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_TEST_Static_1100 start");
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clearData();
            let prop = pasteData.getProperty();
            prop.shareOption = pasteboard.ShareOption.INAPP;
            pasteData.setProperty(prop);
            let property = pasteData.getProperty();
            expect(property.shareOption == 0).assertTrue();
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_TEST_Static_1100 end");
            done();
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_Static_1000
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_TEST_Static_1200
         * @tc.desc Test pasteBoard SetProperty API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_TEST_Static_1200 start")
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clearData();
            let prop = pasteData.getProperty();
            prop.shareOption = pasteboard.ShareOption.LOCALDEVICE;
            pasteData.setProperty(prop);
            let property = pasteData.getProperty();
            expect(property.shareOption == 1).assertTrue();
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_TEST_Static_1200 end");
            done();
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataConvert_Static_0300
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0100
         * @tc.desc Successfully cast string record to text
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0100 start");
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "valueType");
            let record = pasteData.getRecord(0);
            let str = record.toPlainText();
            expect(str).assertEqual("valueType")
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0100 end")
            done();
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataConvert_Static_0200
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0200
         * @tc.desc Successfully cast pixelMap record to text
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0200 start");
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
            let record = pasteData.getRecord(0);
            let data = record.pixelMap;
            let str = record.toPlainText();
            expect(str).assertEqual("");
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0200 end")
            done();
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataConvert_Static_0500
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0300
         * @tc.desc Successfully cast want record to text
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0300 start")
            let pasteData = pasteboard.createData('text/want', WANT);
            let record = pasteData.getRecord(0);
            let str = record.toPlainText();
            expect(str).assertEqual("");
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0300 end")
            done();
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteDataConvert_Static_0100
         * @tc.name SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0400
         * @tc.desc Successfully cast arrayBuffer record to text
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0400 start")
            let pasteData = pasteboard.createData("ArrayBuffer", ARRAY_BUFFER);
            let record = pasteData.getRecord(0);
            let str = record.toPlainText();
            expect(str).assertEqual("")
            hilog.info(domain, tag, '%{public}s', "SUB_PASTEBOARD_FUNCTION_ETS_TOPLAINTEXT_Static_0400 end")
            done();
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0500
         * @tc.name SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0500
         * @tc.desc Test pasteBoard variety createData PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0500 start ************')
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
                hilog.info(domain, tag, '%{public}s', 'pixelmap:' + JSON.stringify(imageInfo))
                // expect(JSON.stringify(imageInfo)).assertEqual('{"size":{"width":5,"height":3},"density":0,"stride":20,"pixelFormat":{"value":3,"#ordinal":3},"alphaType":{"value":1,"#ordinal":1},"mimeType":"","isHdr":false}');
                done();
            } catch (error) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0500 end ************')
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0700
         * @tc.name SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0700
         * @tc.desc Test pasteBoard variety createData Variety and getData
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0700 start ************')
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
                hilog.info(domain, tag, '%{public}s', 'Success to get text/plain value.value is:' + textPlain);
                expect(textPlain).assertEqual('hello');
                value = await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_HTML);
                let htmlData = value as string;
                hilog.info(domain, tag, '%{public}s', 'Success to get htmlData value.value is:' + htmlData);
                expect(htmlData).assertEqual(HTML);
                value = await pasteDataRecord.getData(pasteboard.MIMETYPE_TEXT_URI);
                let uriData = value as string;
                hilog.info(domain, tag, '%{public}s', 'Success to get uriData value.value is:' + uriData);
                expect(uriData).assertEqual(URI);
                value = await pasteDataRecord.getData('text/want');
                let wantData = value as Want;
                hilog.info(domain, tag, '%{public}s', 'Success to get wantData value.value is:' + JSON.stringify(wantData));
                expect(JSON.stringify(wantData)).assertContain('"bundleName":"bundleName","abilityName":"testAbilityName"');
                value = await pasteDataRecord.getData('pixelMap');
                let pixelMap = value as image.PixelMap;
                let imageInfo = pixelMap.getImageInfoSync();
                hilog.info(domain, tag, '%{public}s', 'Success to get pixelMap value.value is:' + JSON.stringify(imageInfo));
                // expect(JSON.stringify(imageInfo)).assertEqual('{"pixelFormat":{"value":3,"#ordinal":3},"density":0,"size":{"width":5,"height":3},"stride":20,"mimeType":"","alphaType":{"value":1,"#ordinal":1},"isHdr":false} ');
                done();
            } catch (error) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_Local_SDK_PasteboardVariety_Static_0700 end ************')
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_Static_0100
         * @tc.name SUB_Pasteboard_Local_SDK_PasteboardSync_Static_0100
         * @tc.desc Test clearDataSync when systemPasteBoard has data
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it("SUB_Pasteboard_Local_SDK_PasteboardSync_Static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_Static_0100 ---------start")
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteBoard.setData(pasteData);
                expect(systemPasteBoard.hasDataSync()).assertEqual(true);
                hilog.info(domain, tag, '%{public}s', tag + "Succeeded in setting PasteData");
                systemPasteBoard.clearDataSync();
                let result = systemPasteBoard.hasDataSync();
                hilog.info(domain, tag, '%{public}s', tag + `Succeed in checking the PasteBoard. Result: ${result}`);
                expect(result).assertEqual(false);
                hilog.info(domain, tag, '%{public}s', tag + "Clear the data in the system PasteBoard finished");
                done();
            } catch (error) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_Static_0100 ---------end");
        })

        /**
         * @tc.number SUB_Pasteboard_hasDataSync_ErrTest_Static_0100
         * @tc.name SUB_Pasteboard_hasDataSync_ErrTest_Static_0100
         * @tc.desc Test pasteBoard hasDataSync
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_Pasteboard_hasDataSync_ErrTest_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_hasDataSync_ErrTest_Static_0100 start ************')
            let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            systemPasteboard.clearDataSync()
            try {
                expect(systemPasteboard.hasDataSync()).assertEqual(false);
                await systemPasteboard.setData(pasteData);
                let result: boolean = systemPasteboard.hasDataSync();
                hilog.info(domain, tag, '%{public}s', `Succeeded in checking the PasteData. Result: ${result}`);
                expect(result).assertEqual(true);
                done();
            } catch (err: BusinessError) {
                console.error(`Failed to hasDataSync. Cause: ${err.message + err.code}`);
                expect(err.code).assertEqual('12900005');
                done();
            };
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_hasDataSync_ErrTest_Static_0100 end ************')
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_Static_0700
         * @tc.name SUB_Pasteboard_Local_SDK_PasteboardSync_Static_0700
         * @tc.desc Test hasDataSync when systemPasteBoard is null
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it("SUB_Pasteboard_Local_SDK_PasteboardSync_Static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(domain, tag, '%{public}s', tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_Static_0700 ---------start")
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "");
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            systemPasteBoard.clearDataSync();
            let result = systemPasteBoard.hasDataSync();
            expect(result).assertEqual(false);
            hilog.info(domain, tag, '%{public}s', tag + `Succeed in checking the PasteBoard. Result: ${result}`);
            hilog.info(domain, tag, '%{public}s', tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_Static_0700 ---------end");
        })

        /**
         * @tc.number SUB_Pasteboard_clearDataSync_ErrTest_Static_0100
         * @tc.name SUB_Pasteboard_clearDataSync_ErrTest_Static_0100
         * @tc.desc Test pasteBoard clearDataSync
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_Pasteboard_clearDataSync_ErrTest_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_clearDataSync_ErrTest_Static_0100 start ************')
            let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            await systemPasteboard.setData(pasteData);
            expect(systemPasteboard.hasDataSync()).assertEqual(true);
            try {
                systemPasteboard.clearDataSync();
                expect(systemPasteboard.hasDataSync()).assertEqual(false);
                hilog.info(domain, tag, '%{public}s', 'Succeeded in clearing the pasteboard.');
                done();
            } catch (err: BusinessError) {
                console.error(`Failed to clearDataSync. Cause: ${err.message + err.code}`);
                expect(err.code).assertEqual('12900005');
                done();
            };
            hilog.info(domain, tag, '%{public}s', '************ SUB_Pasteboard_clearDataSync_ErrTest_Static_0100 end ************')
        })

        /**
         * @tc.name      : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0100
         * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0100
         * @tc.desc      : setData Verify the properties of the MIMETYPE_TEXT_PLAIN type
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0100 start-----")
            let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.setData(pasteData);
                expect(systemPasteboard.hasDataSync()).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'Succeeded in setting PasteData.');
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data[0]).assertEqual('text/plain');
                hilog.info(domain, tag, '%{public}s', 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0100 end-----")
        })

        /**
         * @tc.name      : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0200
         * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0200
         * @tc.desc      : setData Verify the properties of the MIMETYPE_TEXT_HTML type
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0200 start-----")
            let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, 'hello');
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.setData(pasteData);
                expect(systemPasteboard.hasDataSync()).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'Succeeded in setting PasteData.');
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data[0]).assertEqual('text/html');
                hilog.info(domain, tag, '%{public}s', 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0200 end-----")
        })

        /**
         * @tc.name      : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0300
         * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0300
         * @tc.desc      : setData Verify the properties of the MIMETYPE_TEXT_URI type
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0300 start-----")
            let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, 'hello');
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.setData(pasteData);
                expect(systemPasteboard.hasDataSync()).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'Succeeded in setting PasteData.');
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data[0]).assertEqual('text/html');
                hilog.info(domain, tag, '%{public}s', 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0300 end-----")
        })

        /**
         * @tc.name      : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0400
         * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0400
         * @tc.desc      : setData Verify the properties of the MIMETYPE_PIXELMAP type
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0400 start-----")
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
                hilog.info(domain, tag, '%{public}s', 'Succeeded in creating pixelmap.');
                let pasteData = pasteboard.createData('pixelMap', pixelMap);
                await systemPasteboard.setData(pasteData);
                expect(systemPasteboard.hasDataSync()).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'Succeeded in setting PasteData.');
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data[0]).assertEqual('pixelMap');
                hilog.info(domain, tag, '%{public}s', 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0400 end-----")
        })

        /**
         * @tc.name      : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0500
         * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0500
         * @tc.desc      : setData Verify the properties of the MIMETYPE_TEXT_WANT type
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0500 start-----")
            let pasteData: pasteboard.PasteData = pasteboard.createData('text/want', WANT);
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.setData(pasteData);
                expect(systemPasteboard.hasDataSync()).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'Succeeded in setting PasteData.');
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data[0]).assertEqual('text/want');
                hilog.info(domain, tag, '%{public}s', 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0500 end-----")
        })

        /**
         * @tc.name      : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0600
         * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0600
         * @tc.desc      : setData Verify the properties of the Customize type
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0600 start-----")
            let pasteData: pasteboard.PasteData = pasteboard.createData("hello/test", new ArrayBuffer(256));
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.setData(pasteData);
                expect(systemPasteboard.hasDataSync()).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'Succeeded in setting PasteData.');
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data[0]).assertEqual("hello/test");
                hilog.info(domain, tag, '%{public}s', 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_0600 end-----")
        })

        /**
         * @tc.name      : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_2200
         * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_2200
         * @tc.desc      : setUnifiedData Verify the properties of the appRecordData type
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_2200 start-----")
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                let data: Array<String> = await systemPasteboard.getMimeTypes();
                expect(data.length).assertEqual(0); // expect  equals undefined
                hilog.info(domain, tag, '%{public}s', 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_Static_2200 end-----")
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_Static_0900
         * @tc.name SUB_pasteBoard_function_JS_API_Static_4200
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4200 start');
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test42: systemPasteboard.clear promise');
                hilog.info(domain, tag, '%{public}s', 'f_test42: Open the info for pasteboard content changes');
                systemPasteboard.on('update', contentChanges);
                let textData = 'Hello World!';
                hilog.info(domain, tag, '%{public}s', 'f_test42: createData textData = ' + textData);
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                hilog.info(domain, tag, '%{public}s', 'f_test42: createData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test42: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test42: systemPasteboard.setData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test42: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test42: Checks the number of records');
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test42: systemPasteboard.getData data = ' + JSON.stringify(data));
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4200 end');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_Static_0600
         * @tc.name SUB_pasteBoard_function_JS_API_Static_4300
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4300 start');
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test43: systemPasteboard.clear promise');
                hilog.info(domain, tag, '%{public}s', 'f_test43: Open the info for pasteboard content changes');
                systemPasteboard.on('update', contentChanges);
                let htmlText = '<html><head></head><body>Hello World!</body></html>';
                hilog.info(domain, tag, '%{public}s', 'f_test43: createData htmlText = ' + htmlText);
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
                hilog.info(domain, tag, '%{public}s', 'f_test43: createData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test43: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test43: systemPasteboard.setData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test43: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test43: Checks the number of records');
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test43: systemPasteboard.getData data = ' + JSON.stringify(data));
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4300 end');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_Static_0700
         * @tc.name SUB_pasteBoard_function_JS_API_Static_4400
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4400 start');
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test44: systemPasteboard.clear promise');
                hilog.info(domain, tag, '%{public}s', 'f_test44: Open the info for pasteboard content changes');
                systemPasteboard.on('update', contentChanges);
                let uriText = 'https://www.baidu.com/';
                hilog.info(domain, tag, '%{public}s', 'f_test44: createData uriText = ' + uriText);
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
                hilog.info(domain, tag, '%{public}s', 'f_test44: createData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test44: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test44: systemPasteboard.setData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test44: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test44: Checks the number of records');
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test44: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4400 end');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_Static_0800
         * @tc.name SUB_pasteBoard_function_JS_API_Static_4500
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4500 start');
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test45: systemPasteboard.clear promise');
                hilog.info(domain, tag, '%{public}s', 'f_test45: Open the info for pasteboard content changes');
                systemPasteboard.on('update', contentChanges);
                let record: Record<string, pasteboard.ValueType> = {};
                let want = {
                    bundleName: "com.example.myapplication45",
                    abilityName: "com.example.myapplication45.MainAbility"
                } as Want;
                record['text/want'] = want;
                hilog.info(domain, tag, '%{public}s', 'f_test45: createData want = ' + JSON.stringify(want));
                let pasteData: pasteboard.PasteData = pasteboard.createData(record);
                hilog.info(domain, tag, '%{public}s', 'f_test42: createData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test45: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test45: systemPasteboard.setData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test45: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test45: Checks the number of records');
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test45: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4500 end');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_Static_1000
         * @tc.name SUB_pasteBoard_function_JS_API_Static_4600
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4600 start');
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test46: systemPasteboard.clear promise');
                hilog.info(domain, tag, '%{public}s', 'f_test46: Open the  for pasteboard content changes');
                systemPasteboard.on('update', contentChanges);
                let textData = 'Hello World!';
                hilog.info(domain, tag, '%{public}s', 'f_test46: createData textData = ' + textData);
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                hilog.info(domain, tag, '%{public}s', 'f_test46: createData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test46: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test46: systemPasteboard.setData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test46: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test46: Checks the number of records');
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test46: systemPasteboard.getData data = ' + JSON.stringify(data));
                expect(data.getRecordCount() == 1).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test46: Clears the pasteBoard');
                systemPasteboard.clearDataSync();
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4600 end');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_Static_0400
         * @tc.name SUB_pasteBoard_function_JS_API_Static_4700
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4700 start');
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test47: systemPasteboard.clear promise');
                hilog.info(domain, tag, '%{public}s', 'f_test47: Close the info for pasteboard content changes');
                systemPasteboard.off('update', contentChanges)
                let textData = 'Hello World!';
                hilog.info(domain, tag, '%{public}s', 'f_test47: createData textData = ' + textData);
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                hilog.info(domain, tag, '%{public}s', 'f_test47: createData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test47: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test47: systemPasteboard.setData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test47: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test47: Checks the number of records');
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test47: systemPasteboard.getData data = ' + JSON.stringify(data));
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4700 end');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_Static_0100
         * @tc.name SUB_pasteBoard_function_JS_API_Static_4800
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4800 start');
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test48: systemPasteboard.clear promise');
                hilog.info(domain, tag, '%{public}s', 'f_test48: Close the info for pasteboard content changes');
                systemPasteboard.off('update', contentChanges);
                let htmlText = '<html><head></head><body>Hello World!</body></html>';
                hilog.info(domain, tag, '%{public}s', 'f_test48: createData htmlText = ' + htmlText);
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, htmlText);
                hilog.info(domain, tag, '%{public}s', 'f_test48: createData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test48: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test48: systemPasteboard.setPasteData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test48: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test48: Checks the number of records');
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test48: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4800 end');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_Static_0200
         * @tc.name SUB_pasteBoard_function_JS_API_Static_4900
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4900 start');
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test49: systemPasteboard.clear promise');
                hilog.info(domain, tag, '%{public}s', 'f_test49: Close the info for pasteboard content changes');
                systemPasteboard.off('update', contentChanges);
                let uriText = 'https://www.baidu.com/';
                hilog.info(domain, tag, '%{public}s', 'f_test49: createData uriText = ' + uriText);
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uriText);
                hilog.info(domain, tag, '%{public}s', 'f_test49: createData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test49: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test49: systemPasteboard.setData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test49: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test49: Checks the number of records');
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test49: systemPasteboard.getData data = ' + JSON.stringify(data));
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_4900 end');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_Static_0300
         * @tc.name SUB_pasteBoard_function_JS_API_Static_5000
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_5000 start');
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test50: systemPasteboard.clear promise');
                hilog.info(domain, tag, '%{public}s', 'f_test50: Open the info for pasteboard content changes');
                systemPasteboard.off('update', contentChanges)
                let record: Record<string, pasteboard.ValueType> = {};
                let want = {
                    bundleName: "com.example.myapplication45",
                    abilityName: "com.example.myapplication45.MainAbility"
                } as Want;
                record['text/want'] = want;
                hilog.info(domain, tag, '%{public}s', 'f_test45: createData want = ' + JSON.stringify(want));
                let pasteData: pasteboard.PasteData = pasteboard.createData(record);
                hilog.info(domain, tag, '%{public}s', 'f_test50: createData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test50: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test50: systemPasteboard.setData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test50: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test50: Checks the number of records');
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test50: systemPasteboard.getData data = ' + JSON.stringify(data));
                expect(data.getRecordCount() == 1).assertTrue();
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_5000 end');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_Static_0500
         * @tc.name SUB_pasteBoard_function_JS_API_Static_5100
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_function_JS_API_Static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_5100 start');
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test51: systemPasteboard.clear promise');
                hilog.info(domain, tag, '%{public}s', 'f_test51: Close the info for pasteboard content changes');
                systemPasteboard.off('update', contentChanges);
                let textData = 'Hello World!';
                hilog.info(domain, tag, '%{public}s', 'f_test51: createData textData = ' + textData);
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                hilog.info(domain, tag, '%{public}s', 'f_test51: createData pasteData = ' + JSON.stringify(pasteData));
                hilog.info(domain, tag, '%{public}s', 'f_test51: Writes PasteData to the pasteboard');
                await systemPasteboard.setData(pasteData);
                hilog.info(domain, tag, '%{public}s', 'f_test51: systemPasteboard.setData promise');
                hilog.info(domain, tag, '%{public}s', 'f_test51: Checks there is content in the pasteboard');
                let hasData = await systemPasteboard.hasData();
                expect(hasData).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test51: Checks the number of records');
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                hilog.info(domain, tag, '%{public}s', 'f_test51: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                expect(data.getRecordCount() == 1).assertTrue();
                hilog.info(domain, tag, '%{public}s', 'f_test51: Clears the pasteBoard');
                systemPasteboard.clearDataSync();
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_function_JS_API_Static_5100 end');
        })

        /**
         * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_GetDataSource_Static_0100
         * @tc.name SUB_pasteBoard_GETDATASOURCE_Static_100
         * @tc.desc Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_pasteBoard_GETDATASOURCE_Static_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_GETDATASOURCE_Static_100 start');
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteboard.clearData();
                hilog.info(domain, tag, '%{public}s', 'f_test51: systemPasteboard.clear promise');
                let textData = 'Hello World!';
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                await systemPasteboard.setData(pasteData);
                let source = systemPasteboard.getDataSource();
                hilog.info(domain, tag, '%{public}s', "bundle name=" + source);
                expect(source != null).assertTrue();
                systemPasteboard.clearDataSync();
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', 'SUB_pasteBoard_GETDATASOURCE_Static_100 end');
        })

    })

}