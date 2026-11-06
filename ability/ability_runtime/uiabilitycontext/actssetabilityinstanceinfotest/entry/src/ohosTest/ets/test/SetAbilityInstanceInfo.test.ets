/*
 * Copyright (C) 2024-2025 HiHope Open Source Organization.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { JSON } from '@kit.ArkTS';
import { image } from '@kit.ImageKit';
import { BusinessError, commonEventManager, deviceInfo } from '@kit.BasicServicesKit';
import { Driver, ON } from '@ohos.UiTest';

let testContext: common.UIAbilityContext;
const DOMAIN = 0x0000;
const LOG_TAG = 'SET_ABILITY_INSTANCE_INFO_TEST';

let color: ArrayBuffer = new ArrayBuffer(512 * 512 * 4);
let bufferArr = new Uint8Array(color);
for (let i = 0; i < bufferArr.length; i += 4) {
  bufferArr[i] = 255;
  bufferArr[i + 1] = 0;
  bufferArr[i + 2] = 122;
  bufferArr[i + 3] = 255;
}
let opts: image.InitializationOptions = {editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {height: 512, width: 512}};
let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

const sleep = (mills: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, mills));
}

function isPc2in1(): boolean {
  return deviceInfo.deviceType === '2in1';
}

function getBizCode(err: Object): number {
  return (err as BusinessError).code;
}

function createOnceDone(done: Function): (pass: boolean) => void {
  let finished = false;
  return (pass: boolean): void => {
    if (finished) {
      return;
    }
    finished = true;
    if (!pass) {
      expect().assertFail();
    }
    done();
  };
}

async function expectThreeArgReject(
  tag: string,
  action: () => Promise<void>,
  expectCode: number,
  done: Function
): Promise<void> {
  if (!isPc2in1()) {
    done();
    return;
  }
  try {
    await action();
    hilog.info(DOMAIN, LOG_TAG, tag + ' unexpected success');
    expect().assertFail();
  } catch (err) {
    hilog.info(DOMAIN, LOG_TAG, tag + ' err=' + JSON.stringify(err));
    expect(getBizCode(err)).assertEqual(expectCode);
    hilog.info(DOMAIN, LOG_TAG, tag + ' success');
  }
  done();
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      try {
        const ability = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility()
        testContext = ability.context;
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "get context failed: " + JSON.stringify(err))
        try { expect().assertFail(); } catch (err) {}
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0200
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0200
     * @tc.desc   Expect: call success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0200';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let subscriber = commonEventManager.createSubscriberSync({
        events: ['setAbilityInstanceInfo_success', 'setAbilityInstanceInfo_fail']
      });
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'setAbilityInstanceInfo_success') {
          commonEventManager.unsubscribe(subscriber,()=>{
            hilog.info(DOMAIN, LOG_TAG, tag + " success");
            expect(data.event).assertEqual('setAbilityInstanceInfo_success');
            done();
          });
        } else {
          commonEventManager.unsubscribe(subscriber,()=>{
            hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
            hilog.info(DOMAIN, LOG_TAG, tag + " fail");
            expect().assertFail();
            done();
          });
        }
      });
      testContext.startAbility({
        bundleName: 'com.acts.ability.setabilityinstanceinfo',
        abilityName: 'EntryAbility'
      }).then(()=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility success");
      }).catch(async(err:BusinessError)=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility fail " + err?.code);
        expect().assertFail();
        commonEventManager.unsubscribe(subscriber,()=>{
          done();
        });
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0300
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0300
     * @tc.desc   Expect: call success 10 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0300', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0300';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let successCount = 0;
      for (let i = 0; i < 10; i++) {
        try {
          await testContext.setAbilityInstanceInfo('111111' + i, pixelMap);
          successCount++;
        } catch (err) {
          hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        }
      }
      expect(successCount === 10).assertTrue();
      if (successCount === 10) {
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
      } else {
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0400
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0400
     * @tc.desc   Expect: success in both abilities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0400', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0400';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let count = 0;
      let subscriber = commonEventManager.createSubscriberSync({
        events: ['setAbilityInstanceInfo_success', 'setAbilityInstanceInfo_fail']
      });
      const expectBothDone = 2;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'setAbilityInstanceInfo_success') {
          count++;
          if (count === expectBothDone) {
            hilog.info(DOMAIN, LOG_TAG, tag + " success");
            expect(count).assertEqual(expectBothDone);
            commonEventManager.unsubscribe(subscriber,()=>{
              done();
            });
          }
        } else {
          commonEventManager.unsubscribe(subscriber,()=>{
            hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
            hilog.info(DOMAIN, LOG_TAG, tag + " fail");
            expect().assertFail();
            done();
          });
        }
      });
      testContext.startAbility({
        bundleName: 'com.acts.ability.setabilityinstanceinfo',
        abilityName: 'EntryAbility'
      }).then(()=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility success");
      }).catch(async(err:BusinessError)=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility fail " + err?.code);
        expect().assertFail();
        commonEventManager.unsubscribe(subscriber,()=>{
          done();
        });
      })
      try {
        await testContext.setAbilityInstanceInfo('111111', pixelMap);
        count++;
        if (count === expectBothDone) {
          hilog.info(DOMAIN, LOG_TAG, tag + " success");
          expect(count).assertEqual(expectBothDone);
          done();
        }
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0600
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0600
     * @tc.desc   Expect: success in both instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0600', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0600';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }

      let count = 0;

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['setAbilityInstanceInfo_success', 'setAbilityInstanceInfo_fail']
      });
      commonEventManager.subscribe(subscriber, (err, data) => {
        hilog.info(DOMAIN, LOG_TAG, tag + " event:" + JSON.stringify(data));
        if (data?.event === 'setAbilityInstanceInfo_success') {
          count++;
          if (count === 2) {
            commonEventManager.unsubscribe(subscriber,()=>{
              hilog.info(DOMAIN, LOG_TAG, tag + " success");
              done();
            });
          }
        } else {
          hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
          commonEventManager.unsubscribe(subscriber,()=>{
            hilog.info(DOMAIN, LOG_TAG, tag + " fail");
            try { expect().assertFail(); } catch (err) {}
            done();
          });
        }
      });

      await testContext.startAbility({
        bundleName: 'com.acts.ability.setabilityinstanceinfo',
        abilityName: 'SecondAbility',
        parameters: {
          flag: '1'
        }
      }).then(()=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility success");
      }).catch(async(err:BusinessError)=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility fail " + err?.code);
        try { expect().assertFail(); } catch (err) {}
        commonEventManager.unsubscribe(subscriber,()=>{
          done();
        });
      })
      await testContext.startAbility({
        bundleName: 'com.acts.ability.setabilityinstanceinfo',
        abilityName: 'SecondAbility',
        parameters: {
          flag: '2'
        }
      }).then(()=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility success");
      }).catch(async(err:BusinessError)=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility fail " + err?.code);
        try { expect().assertFail(); } catch (err) {}
        commonEventManager.unsubscribe(subscriber,()=>{
          done();
        });
      })

    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0800
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0800
     * @tc.desc   Expect: success for 2in1 device, others failed with code 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0800', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0800';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      hilog.info(DOMAIN, LOG_TAG, tag + " " + deviceInfo.deviceType);
      try {
        await testContext.setAbilityInstanceInfo('111111', pixelMap);
        if (deviceInfo.deviceType === '2in1') {
          hilog.info(DOMAIN, LOG_TAG, tag + " success");
          done();
        } else {
          hilog.info(DOMAIN, LOG_TAG, tag + " fail");
          try { expect().assertFail(); } catch (err) {}
          done();
        }
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        if (deviceInfo.deviceType === '2in1') {
          hilog.info(DOMAIN, LOG_TAG, tag + " fail");
          try { expect().assertFail(); } catch (err) {}
          done();
        } else if (err?.code === 801) {
          hilog.info(DOMAIN, LOG_TAG, tag + " success");
          done();
        } else {
          hilog.info(DOMAIN, LOG_TAG, tag + " unexpected code");
          try { expect().assertFail(); } catch (err) {}
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1000
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1000
     * @tc.desc   Expect: permission denied without ohos.permission.SET_ABILITY_INSTANCE_INFO, code 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1000', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1000';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let subscriber = commonEventManager.createSubscriberSync({
        events: ['setAbilityInstanceInfo_success', 'setAbilityInstanceInfo_fail']
      });
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'setAbilityInstanceInfo_fail') {
          commonEventManager.unsubscribe(subscriber,()=>{
            expect(data?.code).assertEqual(201);
            hilog.info(DOMAIN, LOG_TAG, tag + " success");
            done();
          });
        } else {
          commonEventManager.unsubscribe(subscriber,()=>{
            hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
            hilog.info(DOMAIN, LOG_TAG, tag + " fail");
            try { expect().assertFail(); } catch (err) {}
            done();
          });
        }
      });
      testContext.startAbility({
        bundleName: 'com.acts.ability.setabilityinstanceinfo.demo2',
        abilityName: 'EntryAbility'
      }).then(()=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility success");
      }).catch(async(err:BusinessError)=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility fail " + err?.code);
        try { expect().assertFail(); } catch (err) {}
        commonEventManager.unsubscribe(subscriber,()=>{
          done();
        });
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1100
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1100', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1100';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('', pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1200
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1200
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1200';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo(null, pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1300
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1300
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1300', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1300';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo(undefined, pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1400
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1400
     * @tc.desc   Expect: call success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1400', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1400';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('#￥😂😋', pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1500
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1500
     * @tc.desc   Expect: call success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1500', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1500';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('啥万一', pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1600
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1600
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1600', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1600';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let label = '';
      for (let i = 0; i < 64; i++) {
        label += '0123456789abcdef';
      }
      label += 'g';
      try {
        await testContext.setAbilityInstanceInfo(label, pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1700
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1700
     * @tc.desc   Expect: call success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1700', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1700';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let label = '';
      for (let i = 0; i < 64; i++) {
        label += '0123456789abcdef';
      }
      try {
        await testContext.setAbilityInstanceInfo(label, pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1800
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1800
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1800', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1800';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let emptyColor = new ArrayBuffer(0);
      let emptyImg = image.createPixelMapSync(emptyColor, {size: {width: 0, height: 0}});
      try {
        await testContext.setAbilityInstanceInfo('111111', emptyImg);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2000
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2000
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2000', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2000';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('111111', null);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2100
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2100', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2100';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('111111', undefined);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2200
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2200
     * @tc.desc   Expect: success 2000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2200';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let successCount = 0;
      for (let i = 0; i < 2000; i++) {
        try {
          await testContext.setAbilityInstanceInfo('111111' + i, pixelMap);
          successCount++;
        } catch (err) {
          hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        }
      }
      if (successCount === 2000) {
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      } else {
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2300
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2300
     * @tc.desc   Expect: groupId overload success on 2in1, others failed with code 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2300', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2300';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      hilog.info(DOMAIN, LOG_TAG, tag + " " + deviceInfo.deviceType);
      try {
        await testContext.setAbilityInstanceInfo('label_group', pixelMap, 'group_a');
        if (deviceInfo.deviceType === '2in1') {
          hilog.info(DOMAIN, LOG_TAG, tag + " success");
          done();
        } else {
          hilog.info(DOMAIN, LOG_TAG, tag + " fail");
          try { expect().assertFail(); } catch (err) {}
          done();
        }
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        if (deviceInfo.deviceType === '2in1') {
          hilog.info(DOMAIN, LOG_TAG, tag + " fail");
          try { expect().assertFail(); } catch (err) {}
          done();
        } else if (err?.code === 801) {
          hilog.info(DOMAIN, LOG_TAG, tag + " success");
          done();
        } else {
          hilog.info(DOMAIN, LOG_TAG, tag + " fail unexpected code");
          try { expect().assertFail(); } catch (err) {}
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2400
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2400
     * @tc.desc   Expect: groupId length 64 call success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2400', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2400';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let groupId = '';
      for (let i = 0; i < 4; i++) {
        groupId += '0123456789abcdef';
      }
      try {
        await testContext.setAbilityInstanceInfo('label_group64', pixelMap, groupId);
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2500
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2500
     * @tc.desc   Expect: groupId length over 64 failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2500', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2500';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let groupId = '';
      for (let i = 0; i < 4; i++) {
        groupId += '0123456789abcdef';
      }
      groupId += 'g';
      try {
        await testContext.setAbilityInstanceInfo('label_group65', pixelMap, groupId);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2600
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2600
     * @tc.desc   Expect: empty groupId call success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2600', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2600';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('label_empty_group', pixelMap, '');
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2700
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2700
     * @tc.desc   Expect: same groupId set repeatedly call success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2700', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2700';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let successCount = 0;
      for (let i = 0; i < 5; i++) {
        try {
          await testContext.setAbilityInstanceInfo('label_repeat' + i, pixelMap, 'shared_group');
          successCount++;
        } catch (err) {
          hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        }
      }
      if (successCount === 5) {
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      } else {
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2800
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2800
     * @tc.desc   Expect: groupId null failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2800', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2800';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('label_group_null', pixelMap, null);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2900
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2900
     * @tc.desc   Expect: groupId undefined failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2900', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2900';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('label_group_undefined', pixelMap, undefined);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3000
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3000
     * @tc.desc   Expect: invalid context failed with code 16000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3000', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3000';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let fakeContext = { stageMode: true } as common.UIAbilityContext;
      try {
        await fakeContext.setAbilityInstanceInfo('label_ctx', pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        let bizError = err as BusinessError;
        expect(bizError.code === 16000011 || bizError.code === 401).assertTrue();
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3100
     * @tc.desc   Expect: label over 1024 bytes failed with code 401 (param spec)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3100', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3100';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let label = '';
      for (let i = 0; i < 65; i++) {
        label += '0123456789abcdef';
      }
      try {
        await testContext.setAbilityInstanceInfo(label, pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3200
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3200
     * @tc.desc   Expect: 3-arg permission denied without SET_ABILITY_INSTANCE_INFO, code 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3200', Level.LEVEL0, async (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3200';
      hilog.info(DOMAIN, LOG_TAG, tag + ' it begin');
      if (!isPc2in1()) {
        done();
        return;
      }
      const finish = createOnceDone(done);
      const subscriber = commonEventManager.createSubscriberSync({
        events: ['setAbilityInstanceInfo_success', 'setAbilityInstanceInfo_fail']
      });
      commonEventManager.subscribe(subscriber, (_err, data) => {
        commonEventManager.unsubscribe(subscriber, () => {
          hilog.info(DOMAIN, LOG_TAG, tag + ' event=' + data?.event + ' code=' + data?.code);
          expect(data?.event).assertEqual('setAbilityInstanceInfo_fail');
          expect(data?.code).assertEqual(201);
          hilog.info(DOMAIN, LOG_TAG, tag + ' success');
          finish(true);
        });
      });
      try {
        await testContext.startAbility({
          bundleName: 'com.acts.ability.setabilityinstanceinfo.demo2',
          abilityName: 'EntryAbility',
          parameters: {
            withGroupId: true
          }
        });
        hilog.info(DOMAIN, LOG_TAG, tag + ' startAbility success');
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, tag + ' startAbility fail ' + JSON.stringify(err));
        commonEventManager.unsubscribe(subscriber, () => {
          finish(false);
        });
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3300
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3300
     * @tc.desc   Expect: 3-arg empty label failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3300', Level.LEVEL0, async (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3300';
      hilog.info(DOMAIN, LOG_TAG, tag + ' it begin');
      await expectThreeArgReject(tag, (): Promise<void> => {
        return testContext.setAbilityInstanceInfo('', pixelMap, 'group_label');
      }, 401, done);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3400
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3400
     * @tc.desc   Expect: 3-arg label null failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3400', Level.LEVEL0, async (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3400';
      hilog.info(DOMAIN, LOG_TAG, tag + ' it begin');
      await expectThreeArgReject(tag, (): Promise<void> => {
        return testContext.setAbilityInstanceInfo(null, pixelMap, 'group_label');
      }, 401, done);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3500
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3500
     * @tc.desc   Expect: 3-arg label undefined failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3500', Level.LEVEL0, async (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3500';
      hilog.info(DOMAIN, LOG_TAG, tag + ' it begin');
      await expectThreeArgReject(tag, (): Promise<void> => {
        return testContext.setAbilityInstanceInfo(undefined, pixelMap, 'group_label');
      }, 401, done);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3600
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3600
     * @tc.desc   Expect: 3-arg label over 1024 bytes failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3600', Level.LEVEL0, async (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3600';
      hilog.info(DOMAIN, LOG_TAG, tag + ' it begin');
      let label = '';
      for (let i = 0; i < 65; i++) {
        label += '0123456789abcdef';
      }
      await expectThreeArgReject(tag, (): Promise<void> => {
        return testContext.setAbilityInstanceInfo(label, pixelMap, 'group_label');
      }, 401, done);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3700
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3700
     * @tc.desc   Expect: 3-arg icon null failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3700', Level.LEVEL0, async (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3700';
      hilog.info(DOMAIN, LOG_TAG, tag + ' it begin');
      await expectThreeArgReject(tag, (): Promise<void> => {
        return testContext.setAbilityInstanceInfo('label_icon', null, 'group_icon');
      }, 401, done);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3800
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3800
     * @tc.desc   Expect: 3-arg icon undefined failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3800', Level.LEVEL0, async (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3800';
      hilog.info(DOMAIN, LOG_TAG, tag + ' it begin');
      await expectThreeArgReject(tag, (): Promise<void> => {
        return testContext.setAbilityInstanceInfo('label_icon', undefined, 'group_icon');
      }, 401, done);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3900
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3900
     * @tc.desc   Expect: 3-arg empty PixelMap failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3900', Level.LEVEL0, async (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_3900';
      hilog.info(DOMAIN, LOG_TAG, tag + ' it begin');
      let emptyBuf: ArrayBuffer = new ArrayBuffer(0);
      let emptyOpts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 0, width: 0 }
      };
      let emptyImg: image.PixelMap = image.createPixelMapSync(emptyBuf, emptyOpts);
      await expectThreeArgReject(tag, (): Promise<void> => {
        return testContext.setAbilityInstanceInfo('label_icon', emptyImg, 'group_icon');
      }, 401, done);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4000
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4000
     * @tc.desc   Expect: 3-arg invalid context failed with code 16000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4000', Level.LEVEL0, async (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4000';
      hilog.info(DOMAIN, LOG_TAG, tag + ' it begin');
      if (!isPc2in1()) {
        done();
        return;
      }
      let fakeContext = { stageMode: true } as common.UIAbilityContext;
      try {
        await fakeContext.setAbilityInstanceInfo('label_ctx', pixelMap, 'group_ctx');
        hilog.info(DOMAIN, LOG_TAG, tag + ' unexpected success');
        expect().assertFail();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, tag + ' err=' + JSON.stringify(err));
        let code = getBizCode(err);
        // Invalid context commonly returns 16000011; some runtimes reject earlier as 401.
        expect(code === 16000011 || code === 401).assertTrue();
        hilog.info(DOMAIN, LOG_TAG, tag + ' success');
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4100
     * @tc.desc   setAbilityInstanceInfo: isStrideAlignment=false true/false成对覆盖;
     *     createPixelMapSync icon then setAbilityInstanceInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4100', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4100';
      hilog.info(DOMAIN, LOG_TAG, tag + ' it begin');
      let editOpts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 64, width: 64 }
      };
      let editMap: image.PixelMap = image.createPixelMapSync(color, editOpts);
      expect(editMap.isEditable).assertEqual(true);
      expect(editMap.isStrideAlignment).assertEqual(false);
      if (!isPc2in1()) {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('label_stride_false', editMap);
        hilog.info(DOMAIN, LOG_TAG, tag + ' success');
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, 'setAbilityInstanceInfo failed: ' + JSON.stringify(err));
        expect(getBizCode(err) === 401 || getBizCode(err) === 801 ||
          getBizCode(err) === 16000011 || getBizCode(err) === 201).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4200
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4200
     * @tc.desc   setAbilityInstanceInfo: isStrideAlignment=false true/false成对覆盖;
     *     editable=false createPixelMapSync then setAbilityInstanceInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4200';
      hilog.info(DOMAIN, LOG_TAG, tag + ' it begin');
      let roOpts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 64, width: 64 }
      };
      let roMap: image.PixelMap = image.createPixelMapSync(color, roOpts);
      expect(roMap.isEditable).assertEqual(false);
      expect(roMap.isStrideAlignment).assertEqual(false);
      if (!isPc2in1()) {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('label_stride_false_ro', roMap);
        hilog.info(DOMAIN, LOG_TAG, tag + ' success');
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, 'setAbilityInstanceInfo failed: ' + JSON.stringify(err));
        expect(getBizCode(err) === 401 || getBizCode(err) === 801 ||
          getBizCode(err) === 16000011 || getBizCode(err) === 201).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4300
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4300
     * @tc.desc   setAbilityInstanceInfo: isStrideAlignment=true true/false成对覆盖;
     *     createPixelMapUsingAllocatorSync(DMA) then setAbilityInstanceInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4300', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_4300';
      hilog.info(DOMAIN, LOG_TAG, tag + ' it begin');
      const smallColor: ArrayBuffer = new ArrayBuffer(96);
      let dmaOpts: image.InitializationOptions = {
        editable: true,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 }
      };
      let dmaMap: image.PixelMap =
        image.createPixelMapUsingAllocatorSync(smallColor, dmaOpts, image.AllocatorType.DMA);
      expect(dmaMap.isStrideAlignment).assertEqual(true);
      if (!isPc2in1()) {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('label_stride_true', dmaMap);
        hilog.info(DOMAIN, LOG_TAG, tag + ' success');
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, 'setAbilityInstanceInfo failed: ' + JSON.stringify(err));
        expect(getBizCode(err) === 401 || getBizCode(err) === 801 ||
          getBizCode(err) === 16000011 || getBizCode(err) === 201).assertTrue();
        done();
      }
    })
  })
}