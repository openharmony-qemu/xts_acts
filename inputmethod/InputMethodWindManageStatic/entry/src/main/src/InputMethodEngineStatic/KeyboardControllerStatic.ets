'use static';

import { inputMethodEngine, InputMethodExtensionContext, InputMethodSubtype } from '@kit.IMEKit';
import display from '@ohos.display';
import windowManager from '@ohos.window';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import util from '@ohos.util';
import { window } from '@kit.ArkUI';
import Want from '@ohos.app.ability.Want';
import { LocalStorage } from '@ohos.arkui.stateManagement';
import Utils from '../test/Util.test';
let domain: int = 0x0000;
let TAG: string = 'keyboardControllerStatic';


let inputMethodAbility: inputMethodEngine.InputMethodAbility | null = inputMethodEngine.getInputMethodAbility();
let inputKeyboardDelegate: inputMethodEngine.KeyboardDelegate | null = inputMethodEngine.getKeyboardDelegate();

export class KeyboardControllerStatic {
  private mContext: InputMethodExtensionContext | undefined = undefined;
  private windowName: string = 'inputApp';
  private windowHeight: int = 0;
  private windowWidth: int = 0;
  private nonBarPosition: int = 0;
  private keyboardController: inputMethodEngine.KeyboardController | undefined;
  private InputClient: inputMethodEngine.InputClient | undefined;
  private capitalizeMode: inputMethodEngine.CapitalizeMode | undefined;
  private placeholder: string = '';
  private abilityName: string = '';
  private displayInfo: display.Display | null = display.getDefaultDisplaySync();
  private softKeyboardPanel: inputMethodEngine.Panel | null = null;
  private STATUS_BARPanel: inputMethodEngine.Panel | null = null;
  private immersive: int = 0;
  private storage: LocalStorage;


  constructor(context: InputMethodExtensionContext) {
    this.mContext = context;
    this.storage = new LocalStorage();
    this.storage.setOrCreate('storageSimplePorp', 121);
    this.windowWidth = this.displayInfo!.width.toInt();
    this.windowHeight = Math.floor(this.displayInfo!.height * 0.45).toInt();
  }

  private newArrayBuffer = (str: string | undefined): ArrayBuffer => {
    let arrayBuffer = new ArrayBuffer(0);
    if(str === undefined){
      const view = new Uint8Array(arrayBuffer);
    }else{
      arrayBuffer = new ArrayBuffer(str.length);
      const view = new Uint8Array(arrayBuffer);
      for(let i=0; i<str.length; i++){
        view[i] = str.charCodeAt(i);
      }
    }
    return arrayBuffer;
  }


  private GetArrayBufferString = (buffer: ArrayBuffer): string => {
     console.info(`${TAG} ====> GetArrayBufferString buffer: ${JSON.stringify(buffer)}`);
     const decoder = util.TextDecoder.create('"utf-8"');
     const str = decoder.decodeToString(new Uint8Array(buffer));
     return str
  }

