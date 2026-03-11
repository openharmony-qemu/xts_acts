 'use static'

import { inputMethodEngine, InputMethodExtensionContext, InputMethodSubtype } from '@kit.IMEKit';
import display from '@ohos.display';
import windowManager from '@ohos.window';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { util } from '@kit.ArkTs';
import { window } from '@kit.ArkUI';
import Want from '@ohos.app.ability.Want';
let domain: int = '0x0000';
let TAG: string = 'keyboardControllerStatic';


let inputMethodAbility: inputMethodEngine.InputMethodAbility = inputMethodEngine.getInputMethodAbility();
let inputKeyboardDelegate: inputMethodEngine.KeyboardDelegate = inputMethodEngine.getKeyboardDelegate();

export class KeyboardControllerStatic {
  private mContext: InputMethodExtensionContext | undefined = undefined;
  windowName = 'inputApp';
  private windowHeight: int = 0;
  private windowWidth: int = 0;
  private nonBarPosition: int = 0;
  private keyboardController: inputMethodEngine.keyboardController | undefined;
  private InputClient: inputMethodEngine.InputClient | undefined;
  private capitalizeMode: inputMethodEngine.capitalizeMode | undefined;
  private placeholder: string = '';
  private abilityName: string = '';
  private display_info: display.Display | null = display.getDefaultDisplaySync();
  private softkeyboardPanel: inputMethodEngine.Panel | null = null;
  private immersive: int = 0;


  constructor(context: InputMethodExtensionContext) {
    this.mContext = context;
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
     console.info(`${TAG} ====> GetArrayBufferString buffer: ${JSON.stringify(buffererr)}`);
     const decoder = util.TextDecoder.create('"utf-8"');
     const str = decode.decodeToString(new Uint8Array(buffer));
     return str
  }

  private async testTemplete(testName: string, assertFunction: ()=> Promise<boolean>): Promise<void>{
    console.info(`${TAG} ====> receive: ${testName}`);
    let commonEventPublishData: commonEventManager.commonEventPublishData ={
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
      console.info(`${TAG} ====> ${testName} catch err: ${JSON.stringify(buffererr)}`);
    }
    commonEventManager.publish(testName, commonEventPublishData, this.publishCallback);
  }

