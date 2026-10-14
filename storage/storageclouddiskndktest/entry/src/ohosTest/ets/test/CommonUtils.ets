/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import picker from '@ohos.file.picker';
import fileShare from '@ohos.fileshare';
import { Driver, ON, Component } from '@ohos.UiTest';

export async function grantDocumentFolderAccess(done: Function): Promise<void> {
  try {
    console.info("====>CloudDiskPlaceholderTest beforeAll start====");
    let documentSelectOptions = new picker.DocumentSelectOptions();
    documentSelectOptions.selectMode = picker.DocumentSelectMode.FOLDER;
    documentSelectOptions.maxSelectNumber = 1;
    let documentPicker = new picker.DocumentViewPicker();
    console.info("====>beforeAll documentPicker.select start");
    let selectPromise = documentPicker.select(documentSelectOptions);
    let driver = await Driver.create();
    await driver.delayMs(3000);
    let inputComp: Component = await driver.findComponent(ON.text("文档"));
    if (inputComp == null || inputComp == undefined) {
      console.error("====>beforeAll input box not found, press back to cancel picker");
      await driver.pressBack();
      done();
      return;
    }
    await inputComp.click();
    inputComp = await driver.findComponent(ON.type("TextInput"));
    await inputComp.click();
    await inputComp.inputText("/storage/Users/currentUser/Documents/");
    console.info("====>beforeAll inputText success");
    await driver.delayMs(1000);
    let selectBtn: Component = await driver.findComponent(ON.text("选择"));
    if (selectBtn == null || selectBtn == undefined) {
      console.error("====>beforeAll select button not found, press back to cancel picker");
      await driver.pressBack();
      done();
      return;
    }
    await selectBtn.click();
    let selectResult = await selectPromise;
    console.info("====>beforeAll selectResult: " + JSON.stringify(selectResult));
    if (selectResult.length < 1) {
      done();
      return;
    }
    let policyInfo: fileShare.PolicyInfo = {
      uri: selectResult[0],
      operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
    };
    await fileShare.persistPermission([policyInfo]);
    console.info("====>beforeAll persistPermission success");
  } catch (err) {
    console.error("====>beforeAll catch err: " + err);
  }
  done();
}