  private async testTemplete(testName: string, assertFunction: ()=> Promise<boolean>): Promise<void>{
    console.info(`${TAG} ====> receive: ${testName}`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData ={
      data: 'FAILED'
    };
    try {
      if (await assertFunction()=== true) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    }catch (err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(`${TAG} ====> ${testName} catch err: ${JSON.stringify(err)}`);
    }
    commonEventManager.publish(testName, commonEventPublishData, this.publishCallback);
  }

  private async wrapAssertWithTwoIn1Judgement1(assertRunnable: () => Promise<boolean>): Promise<() => Promise<boolean>> {
    return () => assertRunnable();
  }

  public onCreate(): void {
    let that = this;

    let panelInfo: inputMethodEngine.PanelInfo = {
      type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
      flag: inputMethodEngine.PanelFlag.FLG_FLOATING
    }

    inputMethodAbility!.createPanel(this.mContext!, panelInfo, (err: BusinessError<void> | null, panel: inputMethodEngine.Panel | undefined) => {
      if(err){
        console.info(`${TAG} ====> Failed to create panel. err.code: ${err?.code}, err.message: ${err?.message}`);
      }
      this.softKeyboardPanel = panel as inputMethodEngine.Panel;
      console.info(`${TAG} ====> Succeed in creating panel.  panel: ${JSON.stringify(this.softKeyboardPanel)}`);
    })

    try{
      let subscriberCallback = (err: BusinessError | null,
        data: commonEventManager.CommonEventData | undefined | null) => {
          console.info(`${TAG} ====> receive event data.  panel: ${JSON.stringify(data)}`);
          if(data != undefined) {
            switch (data.code) {
              case 1:
                console.info(`${TAG} ====> SUB_InputMethod_IsTextPreviewSupport_static_0101 event: ${JSON.stringify(data.event)}`);
                that.SUB_InputMethod_IsTextPreviewSupport_static_0101();
                break;
              case 2:
                console.info(`${TAG} ====> SUB_InputMethod_IsTextPreviewSupport_static_0201 event: ${JSON.stringify(data.event)}`);
                that.SUB_InputMethod_IsTextPreviewSupport_static_0201();
                break;
              case 3:
                console.info(`${TAG} ====> SUB_InputMethod_IsTextPreviewSupport_static_0301 event: ${JSON.stringify(data.event)}`);
                that.SUB_InputMethod_IsTextPreviewSupport_static_0301();
                break;
              case 4:
                console.info(`${TAG} ====> SUB_InputMethod_IsTextPreviewSupport_static_0401 event: ${JSON.stringify(data.event)}`);
                that.SUB_InputMethod_IsTextPreviewSupport_static_0401();
                break;
              case 5:
                console.info(`${TAG} ====> Sub_InputMethod_IMF_SecurityKeyboard_static_0600 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IMF_SecurityKeyboard_static_0600();
                break;
              case 6:
                console.info(`${TAG} ====> Sub_InputMethod_IMF_SecurityKeyboard_static_0700 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IMF_SecurityKeyboard_static_0700();
                break;
              case 7:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_0100 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_0100();
                break;
              case 8:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_0200 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_0200();
                break;
              case 9:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_0300 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_0300();
                break;
              case 10:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_0400 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_0400();
                break;
              case 11:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_0500 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_0500();
                break;
              case 12:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_0600 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_0600();
                break;
              case 13:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_0700 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_0700();
                break;
              case 14:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_0800 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_0800();
                break;
              case 15:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_0900 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_0900();
                break;
              case 16:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_1000 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_1000();
                break;
              case 17:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_1100 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_1100();
                break;
              case 18:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_1200 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_1200();
                break;
              case 19:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_1300 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_1300();
                break;
              case 20:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_1400 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_1400();
                break;
              case 21:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_1500 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_1500();
                break;
              case 22:
                console.info(`${TAG} ====> Sub_InputMethod_IME_updatePanelRectSync_static_1600 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_updatePanelRectSync_static_1600();
                break;
            }
          }
        }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['keyboardControllerStatic']
      };

      let subscriber: commonEventManager.CommonEventSubscriber;
      try{
        let data = commonEventManager.createSubscriberSync(commonEventSubscribeInfo);
        if(data != undefined) {
          subscriber = data as commonEventManager.CommonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info(`${TAG} ====> scene subscribe finish!`);
        }
      } catch(error){
        let err: BusinessError = error as BusinessError;
        console.info(`${TAG} ====>createSubscriber err: ${JSON.stringify(err.message)}`);
      }
    }catch(err){
      console.info(`${TAG} ====>createSubscriber err: ${JSON.stringify(err.message)}`);
    }

    inputMethodAbility!.onInputStart((controller: inputMethodEngine.KeyboardController,
      inputClient: inputMethodEngine.InputClient): void=>{
        this.keyboardController = controller;
        this.InputClient = inputClient;
        console.info(`${TAG} ====> inputMethodAbility inputStart into!`);
      })    
  }

  private publishCallback = (err: BusinessError | null): void => {
    if (err) {
      console.error(`${TAG} ====>publish failed: ${JSON.stringify(err)}`);
      return;
    }
    console.debug(`${TAG} ====>publish commonevent Succeed`);      
  }

  private async wrapAssertWithTwoIn1Judgement(assertRunnable: () => Promise<boolean>): Promise<() => Promise<boolean>>{
    try{
      return ()=> assertRunnable();
    } catch (err) {
      console.info(TAG + '====>catch err:' + JSON.stringify(err));
      return ()=> Promise.resolve(false);
    }
  }

  public onDestroy(): void {
    console.debug(`${TAG} ====>onDestroy`);
  }

  private Sub_InputMethod_IMF_SecurityKeyboard_static_0600(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_static_0600 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          let isPrivacyMode: boolean = true;
          this.softKeyboardPanel!.setPrivacyMode(isPrivacyMode);
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_static_0600 success switch to PrivacyMode');
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        } catch (err) {
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_static_0600 Failed to set privacy mode' + err);
        };
      } else {
        console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_static_0600 this.softKeyboardPanel is null');
      }
      commonEventManager.publish('Sub_InputMethod_IMF_SecurityKeyboard_static_0600', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_static_0600 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_InputMethod_IMF_SecurityKeyboard_static_0600', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_InputMethod_IMF_SecurityKeyboard_static_0700(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_static_0700 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          let isPrivacyMode: boolean = false;
          this.softKeyboardPanel!.setPrivacyMode(isPrivacyMode);
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_static_0700 success switch to PrivacyMode');
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        } catch (err) {
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_static_0700 Failed to set privacy mode' + err);
        };
      } else {
        console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_static_0700 this.softKeyboardPanel is null');
      };
      commonEventManager.publish('Sub_InputMethod_IMF_SecurityKeyboard_static_0700', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_static_0700 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_InputMethod_IMF_SecurityKeyboard_static_0700', commonEventPublishData, this.publishCallback);
    }
  }

  async SUB_InputMethod_IsTextPreviewSupport_static_0101() {
    let caseName = 'SUB_InputMethod_IsTextPreviewSupport_static_0101';
    console.info(TAG + `====>${caseName} start`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let range: inputMethodEngine.Range = { start: 1, end: 2 }
      await this.InputClient!.setPreviewText('adc|03', range);
      console.info(TAG + `====>${caseName} success`);
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>${caseName} catch err.code:${ err.code} err.message:${ err.message}`);
      if (err.code === 12800011) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    }
  }

  async SUB_InputMethod_IsTextPreviewSupport_static_0201() {
    let caseName = 'SUB_InputMethod_IsTextPreviewSupport_static_0201';
    console.info(TAG + `====>${caseName} start`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let range: inputMethodEngine.Range = { start: 1, end: 2 };
      this.InputClient!.setPreviewTextSync('adc|03', range);
      console.info(TAG + `====>${caseName} success`);
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>${caseName} catch err.code:${ err.code} err.message:${ err.message}`);
      if (err.code === 12800011) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    }
  }

  async SUB_InputMethod_IsTextPreviewSupport_static_0301() {
    let caseName = 'SUB_InputMethod_IsTextPreviewSupport_static_0301';
    console.info(TAG + `====>${caseName} start`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient!.finishTextPreview();
      console.info(TAG + `====>${caseName} success`);
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>${caseName} catch err.code:${ err.code} err.message:${ err.message}`);
      if (err.code === 12800011) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    }
  }

  async SUB_InputMethod_IsTextPreviewSupport_static_0401() {
    let caseName = 'SUB_InputMethod_IsTextPreviewSupport_static_0401';
    console.info(TAG + `====>${caseName} start`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient!.finishTextPreviewSync();
      console.info(TAG + `====>${caseName} success`);
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>${caseName} catch err.code:${ err.code} err.message:${ err.message}`);
      if (err.code === 12800011) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_0100 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 },
        landscapeInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        portraitInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        fullScreenMode: false
      };
      this.softKeyboardPanel!.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_0100 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_0100 err.code:${err.code},err.message:${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_0100', commonEventPublishData, this.publishCallback);
  }


  private async Sub_InputMethod_IME_updatePanelRectSync_static_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_0200 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.displayInfo!.width.toInt(),
        height: (this.displayInfo!.height * 0.4).toInt() },
        portraitRect: { left: 100, top: 100, width: (this.displayInfo!.height * 0.4).toInt(),
        height: this.displayInfo!.width.toInt() },
        landscapeInputRegion: [{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600 }],
        portraitInputRegion: [{ left: 0, top: 500, width: this.displayInfo!.width.toInt(), height: 760 }],
        fullScreenMode: false
      };
      this.softKeyboardPanel!.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FLOATING, enhancedPanelRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_0200 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_0200 err.code:${err.code},err.message:${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_0300 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 300 },
        portraitRect: { left: 0, top: 1500, width: 300, height: 1000 },
        landscapeAvoidY: 500,
        landscapeInputRegion: [{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600 },
        { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150 }],
        portraitAvoidY: 1950,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760 },
        { left: 0, top: 1695, width: this.displayInfo!.width.toInt(), height: 150 }],
        fullScreenMode: true
      };
      this.softKeyboardPanel!.updatePanelRectSync(inputMethodEngine.PanelFlag.FLAG_CANDIDATE, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_0300 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_0300 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 12800017) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_0400 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        portraitRect: { left: 0, top: 0, width: this.displayInfo!.width.toInt(),
        height: (this.displayInfo!.height * 0.5).toInt() },
        landscapeAvoidY: 500,
        landscapeInputRegion: [{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600 },
        { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150 }],
        portraitAvoidY: 1960,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760 },
        { left: 0, top: 1695, width: this.displayInfo!.width.toInt(), height: 150 }],
      };
      this.softKeyboardPanel!.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FLOATING, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_0400 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_0400 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_0400', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_0500 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 }
      };
      this.softKeyboardPanel!.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FIXED, keyboardRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_0500 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_0500 err.code:${err.code},err.message:${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_0500', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_0600(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_0600 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.displayInfo!.width.toInt(),
        height: (this.displayInfo!.height * 0.4).toInt() },
        portraitRect: { left: 100, top: 100, width: (this.displayInfo!.height * 0.4).toInt(),
        height: this.displayInfo!.width.toInt() }
      };
      this.softKeyboardPanel!.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FLOATING, keyboardRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_0600 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_0600 err.code:${err.code},err.message:${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_0600', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_0700(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_0700 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.displayInfo!.width.toInt(),
        height: (this.displayInfo!.height * 0.4).toInt() },
        portraitRect: { left: 100, top: 100, width: (this.displayInfo!.height * 0.4).toInt(),
        height: this.displayInfo!.width.toInt() }
      };
      this.softKeyboardPanel!.updatePanelRectSync(inputMethodEngine.PanelFlag.FLAG_CANDIDATE, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_0700 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_0700 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_0700', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_0800(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_0800 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: (this.displayInfo!.width * 10).toInt(),
        height: (this.displayInfo!.height * 10).toInt() },
        portraitRect: { left: 100, top: 100, width: (this.displayInfo!.height * 10).toInt(),
        height: (this.displayInfo!.width * 10).toInt() }
      };
      this.softKeyboardPanel!.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FLOATING, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_0800 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_0800 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_0800', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_0900(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_0900 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 }
      };
      await this.softKeyboardPanel!.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, keyboardRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_0900 startAbility success');
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_0900', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_0900 err.code:${err.code},err.message:${err.message}`);
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_0900', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_1000(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_1000 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.displayInfo!.width.toInt(),
        height: (this.displayInfo!.height * 0.4).toInt() },
        portraitRect: { left: 100, top: 100, width: (this.displayInfo!.height * 0.4).toInt(),
        height: this.displayInfo!.width.toInt() }
      };
      await this.softKeyboardPanel!.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, keyboardRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_1000 startAbility success');
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1000', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_1000 err.code:${err.code},err.message:${err.message}`);
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1000', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_1100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_1100 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.displayInfo!.width.toInt(),
        height: (this.displayInfo!.height * 0.4).toInt() },
        portraitRect: { left: 100, top: 100, width: (this.displayInfo!.height * 0.4).toInt(),
        height: this.displayInfo!.width.toInt() }
      };
      await this.softKeyboardPanel!.updatePanelRect(inputMethodEngine.PanelFlag.FLAG_CANDIDATE, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_1100 updatePanelRectSync success');
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1100', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_1100 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1100', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_1200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_1200 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: (this.displayInfo!.width * 10).toInt(),
        height: (this.displayInfo!.height * 10).toInt() },
        portraitRect: { left: 100, top: 100, width: (this.displayInfo!.height * 10).toInt(),
        height: (this.displayInfo!.width * 10).toInt() }
      };
      await this.softKeyboardPanel!.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_1200 updatePanelRectSync success');
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1200', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_1200 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1200', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_1300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_1300 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 },
        landscapeInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        portraitInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        fullScreenMode: false
      };
      await this.softKeyboardPanel!.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_1300 updatePanelRectSync success');
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1300', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_1300 err.code:${err.code},err.message:${err.message}`);
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1300', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_1400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_1400 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.displayInfo!.width.toInt(),
        height: (this.displayInfo!.height * 0.4).toInt() },
        portraitRect: { left: 100, top: 100, width: (this.displayInfo!.height * 0.4).toInt(),
        height: this.displayInfo!.width.toInt() },
        landscapeInputRegion: [{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600 }],
        portraitInputRegion: [{ left: 0, top: 500, width: this.displayInfo!.width.toInt(), height: 760 }],
        fullScreenMode: false
      };
      await this.softKeyboardPanel!.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, enhancedPanelRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_1400 updatePanelRectSync success');
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1400', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_1400 err.code:${err.code},err.message:${err.message}`);
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1400', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_1500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_1500 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 300 },
        portraitRect: { left: 0, top: 1500, width: 300, height: 1000 },
        landscapeAvoidY: 500,
        landscapeInputRegion: [{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600 },
        { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150 }],
        portraitAvoidY: 1950,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760 },
        { left: 0, top: 1695, width: this.displayInfo!.width.toInt(), height: 150 }],
        fullScreenMode: true
      };
      await this.softKeyboardPanel!.updatePanelRect(inputMethodEngine.PanelFlag.FLAG_CANDIDATE, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_1500 updatePanelRectSync success');
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1500', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_1500 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 12800017) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1500', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_static_1600(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_static_1600 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        portraitRect: { left: 0, top: 0, width: this.displayInfo!.width.toInt(),
        height: (this.displayInfo!.height * 0.5).toInt() },
        landscapeAvoidY: 500,
        landscapeInputRegion: [{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600 },
        { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150 }],
        portraitAvoidY: 1960,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760 },
        { left: 0, top: 1695, width: this.displayInfo!.width.toInt(), height: 150 }],
      };
      await this.softKeyboardPanel!.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_static_1600 updatePanelRectSync success');
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1600', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_static_1600 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish('Sub_InputMethod_IME_updatePanelRectSync_static_1600', commonEventPublishData, this.publishCallback);
    };
  }

}