  public onCreate(): void {
    let that = this;

    let panelInfo: inputMethodEngine.PanelInfo = {
      type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
      flag: inputMethodEngine.PanelFlag.FLG_FIXED
    }

    inputMethodAbility!.createPanel(this.mContext!, panelInfo, (err: BusinessError | null, panel: inputMethodEngine.Panel | null) => {
      if(err !== undefined){
        console.info(`${TAG} ====> Failed to create panel. err: ${JSON.stringify(err)}`);
      }
      this.softkeyboardPanel = panel as inputMethodEngine.Panel;
      this.softkeyboardPanel!.setUIContent('testability/pages/Second', async (err: BusinessError): void => {
        console.info(`${TAG} ====> Succeed in creating panel.  panel: ${JSON.stringify(panel)}`);
      })      
    })

    try{
      let subscriberCallback = (err: BusinessError | null, data: commonEventManager.CommonEventData | undefined | null) => {
        console.info(`${TAG} ====> receive event data.  panel: ${JSON.stringify(data)}`);
        if(data != undefined) {
          switch (data.code) {
            case 1:
              console.info(`${TAG} ====> inputMethodEngine_test_static_038 event: ${JSON.stringify(data.event)}`);
              that.inputMethodEngine_test_static_038();
              break;
            case 2:
              console.info(`${TAG} ====> Sub_InputMethod_IME_createPanelCallback_static_0100 event: ${JSON.stringify(data.event)}`);
              that.Sub_InputMethod_IME_createPanelCallback_static_0100();
              break;
            case 3:
              console.info(`${TAG} ====> Sub_InputMethod_IME_PrivateDateTransferred_static_0500 event: ${JSON.stringify(data.event)}`);
              that.Sub_InputMethod_IME_PrivateDateTransferred_static_0500();
              break;
            case 4:
              console.info(`${TAG} ====> Sub_InputMethod_IME_PrivateDateTransferred_static_0600 event: ${JSON.stringify(data.event)}`);
              that.Sub_InputMethod_IME_PrivateDateTransferred_static_0600();
              break;
            case 5:
              console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0900 event: ${JSON.stringify(data.event)}`);
              that.Sub_InputMethod_IME_Custom_static_0900();
              break;
            case 6:
              console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0200 event: ${JSON.stringify(data.event)}`);
              that.Sub_InputMethod_IME_Custom_static_0200();
              break;
            case 7:
              console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0800 event: ${JSON.stringify(data.event)}`);
              that.Sub_InputMethod_IME_Custom_static_0800();
              break;
            case 8:
              console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0400 event: ${JSON.stringify(data.event)}`);
              that.Sub_InputMethod_IME_Custom_static_0400();
              break;
            case 9:
              console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0300 event: ${JSON.stringify(data.event)}`);
              that.Sub_InputMethod_IME_Custom_static_0300();
              break;
            case 10:
              console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_1100 event: ${JSON.stringify(data.event)}`);
              that.Sub_InputMethod_IME_Custom_static_1100();
              break;
            case 11:
              console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0901 event: ${JSON.stringify(data.event)}`);
              that.Sub_InputMethod_IME_Custom_static_0901();
              break;
            case 12:
              console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0902 event: ${JSON.stringify(data.event)}`);
              that.Sub_InputMethod_IME_Custom_static_0902();
              break;            
          }
        }
      }

      let commonEventSubscribeInfo: commonEventManager.commonEventSubscribeInfo = {
        enents: ['keyboardControllerStatic']
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

    inputMethodAbility!.onInputStart((controller: inputMethodEngine.keyboardController, inputClient: inputMethodEngine.InputClient): void=>{
      this.keyboardController = controller;
      this.InputClient = inputClient;
      console.info(`${TAG} ====> inputMethodAbility inputStart into!`);
    })    
  }

  private publishCallback(err: BusinessError | null): void {
    if (err) {
      console.error(`${TAG} ====>publish failed: ${JSON.stringify(err)}`);
      return;
    }
    console.debug(`${TAG} ====>publish commonevent Succeed`);      
  }

  private async wrapAssertWithTwoIn1Judgement(assertRunnable: () => Promise<boolean>): Promise<boolean>>{
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
  
  async inputMethodEngine_test_static_038(): Promise<void> {
    console.info(`${TAG} ====>receive inputMethodEngine_test_static_038`);
    let commonEventPublishData: commonEventManager.commonEventPublishData = {
      data: 'FAILED'
    }
    this.InputClient!getEditorAttribute((err: BusinessError, value)=>{
      if (err){
        console.info(`${TAG} ====>receive inputMethodEngine_test_static_038 getEditorAttribute err: ${JSON.stringify(err)}`);
      } else {
        console.info(`${TAG} ====>receive inputMethodEngine_test_static_038 getEditorAttribute value: ${JSON.stringify(value)}`);
        if (value) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
      }
      commonEventManager.publish('inputMethodEngine_test_static_038', commonEventPublishData, this.publishCallback);
    })
  }

  private async Sub_InputMethod_IME_createPanelCallback_static_0100(): Promise<void> {
    let commonEventPublishData: commonEventManager.commonEventPublishData = {
      data: 'FAILED'
    }
    let panelInfo1: inputMethodEngine.PanelInfo = {
      type: inputMethodEngine.PanelType.STATUS_BAR,
      flag: inputMethodEngine.PanelFlag.GLG_FLOATING
    };
    console.info(`${TAG} ====>receive Sub_InputMethod_IME_createPanelCallback_static_0100`);
    try {
      InputMethodAbility?.createPanel(this.mContext!, panelInfo1, (err: BusinessError<void> | null, panel: inputMethodEngine.Panel | undefined) => {
        console.info(`${TAG} ====>Sub_InputMethod_IME_createPanelCallback_static_0100 createPanel success!`);
        if (err) {
          console.info(`${TAG} ====>Sub_InputMethod_IME_createPanelCallback_static_0100 createPanel err: ${JSON.stringify(err)}`);          
        } else {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(`${TAG} ====>Sub_InputMethod_IME_createPanelCallback_static_0100 createPanel: ${JSON.stringify(panel)}`);
        };
        if (panel !== undefined) {
          inputMethodAbility!.detroyPanel(panel);
        }
        commonEventManager.publish('Sub_InputMethod_IME_createPanelCallback_static_0100', commonEventPublishData, this.publishCallback);
      })
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_createPanelCallback_static_0100 catch err: ${JSON.stringify(error)}`);
      commonEventManager.publish('Sub_InputMethod_IME_createPanelCallback_static_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PrivateDateTransferred_static_0500(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0500`);
    let commonEventPublishData: commonEventManager.commonEventPublishData = {
      data: 'FAILED'
    };
    let record: Record<string, inputMethodEngine.CommonDataType> = {
      "valueString1": "abcdefg",
      "valueString2": true,
      "valueString3": 500,
      "valueString4": "abcdefgg",
      "valueString5": true,
    }
    try {
      await this.InputClient!.sendPrivateCommond(record);
      console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0500 sendPrivateCommond success`);
      commonEventManager.publish('Sub_InputMethod_IME_PrivateDateTransferred_static_0500', commonEventPublishData, this.publishCallback); 

    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0500 catch err: ${JSON.stringify(err)}`);
      if (err.code === 12800010) {
        commonEventPublishData = {
            data: 'SUCCESS'
          };
      }
      commonEventManager.publish('Sub_InputMethod_IME_PrivateDateTransferred_static_0500', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PrivateDateTransferred_static_0600(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0600`);
    let commonEventPublishData: commonEventManager.commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient!.onPrivateCommond(async (record: Record<string, inputMethodEngine.CommonDataType>): void => {
        console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0600 onPrivateCommond into`);
        inputMethodAbility!.offPrivateCommond();
      });
      console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0600 sendPrivateCommond success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0600 catch err: ${JSON.stringify(err)}`);
      if (err.code === 12800010) {
        commonEventPublishData = {
            data: 'SUCCESS'
          };
      }      
    }
    commonEventManager.publish('Sub_InputMethod_IME_PrivateDateTransferred_static_0600', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Custom_static_0900(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0900`);
    let commonEventPublishData: commonEventManager.commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0900 onTerminated`);
        },
        onMessage(msgId: string): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0900 onMessage msgId: ${msgId}`);
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0900 onMessage msgIdSize: ${msgId.length}`);
          if (msgId === "Sub_InputMethod_IME_Custom_static_0900") {
            console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0900 start sendMessage`);
            that.InputClient!.sendMessage("Sub_InputMethod_IME_Custom_static_0900", that.newArrayBuffer('SUCCESS'));
          } else {
            that.InputClient!.sendMessage("Sub_InputMethod_IME_Custom_static_0900", that.newArrayBuffer('FAILED'));
          }
          that.InputClient!.recvMessage();
        }
      };
      that.InputClient!.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0900 recvMessage err: ${JSON.stringify(err)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0900', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Custom_static_0200(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0200`);
    let commonEventPublishData: commonEventManager.commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0200 onTerminated`);
        },
        onMessage(msgId: string): void {
          let bufferString = that.GetArrayBufferString(msgParam as ArrayBuffer);
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0200 onMessage msgIdSize: ${msgId.length}`);
          if (msgId.length === 256 && msgParam?.byteLength === 131072) {
            console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0200 start sendMessage`);
            that.InputClient!.sendMessage("Sub_InputMethod_IME_Custom_static_0200", that.newArrayBuffer('SUCCESS'));
          } else {
            that.InputClient!.sendMessage("Sub_InputMethod_IME_Custom_static_0200", that.newArrayBuffer('FAILED'));
          }
          that.InputClient!.recvMessage();
        }
      };
      that.InputClient!.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0200 recvMessage err: ${JSON.stringify(err)}`);
    }
    commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Custom_static_0800(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0800`);
    let commonEventPublishData: commonEventManager.commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0800 onTerminated`);
        },
        onMessage(msgId: string): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0800 onMessage msgIdSize: ${msgId.length}`);
          if (msgId.length === 0 && msgParam?.byteLength === 131072) {
            console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0800 start sendMessage`);
            that.InputClient!.sendMessage("Sub_InputMethod_IME_Custom_static_0800", that.newArrayBuffer('SUCCESS'));
          } else {
            that.InputClient!.sendMessage("Sub_InputMethod_IME_Custom_static_0800", that.newArrayBuffer('FAILED'));
          }
          that.InputClient!.recvMessage();
        }
      };
      that.InputClient!.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0800 recvMessage err: ${JSON.stringify(err)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0800', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Custom_static_0400(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0400`);
    let commonEventPublishData: commonEventManager.commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0400 onTerminated`);
        },
        onMessage(msgId: string): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0400 onMessage msgIdSize: ${msgId.length}`);
          that.InputClient!.recvMessage();
        }
      };
      that.InputClient!.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0400 recvMessage err: ${JSON.stringify(err)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0400', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Custom_static_0300(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0300`);
    let commonEventPublishData: commonEventManager.commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0300 onTerminated`);
        },
        onMessage(msgId: string): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0300 onMessage msgIdSize: ${msgId.length}`);
          that.InputClient!.recvMessage();
        }
      };
      that.InputClient!.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0300 recvMessage err: ${JSON.stringify(err)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0300', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Custom_static_1100(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_1100`);
    let commonEventPublishData: commonEventManager.commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_1100 onTerminated`);
        },
        onMessage(msgId: string): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_1100 onMessage msgIdSize: ${msgId.length}`);
          if (msgId.length === 256 && msgParam?.byteLength === undefined) {
            console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_1100 start sendMessage`);
            that.InputClient!.sendMessage("Sub_InputMethod_IME_Custom_static_1100", that.newArrayBuffer('SUCCESS'));
          } else {
            that.InputClient!.sendMessage("Sub_InputMethod_IME_Custom_static_1100", that.newArrayBuffer('FAILED'));
          }
          that.InputClient!.recvMessage();
        }
      };
      that.InputClient!.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_1100 recvMessage err: ${JSON.stringify(err)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_1100', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Custom_static_0901(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0901`);
    let commonEventPublishData: commonEventManager.commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let msgId: string = "testMsgId";
      let msgParam: ArrayBuffer = new ArrayBuffer(128);
      await this.InputClient!.sendMessage(msgId, msgParam);
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0901 sendMessage success`);
    } catch (error) {
      if (error.code === 12800016) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0901 recvMessage err: ${JSON.stringify(err)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0901', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Custom_static_0902(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0902`);
    let commonEventPublishData: commonEventManager.commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let msgId: string = "testMsgId";
      let msgParam: ArrayBuffer = new ArrayBuffer(128);
      await this.InputClient!.sendMessage(msgId, msgParam);
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0902 sendMessage success`);
    } catch (error) {
      if (error.code === 12800015) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0902 recvMessage err: ${JSON.stringify(err)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0902', commonEventPublishData, this.publishCallback);
    }, 100)
  }

}