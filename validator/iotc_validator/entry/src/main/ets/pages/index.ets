/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import fs from '@ohos.file.fs';
import xml from '@ohos.xml';
import util from '@ohos.util';
import DateTimeUtil from './model/DateTimeUtil';
import data_preferences from '@ohos.data.preferences';
import FlushData from '../pages/model/FlushData';
import common from '@ohos.app.ability.common';
import { PageCase } from './IOT/model/IotConstants';

const TAG = 'ParseXML';
let path: string = globalThis.dir;
let iotPath = path + '/IOT';
let iotColorBackPath = path + '/IOTColorBack.txt'; // IOT
fs.openSync(iotColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
let timePath = path + '/Time.txt';
fs.openSync(timePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
let xmlPath = path + '/Test.xml';
fs.openSync(xmlPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
let iotReportPath = iotPath + '/IOTReport.txt';
let configXmlPath = iotPath + '/IOTConfigTest.xml';

@Entry
@Component
struct IndexPage {
  private testCaseList: PageCase[] = [
    // { title: 'IOT', uri: 'pages/IOT/IOT_index' },
    { title: 'IOT_CONFIGURATION', uri: 'pages/IOT/IOT_configuration' }
  ];
  @State colorObject: string[] = ['#ff000000', '#ff000000', '#ff000000', '#ff000000', '#ff000000']

  async onPageShow() {
    let preferences = await data_preferences.getPreferences(getContext(this) as common.UIAbilityContext, 'mystore');
    let indexTest = await preferences.get('index', 0);
    console.info(`Succeeded in getting value of 'index'. Data: ${indexTest}`);
    if (indexTest != 1) {
      fs.mkdirSync(iotPath);
      await preferences.put('index', 1).then(() => {
        console.info('Succeeded in putting value of index.');
      });
      await preferences.flush().then(() => {
        console.info('Succeeded in flushing.');
      });
    }
    fs.openSync(iotReportPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  }

  build() {
    Column() {
      Row() {
        Text('ActsValidatorIOT')
          .fontColor(Color.White)
          .fontSize('22fp')
        Row() {
          Button() {
            Image($r('app.media.ic_public_delete'))
              .width('30vp')
              .height('30vp')
          }.backgroundColor(Color.Black)
          .onClick(() => {
            AlertDialog.show(
              {
                message: '是否删除所有记录',
                primaryButton: {
                  value: 'Yes',
                  action: () => {
                    this.clearText();
                    promptAction.showToast({
                      message: '结果已删除', duration: 1000
                    });
                  }
                },
                secondaryButton: {
                  value: 'No',
                  action: () => {

                  }
                },
                cancel: () => {

                }
              }
            )
          })

          Button() {
            Image($r('app.media.ic_public_save'))
              .width('30vp')
              .height('30vp')
              .margin({ left: 30 })
          }.backgroundColor(Color.Black)
          .onClick(() => {
            this.saveXml();
            AlertDialog.show({
              message: '报告已生成，请将设备连接pc，通过run.bat确认测试已结束，获取可视化报告',
              confirm: {
                value: 'OK',
                action: () => {
                  promptAction.showToast({
                    message: '总报告已生成', duration: 1000
                  })
                }
              },
              cancel: () => {
                promptAction.showToast({
                  message: '总报告已生成', duration: 1000
                });
              }
            })
          })
        }
      }.width('100%').justifyContent(FlexAlign.SpaceAround).margin({ top: '15vp' }).height('6%')

      List({}) {
        ForEach(this.testCaseList, (item: PageCase, index: number) => {
          ListItem() {
            Row() {
              Text(item.title).fontSize(20).fontColor(Color.White)
            }
            .width('100%')
            .height(50)
            .alignItems(VerticalAlign.Center)
            .backgroundColor(this.colorObject[index])
            .onClick(() => {
              router.pushUrl({
                url: item.uri,
              })
              let dateTimeUtil = new DateTimeUtil();
              let time =
                `${dateTimeUtil.getFullYear()}-${dateTimeUtil.getMonth()}-${dateTimeUtil.getDay()} ${dateTimeUtil.getHour()}:${dateTimeUtil.getMinute()}:${dateTimeUtil.getSecond()}`;
              let timePath = path + '/Time.txt';
              let fileOp = fs.openSync(timePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
              let buf = new ArrayBuffer(4096);
              fs.readSync(fileOp.fd, buf);
              let logStr = `${time};`;
              fs.writeSync(fileOp.fd, logStr);
            })
          }
        }, (item: PageCase) => item.title)
      }.width('100%').height('92%').divider({ strokeWidth: 1, color: Color.Grey })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }

  clearText() {
    fs.unlinkSync(timePath);
    fs.unlinkSync(xmlPath);
    fs.unlinkSync(iotColorBackPath);
    try {
      fs.unlinkSync(configXmlPath);
    } catch (e) {
      console.error(`index clearText error: ${JSON.stringify(e)}`)
    }
    fs.openSync(timePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(xmlPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(iotReportPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(iotColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    FlushData.resetIOT(getContext(this) as common.UIAbilityContext);
  }

  saveXml() {
    let dateTimeUtil = new DateTimeUtil();
    let endtime =
      `${dateTimeUtil.getFullYear()}-${dateTimeUtil.getMonth()}-${dateTimeUtil.getDay()} ${dateTimeUtil.getHour()}:${dateTimeUtil.getMinute()}:${dateTimeUtil.getSecond()}`;
    let fd = fs.openSync(timePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf = new ArrayBuffer(40960);
    fs.readSync(fd.fd, buf)
    let startTimeBuff = String.fromCharCode(...new Uint8Array(buf));
    let buffIndex = startTimeBuff.indexOf(';');
    let starttime = startTimeBuff.substring(0, buffIndex);
    if (starttime === '') {
      starttime = '*'
    }

    let iotReport: string; // IOT

    /**
     * IOT
     */
    let file15 = fs.openSync(iotReportPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf15 = new ArrayBuffer(40960);
    fs.readSync(file15.fd, buf15);
    iotReport = String.fromCharCode(...new Uint8Array(buf15));
    let str15 = iotReport.split(';');
    let title15: string[] = [];
    let result15: string[] = [];
    for (let i = 0; i < Math.floor(str15.length / 2); i++) {
      title15[i] = str15[i * 2];
      result15[i] = str15[i * 2 + 1];
    }

    let report = iotReport;
    let failIndex = report.indexOf('false');
    let failNum = 0;
    while (failIndex != -1) {
      failNum++;
      failIndex = report.indexOf('false', failIndex + 1);
    }
    let passIndex = report.indexOf('true ');
    let passNum = 0;
    while (passIndex != -1) {
      passNum++;
      passIndex = report.indexOf('true ', passIndex + 1);
    }
    let testNum = failNum + passNum;
    console.log(`testNum ${testNum}`);

    /**
     * IOT
     */
    let iotFailIndex = iotReport.indexOf('false');
    let iotFailNum = 0;
    while (iotFailIndex != -1) {
      iotFailNum++;
      iotFailIndex = iotReport.indexOf('false', iotFailIndex + 1);
    }
    let iotPassIndex = iotReport.indexOf('true ');
    let iotPassNum = 0;
    while (iotPassIndex != -1) {
      iotPassNum++;
      iotPassIndex = iotReport.indexOf('true ', iotPassIndex + 1);
    }
    let iotTestNum = iotFailNum + iotPassNum;
    console.log(`iotTestNum ${iotTestNum}`);
    /**
     * 报告BUFF
     */
    let arrayBuffer = new ArrayBuffer(40960);
    let bufView = new DataView(arrayBuffer);
    let serializer = new xml.XmlSerializer(bufView);
    serializer.setDeclaration();
    serializer.startElement('testsuites');
    serializer.setAttributes('name', 'ActsValidatorIOT');
    serializer.setAttributes('starttime', starttime);
    serializer.setAttributes('endtime', endtime);
    serializer.setAttributes('errors', '0');
    serializer.setAttributes('disabled', '0');
    serializer.setAttributes('failures', String(failNum));
    serializer.setAttributes('tests', String(testNum));
    serializer.setAttributes('ignored', '0');
    serializer.setAttributes('unavailable', '0');
    serializer.setAttributes('productinfo', '{ }');
    serializer.setAttributes('modules', 'ActsValidatorIOT');
    serializer.setAttributes('runmodules', 'ActsValidatorIOT');

    /**
     * IOT
     */
    serializer.startElement('testsuite');
    serializer.setAttributes('name', 'ActsIOTTest');
    serializer.setAttributes('time', '*');
    serializer.setAttributes('errors', '0');
    serializer.setAttributes('disabled', '0');
    serializer.setAttributes('failures', String(iotFailNum));
    serializer.setAttributes('ignored', '0');
    serializer.setAttributes('tests', String(iotTestNum));
    serializer.setAttributes('message', '*');
    serializer.setAttributes('modulename', 'ActsValidatorIOT');
    for (let i = 0; i < title15.length; i++) {
      serializer.startElement('testcase');
      serializer.setAttributes('name', String(title15[i]));
      serializer.setAttributes('status', 'run');
      serializer.setAttributes('time', '*');
      serializer.setAttributes('classname', 'ActsIOTTest');
      serializer.setAttributes('result', String(result15[i]));
      serializer.setAttributes('level', '*');
      serializer.setAttributes('message', '*');
      serializer.endElement();
    }
    serializer.endElement();

    serializer.endElement();

    let that = new util.TextDecoder('utf-8');
    let array = new Uint8Array(arrayBuffer);
    let endPos = array.length;
    for (let i = 0; i < array.length; i++) {
      if (array[i] === 0) {
        endPos = i;
        break;
      }
    }
    let serializerStr = that.decode(array.slice(0, endPos));
    let xmlfd: fs.File | null = null;
    try {
      console.info(TAG, `write xmlPath = ${xmlPath}`);
      xmlfd = fs.openSync(xmlPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.writeSync(xmlfd.fd, serializerStr);
    } catch (err) {
      console.error(TAG, `read xmlPath = ${xmlPath},error =${err.message}`);
    } finally {
      fs.closeSync(xmlfd);
    }
  }
}
